import { Component, OnInit } from '@angular/core';
import { Overtime } from '../../models/overtime';
import { UserResponse } from '../../responses/user/user.response';
import { Router } from '@angular/router';
import { OvertimeService } from '../../services/overtime.service';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-overtime-list',
  // standalone: true,
  // imports: [],
  templateUrl: './overtime-list.component.html',
  styleUrl: './overtime-list.component.scss'
})
export class OvertimeListComponent implements OnInit {
  registrations: any[] = [];
  filteredRegistrations: any[] = [];
  startDate?: String;
  endDate?: String;
  totalWorkHours: number = 0;
  currentPage: number = 1;
  pageSize: number = 15;
  overtimes : Overtime[] = [];
  userResponse : UserResponse | null = null;

  // constructor(private remoteListService: RemoteListService) { }

  ngOnInit(): void {
    this.registrations = this.getRegistrations();
    this.filteredRegistrations = this.paginate(this.registrations, this.currentPage, this.pageSize);
    this.calculateTotalWorkHours();
    this.userResponse = this.userService.getUserResponseFromLocalStorage();
    this.getById();
  }

  constructor(
    private router : Router,
    private overtimeService : OvertimeService,
    private userService : UserService
  ){}

  getById() {
    this.overtimeService.getByUserId(this.userResponse?.id ?? 0).subscribe({
      next: (response: any) => {
        debugger;
        this.overtimes = response;
        
      },
      complete: () => {
        debugger;
      },
      error: (error: any) => {
        debugger;
        console.error('Error fetching products:', error);
      },
    });
  }

  // getRegistrations(): void {
  //   this.remoteListService.getRegistrations()
  //     .subscribe((registrations : any[]) => {
  //       this.registrations = registrations;
  //       this.filteredRegistrations = registrations;
  //       this.calculateTotalWorkHours();
  //     });
  // }
  getRegistrations(): any[] {
    const registrations = [];
    const startDate = new Date('2024-04-01');
    for (let i = 0; i < 50; i++) {
      const date = new Date(startDate);
      date.setDate(startDate.getDate() + i);
      const registration = {
        date: this.formatDate(date),
        startTime: this.randomTime(),
        endTime: this.randomTime(),
        task: 'Task ' + (i + 1)
      };
      registrations.push(registration);
    }
    return registrations;
  }

  private formatDate(date: Date): string {
    return date.toISOString().split('T')[0];
  }

  private randomTime(): string {
    const hour = Math.floor(Math.random() * 24);
    const minute = Math.floor(Math.random() * 60);
    return `${hour < 10 ? '0' + hour : hour}:${minute < 10 ? '0' + minute : minute}`;
  }


  filterByDateRange(): void {
    if (this.startDate !== undefined && this.endDate !== undefined) {
      this.filteredRegistrations = this.registrations.filter(registration => {
        return registration.date >= this.startDate! && registration.date <= this.endDate!;
      });
      this.calculateTotalWorkHours();
    }
  }
  

  calculateWorkHours(startTime: Date, endTime: Date): number {
    // Viết mã để tính thời gian làm giữa startTime và endTime
    // Giả sử đã có một hàm đã được triển khai để thực hiện điều này
    return 0;
  }

  calculateTotalWorkHours(): void {
    this.totalWorkHours = this.filteredRegistrations.reduce((total, registration) => {
      return total + this.calculateWorkHours(registration.startTime, registration.endTime);
    }, 0);
  }

  navigateToOtherPage(){
    // Sử dụng navigateByUrl để chuyển hướng đến đường dẫn mong muốn
    this.router.navigateByUrl('/overtime_form');
  }
  getTotalPages(): number {
    // Calculate total pages
    return Math.ceil(this.registrations.length / this.pageSize);
  }

  paginate(data: any[], currentPage: number, pageSize: number): any[] {
    // Calculate start and end index
  const startIndex = (currentPage - 1) * pageSize;
  let endIndex = startIndex + pageSize;

  // Ensure endIndex does not exceed the length of the data array
  endIndex = Math.min(endIndex, data.length);

  // Return the paginated portion of the data array
  return data.slice(startIndex, endIndex);
  }

  previousPage(): void {
    // Navigate to previous page
    if (this.currentPage > 1) {
      this.currentPage--;
      this.filteredRegistrations = this.paginate(this.registrations, this.currentPage, this.pageSize);
    }
  }

  nextPage(): void {
    // Navigate to next page
    if (this.currentPage < this.getTotalPages()) {
      this.currentPage++;
      this.filteredRegistrations = this.paginate(this.registrations, this.currentPage, this.pageSize);
    }
  }
  parseStringToDateTime(dateString: any): string {
    // Kiểm tra xem dateString có phải là mảng không
    if (!Array.isArray(dateString) || dateString.length < 5) {
        throw new Error('Invalid date string format');
    }
    
    // Trích xuất các thành phần ngày và giờ từ mảng và tạo đối tượng Date
    const [year, month, day, hours, minutes, seconds] = dateString;
    
    // Định dạng lại ngày giờ theo định dạng "dd/MM/yyyy HH:mm:ss" hoặc "dd/MM/yyyy HH"
    let formattedDate = `${("0" + day).slice(-2)}/${("0" + month).slice(-2)}/${year} ${("0" + hours).slice(-2)}`;
    
    // Nếu có phút và giây khác 00, thêm phút và giây vào chuỗi định dạng
    if (typeof seconds !== 'undefined') {
        formattedDate += `:${("0" + minutes).slice(-2)}:${("0" + seconds).slice(-2)}`;
    } else {
        formattedDate += `:00:00`;
    }
  
    return formattedDate;
}
  parseStringToDate(dateArray: any): string {
    // Kiểm tra xem dateArray có phải là mảng không
    if (!Array.isArray(dateArray) || dateArray.length !== 3) {
      throw new Error('Invalid date array format');
    }

    // Trích xuất các thành phần ngày từ mảng và tạo đối tượng Date
    const [year, month, day] = dateArray;
    const date = new Date(year, month - 1, day);

    // Định dạng lại ngày theo định dạng "dd/MM/yyyy"
    const formattedDate = `${('0' + day).slice(-2)}/${('0' + month).slice(
      -2
    )}/${year}`;

    return formattedDate;
  }
}
