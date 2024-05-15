import { User } from "./user";

export interface TimeSheet {
    id: number,
    user : User,
    date : Date,
    in_time: Date,
    out_time : Date,
    working_hours : number,
    overtime_hours: number,
    leave_hours : number,
    record_date : Date,
    check_in : number[],
    check_out: Date,
    status : string,
    type_work : string,
    code : string
    full_name : string
    
  }
  