import { User } from "../../models/user";

export interface InOutForgetResponse {
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