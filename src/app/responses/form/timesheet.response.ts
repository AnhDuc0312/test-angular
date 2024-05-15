import { User } from "../../models/user";

export interface TimeSheetResponse {
    id: number,
    user : User,
    in_time: Date,
    out_time : Date,
    working_hours : number,
    overtime_hours: number,
    leave_hours : number,
    record_date : Date,
    check_in : Date,
    check_out: Date,
}