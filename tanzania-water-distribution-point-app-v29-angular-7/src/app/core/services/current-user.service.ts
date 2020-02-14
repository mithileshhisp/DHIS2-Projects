import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';

import { HttpClientService } from './http-client.service';
import { CurrentUser } from '../models/current-user.model';

@Injectable()
export class CurrentUserService {
  constructor(private httpClient: HttpClientService) {}

  loadUser(): Observable<CurrentUser> {
    return this.httpClient.get(`me.json?fields=id,name,displayName,created,lastUpdated,email,
    dataViewOrganisationUnits[id,name,level],organisationUnits[id,name,level],userCredentials[username,userRoles[id,authorities]]`);
  }
}
