import { LightningElement, track } from 'lwc';

export default class FileUpload extends LightningElement {
    @track imageUrl;

    handleFileChange(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onloadend = () => {
                this.imageUrl = reader.result;
            };
            reader.readAsDataURL(file);
        }
    }
}