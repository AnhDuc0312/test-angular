import { User } from "../../models/user";

export interface EmployeeResponse {
  id: number;
  full_name: string;
  gender: string;
  date_of_birth: Date;
  email: string;
  phone_number: string;
  address: string;
  contact_start_date: Date;
  contact_end_date: Date;
  avatar_url: string;
  department: string;
  position: string;
  education: string;
  username : string;
  total_page : number;
}