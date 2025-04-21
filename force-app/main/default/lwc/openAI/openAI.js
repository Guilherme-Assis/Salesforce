import { LightningElement,track,api } from 'lwc';
import fetchCompletion from '@salesforce/apex/openAIclass.textcompletionCeck';

export default class OpenAI extends LightningElement {

@track texttocheck;
@track responseReturned;

assignData(event){
    this.texttocheck = event.target.value;
    console.log(event.target.value);
}

doSearch(){
    fetchCompletion({texttoCheck:this.texttocheck}).then(result=>{
        this.responseReturned = result;       
        console.log(result);     
    }).catch(error=>{            
        alert(JSON.stringify(error));
    });
}
}