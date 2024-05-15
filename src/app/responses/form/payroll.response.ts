import { User } from "../../models/user";

export interface PayrollResponse {
    id: number,
    user : User,
    date : Date,
    basic_salary : number,
    overtime_salary : number,
    benifit : number,
    late_deduction : number,
    total_salary : number
}