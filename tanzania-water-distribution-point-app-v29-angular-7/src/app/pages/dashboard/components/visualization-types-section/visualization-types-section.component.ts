import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-visualization-types-section',
  templateUrl: './visualization-types-section.component.html',
  styleUrls: ['./visualization-types-section.component.css']
})
export class VisualizationTypesSectionComponent implements OnInit {

  @Input() currentVisualization: string;
  @Input() visualizationTypeConfig: any;
  @Output() onCurrentVisualizationChange: EventEmitter<string> = new EventEmitter<string>();

  constructor() {
    this.visualizationTypeConfig = {
      showInfo: false
    };
  }

  ngOnInit() {
  }

  onVisualizationSelect(e, type) {
    e.stopPropagation();
    this.onCurrentVisualizationChange.emit(type);
  }

}
