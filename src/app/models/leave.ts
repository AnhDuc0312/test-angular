import { User } from "./user"

export interface Leave {
     id: number,
     user : User,
     fromDatetime : Date,
     toDatetime : Date,
     date: string,
     type : String,
     reason : string,
     totalHours : number,
     evident : string,
     approver_id: string,
     approver: string,
     comment: string,
      status: string,
      createAt : Date,
    
  }
  