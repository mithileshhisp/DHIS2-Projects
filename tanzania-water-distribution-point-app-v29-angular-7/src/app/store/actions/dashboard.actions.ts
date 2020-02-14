import { Action } from '@ngrx/store';
import { Dashboard } from '../../core/models/dashboard.model';
import { DashboardMenuItem } from '../../core/models/dashboard-menu-item.model';
import { Observable } from 'rxjs/Observable';
import { DashboardSharing } from '../../core/models/dashboard-sharing.model';
import { SharingEntity } from '../../pages/dashboard/modules/sharing-filter/models/sharing-entity';
import { CurrentUser } from '../../core/models/current-user.model';

export enum DashboardActions {
  LOAD = '[Dashboard] Load dashboards',
  LOAD_DASHBOARD_SUCCESS = '[Dashboard] Load dashboards success',
  LOAD_FAIL = '[Dashboard] Load dashboards fail',
  SET_CURRENT = '[Dashboard] Set current dashboard',
  CHANGE_CURRENT_PAGE = '[Dashboard] Change current dashboard page',
  CREATE = '[Dashboard] Create new dashboard',
  CREATE_SUCCESS = '[Dashboard] Dashboard create success',
  RENAME = '[Dashboard] Rename dashboard',
  RENAME_SUCCESS = '[Dashboard] Dashboard rename success',
  DELETE = '[Dashboard] Delete dashboard',
  DELETE_SUCCESS = '[Dashboard] Dashboard delete success',
  COMMIT_DELETE = '[Dashboard] Permanently remove dashboard from the list',
  CHANGE_PAGE_ITEMS = '[Dashboard] Change number of item per dashboard pages in the menu',
  HIDE_MENU_NOTIFICATION_ICON = '[Dashboard] Hide menu notification icons',
  SEARCH_ITEMS = '[Dashboard] Search dashboard items',
  UPDATE_SEARCH_RESULT = '[Dashboard] Update search results',
  CHANGE_SEARCH_HEADER = '[Dashboard] Change search header',
  ADD_ITEM = '[Dashboard] Add dashboard item',
  ADD_ITEM_SUCCESS = '[Dashboard] Add dashboard item success',
  LOAD_SHARING_DATA = '[Dashboard] Load dashboard sharing data',
  LOAD_SHARING_DATA_SUCCESS = '[Dashboard] Load dashboard sharing data success',
  UPDATE_SHARING_DATA = '[Dashboard] Update dashboard sharing data',
  DELETE_ITEM_SUCCESS = '[Dashboard] Delete dashboard item success',
  LOAD_OPTIONS = '[Dashboard] Load dashboard options',
  LOAD_OPTIONS_SUCCESS = '[Dashboard] Load dashboard options success',
  LOAD_OPTIONS_FAIL = '[Dashboard] Load dashboard options fail',
  BOOKMARK_DASHBOARD = '[Dashboard] Bookmark dashboard',
  BOOKMARK_DASHBOARD_SUCCESS = '[Dashboard] Bookmark dashboard success',
  BOOKMARK_DASHBOARD_FAIL = '[Dashboard] Bookmark dashboard fail',
  TOGGLE_BOOKMARKED = '[Dashboard] Bookmark dashboard fail',
  SET_SEARCH_TERM = '[Dashboard] Set dashboard search term',
  LOAD_NOTIFACATION = '[Dashboard] Load dashboard notification',
  LOAD_NOTIFACATION_SUCCESS = '[Dashboard] Load dashboard notification success',
  LOAD_NOTIFACATION_FAIL = '[Dashboard] Load dashboard notification fail',
}

export class LoadAction implements Action {
  readonly type = DashboardActions.LOAD;
}

export class LoadDashboardSuccessAction implements Action {
  readonly type = DashboardActions.LOAD_DASHBOARD_SUCCESS;

  constructor(public payload: {
    dashboards: Dashboard[];
    url: string;
    currentUser: CurrentUser;
  }) {
  }
}

export class LoadFailAction implements Action {
  readonly type = DashboardActions.LOAD_FAIL;

  constructor(public payload: any) {
  }
}

export class SetCurrentAction implements Action {
  readonly type = DashboardActions.SET_CURRENT;

  constructor(public payload: string) {
  }
}

export class ChangeCurrentPageAction implements Action {
  readonly type = DashboardActions.CHANGE_CURRENT_PAGE;

  constructor(public payload: number) {
  }
}

export class CreateAction implements Action {
  readonly type = DashboardActions.CREATE;

  constructor(public payload: string) {
  }
}

export class CreateSuccessAction implements Action {
  readonly type = DashboardActions.CREATE_SUCCESS;

  constructor(public payload: Dashboard) {
  }
}

export class RenameAction implements Action {
  readonly type = DashboardActions.RENAME;

  constructor(public payload: {id: string; name: string}) {
  }
}

export class RenameSuccessAction implements Action {
  readonly type = DashboardActions.RENAME_SUCCESS;

  constructor(public payload: Dashboard) {
  }
}

export class DeleteAction implements Action {
  readonly type = DashboardActions.DELETE;

  constructor(public payload: string) {
  }
}

