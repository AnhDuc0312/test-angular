// import { Component } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserResponse } from '../../responses/user/user.response';
import { UserService } from '../../services/user.service';
import { LeaveService } from '../../services/leave.service';
import { Leave } from '../../models/leave';



@Component({
  selector: 'app-leave-list',
  templateUrl: './leave-list.component.html',
  styleUrl: './leave-list.component.scss',
})
export class LeaveListComponent {
  

  currentPage = 1;
  itemsPerPage = 10; // Change as needed
  userResponse: UserResponse | null = null;
  leaves : Leave[] = [];

  ngOnInit(): void {
    // Initialize component
    this.filterLeaves();
    this.userResponse = this.userService.getUserResponseFromLocalStorage();
    this.getById();
  }

  constructor(private router: Router, private userService: UserService, private leaveService : LeaveService) {}

  getById() {
    this.leaveService.getByUserId().subscribe({
      next: (response: any) => {
        debugger;
        this.leaves = response;
        
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

  filterLeaves(): void {
    // Implement any filtering logic if needed
  }

  getTotalPages(): number {
    return Math.ceil(this.leaves.length / this.itemsPerPage);
  }

  previousPage(): void {
    if (this.currentPage > 1) {
      this.currentPage--;
    }
  }

  nextPage(): void {
    if (this.currentPage < this.getTotalPages()) {
      this.currentPage++;
    }
  }

  navigateToOtherPage() {
    if (this.userResponse == null) {
      alert('Bạn cần phải đăng nhập');

      // this.openPopup("Bạn cần phải đăng nhập");
    } else {
      // Sử dụng navigateByUrl để chuyển hướng đến đường dẫn mong muốn
      this.router.navigateByUrl('/leave_form');
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
    if (!Array.isArray(dateArray) || dateArray.length <3 ) {
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
