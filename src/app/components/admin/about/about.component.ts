import { Component, OnInit } from '@angular/core';
import { RemoteService } from '../../../services/remote.service';
import { OvertimeService } from '../../../services/overtime.service';

@Component({
  selector: 'app-about',
  // standalone: true,
  // imports: [],
  templateUrl: './about.component.html',
  styleUrl: './about.component.scss'
})
export class AboutComponent implements OnInit{
  remoteCount : any = [];
  overtimeCount : any = [];
  employees = [
    { name: 'John Doe', position: 'Software Engineer', department: 'Engineering' },
    { name: 'Jane Smith', position: 'HR Manager', department: 'Human Resources' },
    // Add more employees as needed
  ];

  // Fake data for leave management
  leaveRequests = [
    { employeeName: 'John Doe', startDate: '2024-04-01', endDate: '2024-04-03', status: 'Pending' },
    { employeeName: 'Jane Smith', startDate: '2024-04-05', endDate: '2024-04-07', status: 'Approved' },
    // Add more leave requests as needed
  ];

  // Fake data for overtime management
  overtimeRequests = [
    { employeeName: 'John Doe', date: '2024-04-10', hours: 3, status: 'Approved' },
    { employeeName: 'Jane Smith', date: '2024-04-15', hours: 2, status: 'Pending' },
    // Add more overtime requests as needed
  ];

  // Fake data for timekeeping
  timekeepingRecords = [
    { employeeName: 'John Doe', date: '2024-04-20', clockIn: '09:00', clockOut: '17:00' },
    { employeeName: 'Jane Smith', date: '2024-04-20', clockIn: '08:30', clockOut: '16:30' },
    // Add more timekeeping records as needed
  ];

  // Fake data for employee information
  employeeInfo = {
    name: 'John Doe',
    position: 'Software Engineer',
    department: 'Engineering',
    startDate: '2020-01-01',
    // Add more information as needed
  };

  constructor(private remoteService : RemoteService,
  private overtimeService : OvertimeService) {}
  ngOnInit(): void {
    this.getRemote();
    this.getOvertime();
  }

  getRemote() {
    this.remoteService.count().subscribe({
      next: (response: any) => {
        debugger
        this.remoteCount = response;
        console.log(this.remoteCount);
        
        // this.totalPages = response.totalPages;
        // this.visiblePages = this.generateVisiblePageArray(this.currentPage, this.totalPages);
      },
      complete: () => {
        debugger;
      },
      error: (error: any) => {
        debugger;
        console.error('Error fetching products:', error);
      }
    }); 
  }

  getOvertime() {
    this.overtimeService.count().subscribe({
      next: (response: any) => {
        debugger
        this.overtimeCount = response;
        console.log(this.overtimeCount);
        
        // this.totalPages = response.totalPages;
        // this.visiblePages = this.generateVisiblePageArray(this.currentPage, this.totalPages);
      },
      complete: () => {
        debugger;
      },
      error: (error: any) => {
        debugger;
        console.error('Error fetching products:', error);
      }
    }); 
  }


}
