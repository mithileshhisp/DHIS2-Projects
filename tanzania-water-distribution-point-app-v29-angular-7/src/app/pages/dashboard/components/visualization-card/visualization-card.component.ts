import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { Store } from '@ngrx/store';
import * as _ from 'lodash';
import { Visualization } from '../../../../core/models/visualization.model';
import { CurrentUser } from '../../../../core/models/current-user.model';
import { ChartListComponent } from '../../modules/chart/components/chart-list/chart-list.component';
import { TableListComponent } from '../../modules/table/components/table-list/table-list.component';
import { AppState } from '../../../../store/reducers/index';
import * as visualization from '../../../../store/actions/visualization.actions';

@Component({
  selector: 'app-visualization-card',
  templateUrl: './visualization-card.component.html',
  styleUrls: ['./visualization-card.component.css']
})
export class VisualizationCardComponent implements OnInit {
  @Input() visualizationObject: Visualization;
  @Input() currentUser: CurrentUser;

  isCardFocused: boolean;
  selectedDimensions: any;
  currentVisualization: string;
  loaded: boolean;
  showDeleteDialog: boolean;

  @ViewChild(ChartListComponent) chartList: ChartListComponent;
  @ViewChild(TableListComponent) tableList: TableListComponent;

  constructor(private store: Store<AppState>) {
    this.showDeleteDialog = false;
  }

  ngOnInit() {
    this.selectedDimensions = this.getSelectedDimensions();

    this.currentVisualization = this.visualizationObject.details.currentVisualization;

    this.loaded = this.visualizationObject.details.loaded;
  }

  currentVisualizationChange(visualizationType: string) {
    this.store.dispatch(
      new visualization.VisualizationChangeAction({
        type: visualizationType,
        id: this.visualizationObject.id
      })
    );
  }

  getSelectedItems(filters: any[], dimension: string) {
    // todo take data items based on the current layer
    if (filters && filters[0]) {
      const dataItemObject = _.find(filters[0].filters, ['name', dimension]);

      if (dataItemObject) {
        return _.map(dataItemObject.items, (dataItem: any) => {
          return {
            id: dataItem.dimensionItem,
            name: dataItem.displayName,
            type: dataItem.dimensionItemType
          };
        });
      }
    }
    return [];
  }

  private _getSelectedOrgUnitModel(orgUnitArray): any {
    let newOrgUnitArray = [];

    _.each(orgUnitArray, orgUnit => {
      const splitedIds = orgUnit.id.split(';');
      newOrgUnitArray = [
        ...newOrgUnitArray, ..._.map(splitedIds, splitedId => {
          return {id: splitedId,
            type: splitedId.indexOf('LEVEL') === -1 ?
                  splitedId.indexOf('OU_GROUP') === -1 ?
                  'ORGANISATION_UNIT' :
                  'ORGUNIT_GROUP' :
                  'ORGUNIT_LEVEL'
          };
        })
      ];
    });
    const selectedOrgUnitLevels = newOrgUnitArray.filter(
      orgunit => orgunit.id.indexOf('LEVEL') !== -1
    );
    const selectedUserOrgUnits = newOrgUnitArray.filter(orgunit => orgunit.id.indexOf('USER') !== -1);
    const selectedOrgUnitGroups = newOrgUnitArray.filter(
      orgunit => orgunit.id.indexOf('OU_GROUP') !== -1
    );

    return {
      selectionMode:
        selectedOrgUnitLevels.length > 0
          ? 'Level'
          : selectedOrgUnitGroups.length > 0 ? 'Group' : 'orgUnit',
      selectedLevels: selectedOrgUnitLevels.map(orgunitlevel => {
        return {
          level: orgunitlevel.id.split('-')[1]
        };
      }),
      showUpdateButton: true,
      selectedGroups: selectedOrgUnitGroups,
      orgUnitLevels: [],
      orgUnitGroups: [],
      selectedOrgUnits: newOrgUnitArray.filter((orgUnit: any) => orgUnit.type === 'ORGANISATION_UNIT'),
      userOrgUnits: [],
      type: 'report',
      selectedUserOrgUnits: selectedUserOrgUnits.map(userorgunit => {
        return {
          id: userorgunit.id,
          shown: true
        };
      }),
      orgUnits: []
    };
  }

  onFilterUpdate(filterValue: any) {
    this.store.dispatch(
      new visualization.LocalFilterChangeAction({
        visualizationObject: this.visualizationObject,
        filterValue: filterValue
      })
    );
  }

  onLayoutUpdate(layoutOptions: any) {
    const newVisualizationObjectDetails = {
      ...this.visualizationObject.details
    };

    // TODO use only single place for saving layout options
    const visualizationLayouts = _.map(
      newVisualizationObjectDetails.layouts,
      (layoutObject: any) => {
        return {
          ...layoutObject,
          layout: layoutOptions
        };
      }
    );

    const visualizationLayers = _.map(this.visualizationObject.layers, (layer: any) => {
      return {
        ...layer,
        layout: layoutOptions
      };
    });

    this.store.dispatch(
      new visualization.AddOrUpdateAction({
        visualizationObject: {
          ...this.visualizationObject,
          details: {
            ...newVisualizationObjectDetails,
            layouts: [...visualizationLayouts]
          },
          layers: visualizationLayers
        },
        placementPreference: 'normal'
      })
    );
  }

  toggleCardFocusAction(e, isFocused) {
    e.stopPropagation();
    this.isCardFocused = isFocused;

    /**
     * Pass event to child components
     */
    if (this.chartList) {
      this.chartList.onParentEvent({
        focused: this.isCardFocused
      });
    }
  }

  getSelectedDimensions() {
    return this.visualizationObject.details &&
           this.visualizationObject.details.filters.length > 0 &&
           this.visualizationObject.details.layouts.length > 0
      ? {
        selectedDataItems: this.getSelectedItems(this.visualizationObject.details.filters, 'dx'),
        selectedPeriods: this.getSelectedItems(this.visualizationObject.details.filters, 'pe'),
        orgUnitModel: this._getSelectedOrgUnitModel(
          this.getSelectedItems(this.visualizationObject.details.filters, 'ou')
        ),
        layoutModel: this.visualizationObject.details.layouts[0].layout
      }
      : null;
  }

  onShowDeleteDialog(e) {
    e.stopPropagation();
    this.showDeleteDialog = true;
  }

  onDelete() {
    this.store.dispatch(
      new visualization.DeleteAction({
        dashboardId: this.visualizationObject.dashboardId,
        visualizationId: this.visualizationObject.id
      })
    );
  }

  onDownload(downloadFormat) {
    if (this.currentVisualization === 'CHART' && this.chartList) {
      this.chartList.onDownloadEvent(this.visualizationObject.name, downloadFormat);
    } else if (this.currentVisualization === 'TABLE' && this.tableList) {
      this.tableList.onDownloadEvent(this.visualizationObject.name, downloadFormat);
    }
  }
}
