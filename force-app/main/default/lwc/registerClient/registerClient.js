/**
 * Created by gassisal on 21/02/2020.
 */

import { LightningElement, wire, track } from 'lwc';
import getClients from '@salesforce/apex/SearchClientController.searchClients'

export default class RegisterClient extends LightningElement {
    @track nameClient = '';
    @wire(getClients, {aName : '$nameClient'}) clients;

    handleKeyChange(event) {
        let valueInput = event.target.value;
        if (valueInput.length < 3) {
            if (this.nameClient !== '') {
                this.nameClient = '';
            }
            return;
        }
        this.nameClient = valueInput;
    }
}