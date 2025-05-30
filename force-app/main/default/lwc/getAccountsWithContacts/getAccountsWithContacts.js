import { LightningElement, track } from 'lwc';
import getAccountsWithContacts from '@salesforce/apex/GetAccountsWithContacts.getAccountsWithContacts';

export default class AccountRelatedCOntact extends LightningElement {
    @track accounts;
    @track error;

    connectedCallback() {
    getAccountsWithContacts()
        .then(result => {
            this.accounts = result.map(acc => {
                return { 
                    ...acc, 
                    expanded: false,
                    expandLabel: 'Expand' // default label
                };
            });
            this.error = undefined;
        })
        .catch(error => {
            this.error = error.body.message;
            this.accounts = undefined;
        });
}

    handleExpand(event) {
    const accId = event.target.dataset.id;
    this.accounts = this.accounts.map(acc => {
        if (acc.Id === accId) {
            acc.expanded = !acc.expanded;
            acc.expandLabel = acc.expanded ? 'Collapse' : 'Expand';
        }
        return acc;
    });
}
}