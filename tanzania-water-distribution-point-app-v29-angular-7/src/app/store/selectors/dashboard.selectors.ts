import { createSelector } from '@ngrx/store';
import * as _ from 'lodash';
import { dashboardState } from '../reducers/index';
import { DashboardState } from '../reducers/dashboard.reducer';
import { Dashboard } from '../../core/models/dashboard.model';
import { DashboardMenuItem } from '../../core/models/dashboard-menu-item.model';

export const getCurrentDashboardPage = createSelector(dashboardState, (dashboardObject: DashboardState) =>
  dashboardObject.currentDashboardPage);

export const getDashboardLoadedStatus = createSelector(dashboardState, (dashboardObject: DashboardState) =>
  dashboardObject.dashboardsLoaded);

export const getDashboardPages = createSelector(dashboardState, (dashboardObject: DashboardState) =>
  dashboardObject.dashboardPageNumber);

export const getCurrentDashboard = createSelector(dashboardState, (dashboardObject: DashboardState) =>
  _.find(dashboardObject.dashboards, ['id', dashboardObject.currentDashboard]));

export const getDashboardSearchItems = createSelector(dashboardState, (dashboardObject: DashboardState) => {
  return {
    ...dashboardObject.dashboardSearchItem,
    results: dashboardObject.dashboardSearchItem.results.filter(result => result.selected)
  };
});
export const getCurrentDashboardSharing = createSelector(dashboardState,
  (dashboardObject: DashboardState) => dashboardObject.dashboardSharing[dashboardObject.currentDashboard]);

export const getDashboardMenuItems = createSelector(dashboardState,
  (dashboardObject: DashboardState) => dashboardObject.activeDashboards.length > 0 ?
                                       dashboardObject.activeDashboards.slice(
                                         getStartItemIndex(dashboardObject.currentDashboardPage,
                                           dashboardObject.dashboardPerPage),
                                         getEndItemIndex(dashboardObject.currentDashboardPage,
                                           dashboardObject.dashboardPerPage) + 1).
                                         map((dashboard: Dashboard) => mapStateToDashboardMenu(dashboard)) :
    []);

export const getAllDashboardMenuItems = createSelector(dashboardState,
  (state: DashboardState) => state.activeDashboards);

export const getShowBookmarkedStatus = createSelector(dashboardState,
  (dashboardObject: DashboardState) => dashboardObject.showBookmarked);

export const getDashboardNotification = createSelector(dashboardState,
  (dashboardObject: DashboardState) => dashboardObject.dashboardNotification);

function getStartItemIndex(pageNumber: number, pageSize: number) {
  return (pageSize * pageNumber) - pageSize;
}

function getEndItemIndex(pageNumber: number, pageSize: number) {
  return (pageSize * pageNumber) - 1;
}

function mapStateToDashboardMenu(dashboard: Dashboard): DashboardMenuItem {
  return {
    id: dashboard.id,
    name: dashboard.name,
    details: dashboard.details
  };
}
