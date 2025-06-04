import { LightningElement, api } from 'lwc';

export default class Third_Lwc_child_component extends LightningElement {
    @api contactData;
    columnData= [
        {
            label: 'Name', fieldName: 'Name',  type: 'text',
        },
        {
            label: 'Phone',fieldName: 'Name',type: 'text',
        }
    ]
}