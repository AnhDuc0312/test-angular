export class NewsDTO {
    title : string;
    content : string;

    constructor(data : any){
        this.title = data.title;
        this.content = data.content; 
    }
       
   
}