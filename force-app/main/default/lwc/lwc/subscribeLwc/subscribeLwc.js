import { LightningElement, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import Countingupdt from '@salesforce/messageChannel/CountingUpdt__c';

export default class Subscribelwc extends LightningElement {

    counter = 0;
    subscription = null;

    @wire(MessageContext)
    messageContext;

    connectedCallback(){
        this.subscribeToMessageChannel();
    }

    subscribeToMessageChannel()
{
        this.subscription = subscribe(
            this.messageContext,
            Countingupdt,
            (message) => this.handleMessage(message)
);
}

handleMessage(message){
if(message.operator =='Add'){
        this.counter += message.constant;
    }
    else if(message.operator =='Substract'){
        this.counter -= message.constant;
    }   
    else if (message.operator =='Multiply') {
         this.counter *= message.constant;
}

}
}