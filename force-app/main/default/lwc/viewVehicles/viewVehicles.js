import { LightningElement, wire} from 'lwc';
import getVehicles from '@salesforce/apex/Vehicles.getVehicles';
import persistPurchase from '@salesforce/apex/Vehicles.persistPurchase';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class ViewVehicles extends LightningElement {
    vehicles;

    @wire(getVehicles)
    wiredVehicles({data, error}){
        if(data){
            this.vehicles = data;
            console.log('Deu bom');
        } else if (error){
            console.log('Deu ruim', error);
        }
    }

    purchase(event){
        var targetId = event.currentTarget.dataset.id;
        if(targetId){
            persistPurchase({carId: targetId})
            .then(result => {
                this.showToast('Sucesso', 'Parabéns, você adquiriu um novo carro.', 'SUCCESS');
                console.log('Sucesso');
                //location.reload();
            })
            .catch(error => {
                this.showToast('OPS!', 'Algo deu errado.', 'ERROR');
                console.log('Falhou', error);
            })
        }
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
          title: title,
          message: message,
          variant: variant
        });
        this.dispatchEvent(event);
      }
}