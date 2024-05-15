import { User } from "../../models/user";

export interface RemoteResponse {
    id: number,
     user : User,
     from_date_time : Date,
     end_date_time : Date,
     date: string,
     type : String,
     reason : string,
     total_hours : number,
     evident : string,
     approver_id: string,
     approver: string,
     comment: string,
      status: string
}