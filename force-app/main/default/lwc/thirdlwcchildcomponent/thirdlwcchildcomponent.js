import { LightningElement, api } from 'lwc';

export default class thirdlwcchildcomponent extends LightningElement {
    @api contactData;
    @api message = 'I am coming from Child Component';
    columnData= [
        {
            label: 'Name', fieldName: 'Name',  type: 'text',
        },
        {
            label: 'Phone',fieldName: 'Phone',type: 'text',
        }
    ]
    handleclick(event){
    const callParent = new CustomEvent('showmessage',{
        detail: this.message
    });
    this.dispatchEvent(callParent);
    }
}