export class DeleteSuccessAction implements Action {
  readonly type = DashboardActions.DELETE_SUCCESS;

  constructor(public payload: any) {
  }
}

export class CommitDeleteAction implements Action {
  readonly type = DashboardActions.COMMIT_DELETE;

  constructor(public payload: string) {
  }
}

export class ChangePageItemsAction implements Action {
  readonly type = DashboardActions.CHANGE_PAGE_ITEMS;

  constructor(public payload: number) {
  }
}

export class HideMenuNotificationIconAction implements Action {
  readonly type = DashboardActions.HIDE_MENU_NOTIFICATION_ICON;

  constructor(public payload: DashboardMenuItem) {
  }
}

export class SearchItemsAction implements Action {
  readonly type = DashboardActions.SEARCH_ITEMS;

  constructor(public payload: Observable<string>) {
  }
}

export class UpdateSearchResultAction implements Action {
  readonly type = DashboardActions.UPDATE_SEARCH_RESULT;

  constructor(public payload: any) {
  }
}

export class ChangeSearchHeaderAction implements Action {
  readonly type = DashboardActions.CHANGE_SEARCH_HEADER;

  constructor(public payload: {header: any; multipleSelection: boolean}) {
  }
}

export class AddItemAction implements Action {
  readonly type = DashboardActions.ADD_ITEM;

  constructor(public payload: any) {
  }
}

export class AddItemSuccessAction implements Action {
  readonly type = DashboardActions.ADD_ITEM_SUCCESS;

  constructor(public payload: any) {
  }
}

export class LoadSharingDataAction implements Action {
  readonly type = DashboardActions.LOAD_SHARING_DATA;

  constructor(public payload: any) {
  }
}

export class LoadSharingDataSuccessAction implements Action {
  readonly type = DashboardActions.LOAD_SHARING_DATA_SUCCESS;

  constructor(public payload: DashboardSharing) {
  }
}

export class UpdateSharingDataAction implements Action {
  readonly type = DashboardActions.UPDATE_SHARING_DATA;

  constructor(public payload: SharingEntity) {
  }
}

export class DeleteItemSuccessAction implements Action {
  readonly type = DashboardActions.DELETE_ITEM_SUCCESS;

  constructor(public payload: {dashboardId: string; visualizationId: string}) {
  }
}

export class LoadOptionsAction implements Action {
  readonly type = DashboardActions.LOAD_OPTIONS;
}

export class LoadOptionsSuccessAction implements Action {
  readonly type = DashboardActions.LOAD_OPTIONS_SUCCESS;

  constructor(public payload: any) {
  }
}

export class LoadOptionsFailAction implements Action {
  readonly type = DashboardActions.LOAD_OPTIONS_FAIL;
}

export class BookmarkDashboardAction implements Action {
  readonly type = DashboardActions.BOOKMARK_DASHBOARD;

  constructor(public payload: any) {
  }
}

export class BookmarkDashboardSuccessAction implements Action {
  readonly type = DashboardActions.BOOKMARK_DASHBOARD_SUCCESS;
  // constructor(public payload: any) {}
}

export class BookmarkDashboardFailAction implements Action {
  readonly type = DashboardActions.BOOKMARK_DASHBOARD_FAIL;
  // constructor(public payload: any) {}
}

export class ToggleBookmarkedAction implements Action {
  readonly type = DashboardActions.TOGGLE_BOOKMARKED;
}

export class SetSearchTermAction implements Action {
  readonly type = DashboardActions.SET_SEARCH_TERM;

  constructor(public payload: string) {
  }
}

export class LoadDashboardNotificationAction implements Action {
  readonly type = DashboardActions.LOAD_NOTIFACATION;
}

export class LoadDashboardNotificationSuccessAction implements Action {
  readonly type = DashboardActions.LOAD_NOTIFACATION_SUCCESS;

  constructor(public payload: any) {
  }
}

export class LoadDashboardNotificationFailAction implements Action {
  readonly type = DashboardActions.LOAD_NOTIFACATION_FAIL;

  constructor(public payload: any) {
  }
}

export type DashboardAction =
  LoadAction
  | LoadDashboardSuccessAction
  | LoadFailAction
  | SetCurrentAction
  | ChangeCurrentPageAction
  | CreateAction
  | CreateSuccessAction
  | RenameAction
  | RenameSuccessAction
  | DeleteAction
  | DeleteSuccessAction
  | CommitDeleteAction
  | ChangePageItemsAction
  | HideMenuNotificationIconAction
  | SearchItemsAction
  | UpdateSearchResultAction
  | ChangeSearchHeaderAction
  | AddItemAction
  | AddItemSuccessAction
  | LoadSharingDataAction
  | LoadSharingDataSuccessAction
  | UpdateSharingDataAction
  | DeleteItemSuccessAction
  | LoadOptionsAction
  | LoadOptionsSuccessAction
  | LoadOptionsFailAction
  | BookmarkDashboardAction
  | BookmarkDashboardSuccessAction
  | BookmarkDashboardFailAction
  | ToggleBookmarkedAction
  | SetSearchTermAction
  | LoadDashboardNotificationAction
  | LoadDashboardNotificationSuccessAction
  | LoadDashboardNotificationFailAction;
