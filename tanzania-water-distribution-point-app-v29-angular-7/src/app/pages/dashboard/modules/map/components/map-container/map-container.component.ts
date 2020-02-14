import {
  Component,
  ChangeDetectionStrategy,
  OnInit,
  OnChanges,
  SimpleChanges,
  Input,
  AfterViewInit
} from '@angular/core';
import { VisualizationObject } from '../../models/visualization-object.model';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs/Observable';
import * as fromStore from '../../store';
import * as fromUtils from '../../utils';
import { getTileLayer } from '../../constants/tile-layer.constant';
import { MapConfiguration } from '../../models/map-configuration.model';
import * as fromLib from '../../lib';
import * as L from 'leaflet';
import * as _ from 'lodash';
import { interval } from 'rxjs/observable/interval';

@Component({
  selector: 'app-map-container',
  changeDetection: ChangeDetectionStrategy.OnPush,
  templateUrl: './map-container.component.html',
  styleUrls: ['./map-container.component.css'],
  styles: [
    `:host {
      display: block;
      width: 100%;
      height: 100%;
    }
  }`
  ]
})
export class MapContainerComponent implements OnChanges, OnInit, AfterViewInit {
  @Input()
  visualizationObject: VisualizationObject;
  @Input()
  displayConfigurations: any;

  public visualizationLegendIsOpen$: Observable<boolean>;
  public isDataTableOpen$: Observable<boolean>;
  public baseLayerLegend$: Observable<any>;
  public mapHasGeofeatures: boolean;
  public mapHasDataAnalytics: boolean;
  private _visualizationObject: VisualizationObject;
  private leafletLayers: any = {};
  private layersBounds;
  private basemap: any;

  public map: any;

  constructor(private store: Store<fromStore.MapState>) {
    this.mapHasGeofeatures = true;
    this.mapHasDataAnalytics = true;
  }

  ngOnChanges(changes: SimpleChanges) {
    const { visualizationObject } = changes;
    this._visualizationObject = visualizationObject.currentValue;
    this.createMap();
    if (visualizationObject && !visualizationObject.isFirstChange()) {
      this.redrawMapOndataChange(visualizationObject.currentValue);
    }
  }

  ngOnInit() {
    this.visualizationLegendIsOpen$ = this.store.select(
      fromStore.isVisualizationLegendOpen(this._visualizationObject.componentId)
    );
    this.baseLayerLegend$ = this.store.select(fromStore.getCurrentBaseLayer(this._visualizationObject.componentId));

    this.isDataTableOpen$ = this.store.select(fromStore.isDataTableOpen(this._visualizationObject.componentId));

    this.store
      .select(fromStore.getCurrentBaseLayer(this._visualizationObject.componentId))
      .subscribe(baselayerLegend => {
        if (baselayerLegend && this.basemap) {
          const { name, opacity, changedBaseLayer, hidden } = baselayerLegend;
          if (changedBaseLayer) {
            const baseMapLayer = this.createBaseLayer(name);
            this.setLayerVisibility(false, this.basemap);
            this.basemap = baseMapLayer;
          }
          const visible = !hidden;
          this.setLayerVisibility(visible, this.basemap);
          this.basemap.setOpacity(opacity);
        }
      });

    this.store
      .select(fromStore.getCurrentLegendSets(this._visualizationObject.componentId))
      .subscribe(visualizationLengends => {
        if (visualizationLengends && Object.keys(visualizationLengends).length) {
          Object.keys(visualizationLengends).map(key => {
            const legendSet = visualizationLengends[key];
            const { opacity, layer, hidden, legend, cluster } = legendSet;
            const tileLayer = legend.type === 'external' || cluster || legend.type === 'earthEngine';
            const leafletlayer = this.leafletLayers[layer];

            // Check if there is that layer otherwise errors when resizing;
            if (leafletlayer && !tileLayer) {
              leafletlayer.setStyle({
                opacity,
                fillOpacity: opacity
              });
            }

            if (tileLayer) {
              // leafletlayer.setOpacity(opacity);
            }

            const visible = !hidden;
            if (leafletlayer) {
              this.setLayerVisibility(visible, leafletlayer);
            }
          });
        }
      });
  }

