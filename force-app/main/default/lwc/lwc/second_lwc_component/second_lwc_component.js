import { LightningElement, wire, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAccountList from '@salesforce/apex/Second_component_datatable.getAccountList';
import deleteAccounts from '@salesforce/apex/Second_component_datatable.deleteAccounts';
import getTotalAccountCount from '@salesforce/apex/Second_component_datatable.getTotalAccountCount';
const PAGE_SIZE = 10;

export default class BasicDataTable extends NavigationMixin(LightningElement) {
    @track accounts = [];
    @track error;
    @track isLoading = true;
    @track selectedIds = [];
    @track showCreateModal = false;
    @track wiredAccountsResult;

    // pagination variables
    @track currentPage = 1;
    @track totalPages = 0;
    @track totalRecords = 0;

    // Getter for update button disabled state
    get isUpdateDisabled() {
        return this.selectedIds.length !== 1;
    }

    // Getter for delete button disabled state
    get isDeleteDisabled() {
        return this.selectedIds.length === 0;
    }


    get disablePrev() {
        return this.currentPage === 1;
    }

    get disableNext() {
        return this.currentPage >= this.totalPages;
    }

    connectedCallback() {
        this.loadTotalRecords();
        this.loadAccounts();
    }

    loadTotalRecords() {
        getTotalAccountCount()
            .then(count => {
                this.totalRecords = count;
                this.totalPages = Math.ceil(count / PAGE_SIZE);
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    loadAccounts() {
        this.isLoading = true;
        const offset = (this.currentPage - 1) * PAGE_SIZE;
        getAccountList({ limitSize: PAGE_SIZE, offsetSize: offset })
            .then(data => {
                this.accounts = data;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error.body.message;
                this.accounts = [];
                this.showToast('Error', this.error, 'error');
            })
            .finally(() => {
                this.isLoading = false;
            });
    }

    handleNext() {
        if (this.currentPage < this.totalPages) {
            this.currentPage++;
            this.loadAccounts();
        }
    }

    handlePrev() {
        if (this.currentPage > 1) {
            this.currentPage--;
            this.loadAccounts();
        }
    }
    

    // Wire method to get account data from Apex
    @wire(getAccountList)
    wiredAccounts(result) {
        this.wiredAccountsResult = result;
        this.isLoading = false;
        if (result.data) {
            this.accounts = result.data;
            this.error = undefined;
        } else if (result.error) {
            this.error = result.error.body.message;
            this.accounts = undefined;
            this.showToast('Error', this.error, 'error');
        }
    }

    // Handle record selection via checkboxes
    handleSelection(event) {
        const id = event.target.dataset.id;
        if (event.target.checked) {
            this.selectedIds = [...this.selectedIds, id];
        } else {
            this.selectedIds = this.selectedIds.filter(item => item !== id);
        }
    }

   handleView(event) {
        event.preventDefault();
        const recordId = event.currentTarget.dataset.id;
        
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: recordId,
                actionName: 'view'
            },
            state: {
                nooverride: '1'
            },
            // This is the key for opening in new tab
            openInNewTab: true
        });
    }

    // Handle edit from action column
    handleEdit(event) {
        const id = event.currentTarget.dataset.id;
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: id,
                actionName: 'edit'
            }
        });
    }

    // Handle create button click
    handleCreate() {
        this.showCreateModal = true;
    }

    // Handle update button click
    handleUpdate() {
        if (this.selectedIds.length === 1) {
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.selectedIds[0],
                    actionName: 'edit'
                }
            });
        }
    }

    // Handle bulk delete from top buttons
    handleDelete() {
        if (this.selectedIds.length === 0) return;
        
        if (confirm('Are you sure you want to delete the selected accounts?')) {
            this.isLoading = true;
            deleteAccounts({ accountIds: this.selectedIds })
                .then(() => {
                    this.showToast('Success', 'Accounts deleted successfully', 'success');
                    return this.refreshData();
                })
                .then(() => {
                    this.selectedIds = [];
                })
                .catch(error => {
                    this.error = error.body.message;
                    this.showToast('Error', this.error, 'error');
                })
                .finally(() => {
                    this.isLoading = false;
                });
        }
    }

    // Handle single record delete from action column
    handleSingleDelete(event) {
        const id = event.currentTarget.dataset.id;
        if (confirm('Are you sure you want to delete this account?')) {
            this.isLoading = true;
            deleteAccounts({ accountIds: [id] })
                .then(() => {
                    this.showToast('Success', 'Account deleted successfully', 'success');
                    return this.refreshData();
                })
                .then(() => {
                    this.selectedIds = this.selectedIds.filter(item => item !== id);
                })
                .catch(error => {
                    this.error = error.body.message;
                    this.showToast('Error', this.error, 'error');
                })
                .finally(() => {
                    this.isLoading = false;
                });
        }
    }

    // Close modal
    closeModal() {
        this.showCreateModal = false;
    }

    // Handle create success
    handleCreateSuccess(event) {
        this.showCreateModal = false;
        this.showToast('Success', 'Account created successfully', 'success');
        this.refreshData();
    }

    // Refresh data using refreshApex
    refreshData() {
        this.isLoading = true;
        return refreshApex(this.wiredAccountsResult)
            .catch(error => {
                this.error = error.body.message;
                this.showToast('Error', this.error, 'error');
            })
            .finally(() => {
                this.isLoading = false;
            });
    }

    // Helper method to show toast messages
    showToast(title, message, variant) {
        const toastEvent = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(toastEvent);
    }
}