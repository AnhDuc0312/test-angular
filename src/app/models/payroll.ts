import { User } from "./user";

export interface Payroll {
  id: number,
     user : User,
     date : Date,
     basic_salary : number,
     overtime_salary : number,
     benifit : number,
     late_deduction : number,
     total_salary : number
  }
  