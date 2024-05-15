import { Component, OnInit } from '@angular/core';
import { Employee } from '../../../models/employee';
import { User } from '../../../models/user';
import { MdbModalRef } from 'mdb-angular-ui-kit/modal';

@Component({
  selector: 'app-new-employee-modal',
  // standalone: true,
  // imports: [],
  templateUrl: './new-employee-modal.component.html',
  styleUrl: './new-employee-modal.component.scss'
})
export class NewEmployeeModalComponent implements OnInit{
  newEmployee: Employee = { // Initialize newEmployee object
    id: 0, // Assuming auto-increment for ID
    full_name: '',
    gender: '',
    date_of_birth: new Date(),
    email: '',
    phone_number: '',
    address: '',
    user: {} as User, // Initialize empty User object
    contact_start_date: new Date(),
    contact_end_date: new Date(),
    avatar_url: '',
    education: '',
    department: '',
    position: '',
    allowance: 0,
    basicSalary : 0,
  };

  constructor(public modalRef: MdbModalRef<NewEmployeeModalComponent>) { }

  ngOnInit(): void {
  }

  onSubmit() {
    // Implement logic to submit the new employee data to your backend service
    // This might involve data validation, error handling, and success/failure messages
    console.log('Submitted new employee:', this.newEmployee);
    this.modalRef.close(); // Close the modal after submission
  }

}
