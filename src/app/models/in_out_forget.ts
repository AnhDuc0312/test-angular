import { User } from "./user";

export interface InOutForget {
  id: number,
     user : User,
    date : Date,
    in_time : Date,
    out_time : Date,
    total_hours: number,
    reason : string,
    evident: string,
    approver_id : number,
    comment: string,
    status : string
  }
  