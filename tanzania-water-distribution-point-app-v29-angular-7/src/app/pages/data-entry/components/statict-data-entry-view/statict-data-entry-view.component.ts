import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import {
  AppState,
  UpdateMessageObjectOnOrganisationUnitAction,
  ResetMessageObjectOnOrganisationUnitAction
} from '../../../../store';
import { Store } from '@ngrx/store';
import {
  OrganisationUnitModel,
  AttributeValuesModel
} from '../../../../core/models/statict-data-entry.model';
import * as _ from 'lodash';
import { OrganisationUnitService, MaintenanceService, EventService } from '../../../../core';

@Component({
  selector: 'app-statict-data-entry-view',
  templateUrl: './statict-data-entry-view.component.html',
  styleUrls: ['./statict-data-entry-view.component.css']
})
export class StatictDataEntryViewComponent implements OnInit {
  @Input() organisationUnit: OrganisationUnitModel;
  @Input() attributes: Array<AttributeValuesModel>;
  @Input() authorities: Array<string>;
  organisationUnitObject: OrganisationUnitModel;
  isLoading: boolean;
  isEditable: boolean;
  isDeletingActive: boolean;
  isDeleteNotAllowed: boolean;
  isEditAllowed: boolean;
  public dataValues: any;

  @Output() hasViewRendered = new EventEmitter();
  @Output() addOrUpdateDitributionPoint = new EventEmitter();
  @Output() deleteDitributionPoint = new EventEmitter();
  constructor(
    private store: Store<AppState>,
    private organisationUnitService: OrganisationUnitService,
    private maintenanceService: MaintenanceService,
    private eventService: EventService
  ) {
    this.isLoading = true;
    this.isEditable = false;
    this.isDeletingActive = false;
    this.isDeleteNotAllowed = false;
    this.isEditAllowed = false;
  }

  ngOnInit() {
    if (
      this.authorities &&
      !(
        this.authorities.indexOf('ALL') > -1 ||
        this.authorities.indexOf('F_ORGANISATIONUNIT_DELETE') > -1
      )
    ) {
      this.isDeleteNotAllowed = true;
    }
    if (
      this.authorities &&
      (this.authorities.indexOf('ALL') > -1 ||
        this.authorities.indexOf('F_ORGANISATIONUNIT_ADD') > -1)
    ) {
      this.isEditAllowed = true;
    }
    if (this.organisationUnit) {
      this.organisationUnitObject = this.getOganisationUnitObject();
      let attributeValues = this.organisationUnitObject.attributeValues;
      //  attributeValues.forEach(element => {
      //   this.eventService.loadedData().subscribe( res => {
      //     this.dataValues = res.events["0"].dataValues;
      //     this.dataValues.forEach(element => {
      //       if(element.dataElement === 'w12NcYUbw0h') {
      //         attributeValues['9']['value']=element.value;
      //       } else if(element.dataElement === 'XJRt4P9JgLQ') {
      //       attributeValues['10']['value']=element.value;
      //       }
      //       else if(element.dataElement === 'cQTEBsID9do') {
      //         attributeValues['4']['value']=element.value;
      //         }
            
      //           else if(element.dataElement === 'oonnSZRwJG4') {
      //             attributeValues['7']['value']=element.value;
      //             }
      //     });
      //   }); 
      // });
     // console.log('here is arr before splice', attributeValues)
        //attributeValues.splice(5,1);
     // this.organisationUnitObject['attributeValues'] = attributeValues;
     // console.log('here is me at test for org obj', this.organisationUnitObject);
      this.isLoading = false;
      this.hasViewRendered.emit({ data: true });
    }
  }

