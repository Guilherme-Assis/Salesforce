import { LightningElement, track } from 'lwc';
export default class Twilio extends LightningElement {
    @track repos;
    @track messages;

    handleFetch(){
        let endPoint = 'https://api.twilio.com/2010-04-01/Accounts/AC79583071451569290369ef4ea10f55b6/Messages.json?DateSent=2021-12-15';
        fetch(endPoint, {
            method: 'GET',
            headers: {
                'Authorization' : 'Basic QUM3OTU4MzA3MTQ1MTU2OTI5MDM2OWVmNGVhMTBmNTViNjo1ODA1MWRjNGU3YmQ4NWI3YjZhYWQyMDg5MWNmOTNiNQ=='
            }
        })
        .then((response) => response.json())
        .then((repos) => {
            this.repos = JSON.parse(JSON.stringify(repos));
        });
        console.log(this.repos.messages);
    }
}