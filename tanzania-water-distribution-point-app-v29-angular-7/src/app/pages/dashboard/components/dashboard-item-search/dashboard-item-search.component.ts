import { Component, OnInit } from '@angular/core';
import * as dashboardActions from '../../../../store/actions/dashboard.actions';
import * as dashboardSelectors from '../../../../store/selectors/dashboard.selectors';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs/Observable';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { DashboardSearchItem } from '../../../../core/models/dashboard-search-item.model';
import { AppState } from '../../../../store/reducers/index';
import { DASHBOARD_TYPES } from '../../constants/dashboard-types.constant';

@Component({
  selector: 'app-dashboard-item-search',
  templateUrl: './dashboard-item-search.component.html',
  styleUrls: ['./dashboard-item-search.component.css'],
  animations: [
    trigger('open', [
      state('in', style({
        opacity: 1
      })),
      transition('void => *', [
        style({
          opacity: 0
        }),
        animate(700)
      ]),
      transition('* => void', [
        animate(300),
        style({
          opacity: 0
        }),
      ])
    ])
  ]
})
export class DashboardItemSearchComponent implements OnInit {

  searchTerm: string;
  showBody: boolean;
  dashboardSearchItems$: Observable<DashboardSearchItem>;
  dashboardItemTypes: any;

  constructor(private store: Store<AppState>) {
    this.dashboardSearchItems$ = this.store.select(dashboardSelectors.getDashboardSearchItems);
    this.dashboardItemTypes = DASHBOARD_TYPES;
  }

  ngOnInit() {
  }

  search(e) {
    e.stopPropagation();
    this.searchTerm = e.target.value;
    if (this.searchTerm.trim() !== '') {
      this.showBody = true;
      this.store.dispatch(new dashboardActions.SearchItemsAction(Observable.of(this.searchTerm)));
    } else {
      this.showBody = false;
    }
  }

  updateSearchBody(e) {
    e.stopPropagation();
    if (this.searchTerm && this.searchTerm.trim() !== '') {
      this.showBody = true;
    }
  }

  toggleHeaderSelection(header, event) {
    event.stopPropagation();
    this.store.dispatch(new dashboardActions.ChangeSearchHeaderAction(
      {
        header: {
          ...header,
          selected: !header.selected
        }, multipleSelection: event.ctrlKey ? true : false
      }
    ));
  }

  addDashboardItem(dashboardItemData) {
    this.showBody = false;
    this.store.dispatch(new dashboardActions.AddItemAction(dashboardItemData));
  }

}
