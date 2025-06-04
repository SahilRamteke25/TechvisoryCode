import { LightningElement, wire } from 'lwc';
import { publish, MessageContext} from 'lightning/messageService';
import Countingupdt from '@salesforce/messageChannel/CountingUpdt__c';

export default class Publishlwc extends LightningElement {
    @wire(MessageContext) messageContext;

    handleincriment(){
        const payload ={
            operator:'Add',
            constant:1
        };
        publish(this.messageContext, Countingupdt, payload);
}
    handledecriment(){
         const payload ={
            operator:'Substract',
            constant:1
        };
        publish(this.messageContext, Countingupdt, payload);
}
    handlemultiplication(){
         const payload ={
            operator:'Multiply',
            constant:2
        };
        publish(this.messageContext, Countingupdt, payload);
} 
}