import { User } from "./user";

export interface Employee {
  id: number;
  full_name: string;
  gender: string;
  date_of_birth: Date;
  email: string;
  phone_number: string;
  address: string;
  user :User;
  contact_start_date: Date;
  contact_end_date: Date;
  avatar_url: string;
  education: string;
  department: string;
  position: string;
  allowance : number;
  basicSalary  : number;

  // constructor(
  //   // id: number,
  //   name: string,
  //   gender: string,
  //   dateOfBirth: Date,
  //   email: string,
  //   phoneNumber: string,
  //   address: string,
  //   contactStartDate: Date,
  //   contactEndDate: Date,
  //   avatarUrl: string,
  //   education: string,
  //   department: string,
  //   position: string
  // ) {
  //   // this.id = id;
  //   this.name = name;
  //   this.gender = gender;
  //   this.dateOfBirth = dateOfBirth;
  //   this.email = email;
  //   this.phoneNumber = phoneNumber;
  //   this.address = address;
  //   this.contactStartDate = contactStartDate;
  //   this.contactEndDate = contactEndDate;
  //   this.avatarUrl = avatarUrl;
  //   this.education = education;
  //   this.department = department;
  //   this.position = position;
  // }

  
}
