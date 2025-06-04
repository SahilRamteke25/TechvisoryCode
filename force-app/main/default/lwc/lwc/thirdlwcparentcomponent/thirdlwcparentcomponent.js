import { LightningElement, api, wire } from 'lwc';
import getContacts from '@salesforce/apex/ParentChildHandlerLWCThre.getContacts';

export default class thirdlwcparentcomponent extends LightningElement {
    @api recordId;
    accountContactData = [];
    error;
    showmessage;

    @wire(getContacts, { accountId: '$recordId' })
    wiredContacts(value) {
        const { data, error } = value;
        if (data) {
            this.accountContactData = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.accountContactData = [];
}
}
constructor() {
    super();
    this.template.addEventListener('showmessage', this.handleParent.bind(this));
}
handleParent(event){
    this.showmessage = event.detail;
}
}