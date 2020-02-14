import { Component, Input, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import * as dashboardActions from '../../../../store/actions/dashboard.actions';
import { Router } from '@angular/router';
import {
  animate,
  state,
  style,
  transition,
  trigger
} from '@angular/animations';
import { AppState } from '../../../../store/reducers/index';

@Component({
  selector: 'app-dashboard-menu-item-desktop',
  templateUrl: './dashboard-menu-item-desktop.component.html',
  styleUrls: ['./dashboard-menu-item-desktop.component.css'],
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
export class DashboardMenuItemDesktopComponent implements OnInit {
  @Input() dashboardMenuItem: any;
  showEditForm: boolean;
  showDashboardItemDropdown: boolean;
  showDeleteBlock: boolean;
  isFocused: boolean;
  constructor(private store: Store<AppState>, private router: Router) {
    this.showEditForm = false;
    this.showDashboardItemDropdown = false;
    this.showDeleteBlock = false;
    this.isFocused = false;
  }

  get showName() {
    return (
      this.dashboardMenuItem.details.showName &&
      !this.showEditForm &&
      !this.showDeleteBlock
    );
  }

  ngOnInit() {}

  toggleEditForm(e?) {
    if (e) {
      e.stopPropagation();
    }

    this.showEditForm = !this.showEditForm;
    this.showDashboardItemDropdown = false;
  }

  showDropdown(e) {
    e.stopPropagation();
    this.showDashboardItemDropdown = true;
    return false;
  }

  toggleDeleteForm(e?) {
    if (e) {
      e.stopPropagation();
    }

    this.showDeleteBlock = !this.showDeleteBlock;
    this.showDashboardItemDropdown = false;
  }

  openShareBlock(e) {
    e.stopPropagation();
  }

  hideDashboardNotificationIcon() {
    if (this.dashboardMenuItem.details.showIcon) {
      this.store.dispatch(
        new dashboardActions.HideMenuNotificationIconAction(
          this.dashboardMenuItem
        )
      );
    }
  }

  toggleBookmark(e) {
    e.stopPropagation();
  }

  onMouseLeave(e) {
    e.stopPropagation();
    this.showDashboardItemDropdown = false;
    this.isFocused = false;
  }
  onMouseEnter(e) {
    e.stopPropagation();
    this.isFocused = true;
  }

  bookmarkDashboard(e) {
    e.stopPropagation();

    this.store.dispatch(
      new dashboardActions.BookmarkDashboardAction({
        dashboardId: this.dashboardMenuItem.id,
        bookmarked: !this.dashboardMenuItem.details.bookmarked
      })
    );
  }
}
