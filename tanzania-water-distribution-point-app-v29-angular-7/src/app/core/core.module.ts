import {NgModule, Optional, SkipSelf} from '@angular/core';
import { CommonModule } from '@angular/common';
import * as fromServices from './services';
import { HttpClientModule } from '@angular/common/http';
import { components } from './components';

@NgModule({
  imports: [
    CommonModule,
    HttpClientModule,
  ],
  declarations: [...components],
  providers: [
    ...fromServices.services
  ],
  exports: [
  ]
})
export class CoreModule {
  /* make sure CoreModule is imported only by one NgModule the AppModule */
  constructor (
    @Optional() @SkipSelf() parentModule: CoreModule
  ) {
    if (parentModule) {
      throw new Error('CoreModule is already loaded. Import only in AppModule');
    }
  }
}
