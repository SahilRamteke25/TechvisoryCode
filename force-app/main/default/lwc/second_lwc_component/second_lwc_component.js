import { LightningElement, wire, track } from 'lwc';
import getAccountList from '@salesforce/apex/Second_component_datatable.getAccountList';

// Define columns for the datatable
const columns = [
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency' },
    { label: 'Website', fieldName: 'Website', type: 'url', typeAttributes: { label: { fieldName: 'Name' } } }
];

export default class BasicDataTable extends LightningElement {
    @track accounts = [];
    @track error;
    @track isLoading = true;
    columns = columns;

    // Wire method to get account data from Apex
    @wire(getAccountList)
    wiredAccounts({ error, data }) {
        this.isLoading = false;
        if (data) {
            this.accounts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body.message;
            this.accounts = undefined;
        }
    }
}