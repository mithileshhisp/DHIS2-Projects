import {
  Component,
  OnInit,
  Input,
  ViewChild,
  Output,
  EventEmitter
} from '@angular/core';
import { timeout } from 'rxjs/operator/timeout';
declare var L: any;

@Component({
  selector: 'app-coordinate',
  templateUrl: './coordinate.component.html',
  styleUrls: ['./coordinate.component.css']
})
export class CoordinateComponent implements OnInit {
  @Input() objectRefference: any;
  lat: number;
  lng: number;
  @Input() editing: boolean;
  isCollapsed: boolean = false;
  @Output() onCoordinateChange = new EventEmitter();
  showMapBool = false;
  showCoordinateBool = false;
  location: any = {};
  map;
  marker;
  isFullScreen;
  constructor() {}

  ngOnInit() {
    const coordinateArray = eval(this.objectRefference.coordinates);
    if (coordinateArray) {
      if (coordinateArray.length > 0) {
        this.lat = coordinateArray[0];
        this.lng = coordinateArray[1];
      } else {
        this.lat = 0;
        this.lng = 0;
      }
    } else {
      this.lat = 0;
      this.lng = 0;
    }
    this.onChange();
    this.showMap();
  }

  dragEnded(event) {
    this.lat = event.coords.lat;
    this.lng = event.coords.lng;
    this.onChange();
  }

  onChange() {
    this.onCoordinateChange.emit('[' + this.lat + ',' + this.lng + ']');
  }

  ngOnChanges(changes: any) {
    if (changes.editing) {
      if (this.marker) {
        if (changes.editing.currentValue) {
          this.marker.dragging.enable();
        } else {
          this.marker.dragging.disable();
        }
      }
    }
  }

  showMap() {
    this.isCollapsed = !this.isCollapsed;
    if (this.isCollapsed) {
      setTimeout(() => {
        if (!this.map) {
          this.map = L.map('coordinateMap', {
            center: [-6.369, 34.8888],
            zoom: 5
          });
          this.marker = L.marker([this.lat, this.lng], {
            icon: L.icon({
              iconUrl: 'assets/marker-icon.png',
              iconSize: [21, 31], // size of the icon
              iconAnchor: [10, 31], // point of the icon which will correspond to marker's location
              popupAnchor: [0, -31]
            })
          }).addTo(this.map);
        } else {
          this.marker.setLatLng(
            new L.LatLng(this.lat.toFixed(5), this.lng.toFixed(5))
          );
        }
        if (this.editing) {
          this.marker.dragging.enable();
        } else {
          this.marker.dragging.disable();
        }
        L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
          attribution:
            '&copy; <a href="https://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(this.map);
        this.marker.on('dragend', event => {
          const marker = event.target;
          const position = marker.getLatLng();
          this.marker.setLatLng(new L.LatLng(position.lat, position.lng));
          this.lat = position.lat.toFixed(5);
          this.lng = position.lng.toFixed(5);
          this.onChange();
        });
      }, 1000);
    } else {
    }
  }

  changeFullScreen() {
    this.isFullScreen = !this.isFullScreen;
    if (this.isFullScreen) {
      this.map.setZoom(6);
    } else {
      this.map.setZoom(5);
    }
    setTimeout(() => {
      this.map.invalidateSize();
    });
  }

  closeMap() {
    this.showCoordinateBool = false;
  }

  public collapsed(event: any): void {
   // console.log(event);
  }

  public expanded(event: any): void {
  //  console.log(event);
  }
}