  createMap() {
    const { geofeatures, analytics, layers } = this._visualizationObject;
    const allGeofeatures = Object.keys(geofeatures).map(key => {
      return geofeatures[key];
    });
    const allDataAnalytics = Object.keys(analytics).filter(
      key =>
        (analytics[key] && analytics[key].rows && analytics[key].rows.length > 0) ||
        (analytics[key] && analytics[key].count)
    );
    if (![].concat.apply([], allGeofeatures).length) {
      this.mapHasGeofeatures = false;
    } else {
      this.mapHasGeofeatures = true;
    }
    if (!allDataAnalytics.length) {
      this.mapHasDataAnalytics = false;
    }

    layers.map(layer => {
      if (layer.type === 'event') {
        const headers = analytics[layer.id] && analytics[layer.id].headers;
        if (_.find(headers, { name: 'latitude' })) {
          this.mapHasGeofeatures = true;
        }
        if (layer.layerOptions.serverClustering) {
          this.mapHasGeofeatures = true;
        }
      } else if (layer.type === 'facility') {
        const { dataSelections } = layer;
        const { organisationUnitGroupSet } = dataSelections;
        if (Object.keys(organisationUnitGroupSet)) {
          this.mapHasDataAnalytics = true;
        }
      } else if (layer.type === 'earthEngine') {
        this.mapHasDataAnalytics = true;
        // Boundary layer do not have data.
      } else if (layer.type === 'boundary') {
        this.mapHasDataAnalytics = true;
      }
    });
  }

  ngAfterViewInit() {
    this.initializeMapContainer();
    interval(4)
      .take(1)
      .subscribe(() => this.initialMapDraw(this._visualizationObject));
  }

  initializeMapContainer() {
    const { itemHeight, mapWidth } = this.displayConfigurations;
    const fullScreen = this._visualizationObject.mapConfiguration.fullScreen || itemHeight === '100vh';
    const container = fromUtils.prepareMapContainer(this._visualizationObject.componentId, itemHeight, mapWidth, false);
    const otherOptions = {
      zoomControl: false,
      fadeAnimation: false,
      scrollWheelZoom: fullScreen ? true : false,
      worldCopyJump: true
    };
    this.map = L.map(container, otherOptions);
  }

  createLayer(optionsLayer, index) {
    if (optionsLayer) {
      const { displaySettings, id, geoJsonLayer, visible, type, areaRadius } = optionsLayer;
      this.createPane(displaySettings.labels, id, index, areaRadius);
      this.setLayerVisibility(visible, geoJsonLayer);
    }
  }

  createPane(labels, id, index, areaRadius) {
    const zIndex = 600 - index * 10;
    this.map.createPane(id);
    this.map.getPane(id).style.zIndex = zIndex.toString();

    if (labels) {
      const paneLabelId = `${id}-labels`;
      this.map.createPane(paneLabelId);
      this.map.getPane(paneLabelId).style.zIndex = (zIndex + 1).toString();
    }
    if (areaRadius) {
      const areaID = `${id}-area`;
      this.map.createPane(areaID);
      this.map.getPane(areaID).style.zIndex = (zIndex - 1).toString();
    }
  }

  onLayerAdd(index, optionsLayer) {}

  setLayerVisibility(isVisible, layer) {
    if (isVisible && this.map.hasLayer(layer) === false) {
      this.map.addLayer(layer);
    } else if (!isVisible && this.map.hasLayer(layer) === true) {
      this.map.removeLayer(layer);
    }
  }

  layerFitBound(bounds: L.LatLngBoundsExpression) {
    this.map.fitBounds(bounds);
  }

  zoomIn(event) {
    this.map.zoomIn();
  }

