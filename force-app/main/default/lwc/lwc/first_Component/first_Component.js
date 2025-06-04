import { LightningElement, wire } from 'lwc';
import getAccList from '@salesforce/apex/First_component.getAccList';

export default class first_Component  extends LightningElement {
    accounts; // Stores account data
    error; // Stores error information

    @wire(getAccList)
    wiredAccount({ error, data }) {
        if (data) {
            this.accounts = data; // Fixed typo: Changed this.account to this.accounts
            this.error = undefined;
        } else if (error) {
            this.error = error; // Correctly set error
            this.accounts = undefined; // Fixed typo: Changed this.data to this.accounts
        }
    }
}