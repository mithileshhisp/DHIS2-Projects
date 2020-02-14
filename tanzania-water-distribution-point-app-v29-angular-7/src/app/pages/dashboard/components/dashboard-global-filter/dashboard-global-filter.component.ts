import { Component, Input, OnInit } from '@angular/core';
import {animate, state, style, transition, trigger} from '@angular/animations';
import {Store} from '@ngrx/store';
import * as fromVisualizationActions from '../../../../store/actions/visualization.actions';
import { AppState } from '../../../../store/reducers/index';

@Component({
  selector: 'app-dashboard-global-filter',
  templateUrl: './dashboard-global-filter.component.html',
  styleUrls: ['./dashboard-global-filter.component.css'],
  animations: [
    trigger('open', [
      state(
        'in',
        style({
          opacity: 1
        })
      ),
      transition('void => *', [
        style({
          opacity: 0
        }),
        animate(700)
      ]),
      transition('* => void', [
        animate(400),
        style({
          opacity: 0
        })
      ])
    ])
  ]
})
export class DashboardGlobalFilterComponent implements OnInit {

  @Input() currentDashboardId: string;
  showGlobalFilters: boolean;
  selectedDimensions: any;
  constructor(private store: Store<AppState>) {
    this.showGlobalFilters = false;
    this.selectedDimensions = {
      selectedPeriods: [],
      orgUnitModel: {
        selectionMode: 'orgUnit',
        selectedLevels: [],
        showUpdateButton: true,
        selectedGroups: [],
        orgUnitLevels: [],
        orgUnitGroups: [],
        selectedOrgUnits: [],
        userOrgUnits: [],
        type: 'report', // can be 'data_entry'
        selectedUserOrgUnits: []
      }
    };
  }

  ngOnInit() {
  }

  onGlobalFilterUpdate(filterValue: any) {
    this.store.dispatch(new fromVisualizationActions.GlobalFilterChangeAction({
      currentDashboardId: this.currentDashboardId, filterValue: filterValue
    }));
  }

}