  zoomOut(event) {
    this.map.zoomOut();
  }

  recenterMap(event) {
    this.map.fitBounds(this.layersBounds);
  }

  toggleLegendContainerView() {
    this.store.dispatch(new fromStore.ToggleOpenVisualizationLegend(this._visualizationObject.componentId));
  }

  initializeMapConfiguration(mapConfiguration: MapConfiguration) {
    let center: L.LatLngExpression = [
      Number(fromLib._convertLatitudeLongitude(mapConfiguration.latitude)),
      Number(fromLib._convertLatitudeLongitude(mapConfiguration.longitude))
    ];
    if (!mapConfiguration.latitude && !mapConfiguration.longitude) {
      center = [6.489, 21.885];
    }
    const zoom = mapConfiguration.zoom ? mapConfiguration.zoom : 6;

    this.map.setView(center, zoom, { reset: true });
  }

  createBaseLayer(basemap?: string) {
    const mapTileLayer = getTileLayer(basemap);
    const baseMapLayer = fromLib.LayerType[mapTileLayer.type](mapTileLayer);
    return baseMapLayer;
  }

  initialMapDraw(visualizationObject: VisualizationObject) {
    const { mapConfiguration } = visualizationObject;
    const { overlayLayers, layersBounds, legendSets } = this.prepareLegendAndLayers(visualizationObject);
    this.drawBaseAndOverLayLayers(mapConfiguration, overlayLayers, layersBounds);
    if (Object.keys(legendSets).length) {
      this.store.dispatch(new fromStore.AddLegendSet({ [this._visualizationObject.componentId]: legendSets }));
    }
  }

  redrawMapOndataChange(visualizationObject: VisualizationObject) {
    Object.keys(this.leafletLayers).map(key => this.map.removeLayer(this.leafletLayers[key]));
    const { overlayLayers, layersBounds, legendSets } = this.prepareLegendAndLayers(visualizationObject);

    overlayLayers.map((layer, index) => {
      this.createLayer(layer, index);
    });

    if (Object.keys(legendSets).length) {
      this.store.dispatch(new fromStore.AddLegendSet({ [visualizationObject.componentId]: legendSets }));
    }

    if (layersBounds.length) {
      this.layersBounds = layersBounds;
      this.layerFitBound(layersBounds);
    }
  }

  drawBaseAndOverLayLayers(mapConfiguration, overlayLayers, layersBounds) {
    this.initializeMapConfiguration(mapConfiguration);

    this.basemap = this.createBaseLayer(mapConfiguration.basemap);

    const name = mapConfiguration.basemap || 'osmLight';
    const opacity = 1;
    const changedBaseLayer = false;
    const hidden = false;
    const { componentId } = this.visualizationObject;
    const payload = { [componentId]: { name, opacity, changedBaseLayer, hidden } };

    this.store.dispatch(new fromStore.AddBaseLayer(payload));

    overlayLayers.map((layer, index) => {
      this.createLayer(layer, index);
    });

    if (layersBounds.length) {
      this.layersBounds = layersBounds;
      this.layerFitBound(layersBounds);
    }
  }

  prepareLegendAndLayers(visualizationObject: VisualizationObject) {
    const overlayLayers = fromLib.GetOverLayLayers(visualizationObject);
    const layersBounds = [];
    let legendSets = {};
    overlayLayers.map((layer, index) => {
      if (layer) {
        const { bounds, legendSet, geoJsonLayer, id } = layer;
        if (bounds) {
          layersBounds.push(bounds);
        }
        if (legendSet && legendSet.legend) {
          const legendEntity = { [id]: legendSet };
          legendSets = { ...legendSets, ...legendEntity };
        }
        const layermap = { [id]: geoJsonLayer };
        this.leafletLayers = { ...this.leafletLayers, ...layermap };
      }
    });

    return {
      overlayLayers,
      layersBounds,
      legendSets
    };
  }
}
