import React, { PureComponent } from 'react';
import DynamicComponent from '../dynamicComponent/dynamicComponent'
import { OrgUnitTree } from '@hisp-amr/org-unit-tree'
import { useDataQuery } from '@dhis2/app-runtime';
const onError = error => console.error(error)
class HomeComponet extends React.Component {
    constructor() {
        super();
        this.state={
            orgUnit:""
        }
         this.onSelect = this.onSelect.bind(this)
    }

    onSelect(selected) {
        // console.log("here is the data",selected);
        this.setState({orgUnit: selected})
    }
    render() {
        return ( <> 
            <div className="row">
            <div className="col-lg-auto col-md-auto col-sm-auto col-xs-auto shadow-lg bg-white rounded">  
                 <OrgUnitTree
                  onSelect={this.onSelect}
                  onError={onError}   
                  />
              </div>
              <div className="col-lg-9 col-md-9 col-sm-9 col-xs-9"> 
                 <DynamicComponent  data = {this.state.orgUnit}/>
              </div>
          </div>
          </>   
         );
    }
}
export default HomeComponet;