  onDeleteDistributionPoint() {
    if (confirm('Are you sure you want to delete this distribution point?')) {
      this.isDeletingActive = true;
      const { id } = this.organisationUnitObject;
      const { name } = this.organisationUnitObject;
      this.organisationUnitService.deleteOrganisationUnit(id).subscribe(
        (response: any) => {
          const { rows } = response;
          if (rows && rows[0] && rows[0][0]) {
            if (rows[0][0] === 'Success') {
              this.deleteDitributionPoint.emit(this.organisationUnitObject);
              this.isDeletingActive = false;
              let type = 'success';
              let message = {
                statusText: 'Ok',
                status: 200,
                message: 'System Cache has been cleared successfully'
              };
              this.store.dispatch(
                new UpdateMessageObjectOnOrganisationUnitAction({
                  type: type,
                  message: message
                })
              );
              this.maintenanceService.clearSystemCache().subscribe(
                () => {
                  type = 'success';
                  message = {
                    statusText: 'Ok',
                    status: 200,
                    message: 'System Cache has been cleared successfully'
                  };
                  this.store.dispatch(
                    new UpdateMessageObjectOnOrganisationUnitAction({
                      type: type,
                      message: message
                    })
                  );
                },
                error => {
                  type = 'danger';
                  this.store.dispatch(
                    new UpdateMessageObjectOnOrganisationUnitAction({
                      type: type,
                      message: error
                    })
                  );
                }
              );
            } else {
              this.isDeletingActive = false;
              const type = 'danger';
              const message = {
                httpStatus: 'Conflict',
                httpStatusCode: 409,
                message: rows[0][0]
              };
              this.store.dispatch(
                new UpdateMessageObjectOnOrganisationUnitAction({
                  type: type,
                  message: message
                })
              );
            }
          } else {
            this.isDeletingActive = false;
            const type = 'danger';
            const message = {
              httpStatus: 'Conflict',
              httpStatusCode: 409,
              message:
                'Server response is no formatted on deleting distribution point'
            };
            this.store.dispatch(
              new UpdateMessageObjectOnOrganisationUnitAction({
                type: type,
                message: message
              })
            );
          }
        },
        error => {
          this.isDeletingActive = false;
          const type = 'danger';
          this.store.dispatch(
            new UpdateMessageObjectOnOrganisationUnitAction({
              type: type,
              message: error
            })
          );
        }
      );
    }
  }
  editDistributionPoint() {
    this.store.dispatch(new ResetMessageObjectOnOrganisationUnitAction());
    this.isEditable = true;    
  }

  onAddOrUpdateDitributionPoint(event) {
    this.addOrUpdateDitributionPoint.emit(event);
    this.cancelEditDistributionPoint(event);
  }

  cancelEditDistributionPoint(event) {
    this.isLoading = true;
    this.isEditable = false;
    setTimeout(() => {
      this.ngOnInit();
    }, 500);
  }

  getOganisationUnitObject() {
    const { attributeValues } = this.organisationUnit;
    const organisationUnitObject = Object.assign({}, this.organisationUnit);
    delete organisationUnitObject.attributeValues;
    const newAttributeValues = [];
    const attributes = _.cloneDeep(this.attributes);
    attributes.map((attributeObject: AttributeValuesModel) => {
      const matchAttributes: AttributeValuesModel = _.find(
        attributeValues,
        (attributeValue: AttributeValuesModel) => {
          return attributeValue.attribute.id === attributeObject.attribute.id;
        }
      );
      if (matchAttributes) {
        attributeObject.value = matchAttributes.value;
      }
      newAttributeValues.push(attributeObject);
    });
   // console.log("here is attributes", attributes, "attributesValues", newAttributeValues);
      // this.eventService.loadedData().subscribe( res => {
      //   this.dataValues = res.events["0"].dataValues;
      //   this.dataValues.forEach(element => {
      //     if(element.dataElement === 'w12NcYUbw0h') {
      //       newAttributeValues['9']['value']=element.value;
      //     } else if(element.dataElement === 'XJRt4P9JgLQ') {
      //       newAttributeValues['10']['value']=element.value;
      //     }
      //     else if(element.dataElement === 'cQTEBsID9do') {
      //       newAttributeValues['4']['value']=element.value;
      //       }
      //         else if(element.dataElement === 'oonnSZRwJG4') {
      //           newAttributeValues['7']['value']=element.value;
      //           }
      //   });
      // }); 
    organisationUnitObject['attributeValues'] = newAttributeValues;
  //  console.log("here is orgAObj", organisationUnitObject)
    return organisationUnitObject;
  }
}
