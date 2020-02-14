import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs/Observable';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { AppState } from '../../../../store/reducers/index';
import { getDashboardNotification } from '../../../../store/selectors/dashboard.selectors';

@Component({
  selector: 'app-dashboard-notification',
  templateUrl: './dashboard-notification.component.html',
  styleUrls: ['./dashboard-notification.component.css'],
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
export class DashboardNotificationComponent implements OnInit {

  dashboardNotification$: Observable<any>;
  showNotificationDetails: boolean;
  currentNotification: string;
  constructor(private store: Store<AppState>) {
    this.dashboardNotification$ = store.select(getDashboardNotification);
    this.showNotificationDetails = false;
  }

  ngOnInit() {
  }

  toggleNotificationDetails(e, currentNotification: string) {
    e.stopPropagation();
    if (this.currentNotification === currentNotification) {
      this.showNotificationDetails = !this.showNotificationDetails;
    } else {
      this.showNotificationDetails = true;
      this.currentNotification = currentNotification;
    }
  }

}
