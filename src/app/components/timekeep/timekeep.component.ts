import { Component, OnInit } from '@angular/core';
import { TimeSheetService } from '../../services/timekeep.service';
import { UserService } from '../../services/user.service';
import { UserResponse } from '../../responses/user/user.response';
import { TimeSheet } from '../../models/timekeep';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { PopupComponent } from '../popup/popup.component';


@Component({
  selector: 'app-timekeep',
  // standalone: true,
  // imports: [],
  templateUrl: './timekeep.component.html',
  styleUrl: './timekeep.component.scss',
})
export class TimekeepComponent implements OnInit {
  currentPage: number = 1;
  itemsPerPage: number = 10;
  totalItems: number = 100;
  searchDate: Date = new Date();
  attendanceRecords: any[] = []; // Mảng chứa các bản ghi chấm công
  selectedTypework: string = 'Onsite';
  userResponse: UserResponse | null = null;
  timeSheets: TimeSheet[] = [];

  constructor(
    private timeSheetService: TimeSheetService,
    private userService: UserService,
    private router : Router,
    private dialog : MatDialog
  ) {}

  ngOnInit(): void {
    // Khởi tạo dữ liệu mẫu (điều chỉnh theo nhu cầu của bạn)
    // this.generateFakeData();
    this.userResponse = this.userService.getUserResponseFromLocalStorage();
    this.getById();
  }

  // Lấy ngày hiện tại
  currentDate = new Date();

// Chuyển đổi ngày hiện tại thành chuỗi
  dateString = this.currentDate.toISOString().split('T')[0];

  code = this.dateString + this.userResponse?.username;

  checkIn(): void {
    const timeSheetData = {
      
      user_id: this.userResponse?.id ?? 0,
      type_work: this.selectedTypework,
      in_time: new Date(),
      out_time: new Date(),
      status: '',
      working_hours: 0,
      overtime_hours: 0,
      leave_hours: 0,
      record_date: new Date(),
      check_in: new Date(),
      check_out: new Date(),
      code : ''
      

      // Các thông tin khác có thể thêm vào dựa trên yêu cầu của ứng dụng
    };

    this.timeSheetService.checkin(timeSheetData).subscribe(
      (response) => {
        console.log(response);
        alert ("Check in thành công")
        location.reload();

        // Cập nhật giao diện hoặc thực hiện các hành động khác sau khi check-in thành công
      },
      (error) => {
        if(this.userResponse == null) {
        alert ("Bạn cần phải đăng nhập")

          // this.openPopup("Bạn cần phải đăng nhập");
        }
        console.error('Error occurred while checking in:', error);
        // Xử lý lỗi nếu có
      }
    );
  }
  checkOut(): void {
    const timeSheetData = {
      user_id: this.userResponse?.id ?? 0,
      type_work: '',
      in_time: new Date(),
      out_time: new Date(),
      status: '',
      working_hours: 0,
      overtime_hours: 0,
      leave_hours: 0,
      record_date: new Date(),
      check_in: new Date(),
      check_out: new Date(),
      code : this.code

      // Các thông tin khác có thể thêm vào dựa trên yêu cầu của ứng dụng
    };

    this.timeSheetService.checkout(timeSheetData).subscribe(
      (response) => {
        if (response === 'Check-out successful') {
          console.log('Check-out successful');
        alert ("Check out thành công")

          // Thực hiện các hành động sau khi check-out thành công
        } else {
        alert ("Check out thành công")
        console.log(response);
          // Xử lý phản hồi khác nếu cần
        }
        location.reload();
      },
      (error) => {
        if(this.userResponse == null) {
        alert ("Bạn cần phải đăng nhập")

          // this.openPopup("Bạn cần phải đăng nhập");
        }
        console.error('Error occurred while checking in:', error);
        // Xử lý lỗi nếu có
      }
    );
  }
  getById() {
    this.timeSheetService.getById(this.userResponse?.id ?? 0).subscribe({
      next: (response: any) => {
        debugger;
        this.timeSheets = response;
        // this.totalPages = response.totalPages;
        // this.visiblePages = this.generateVisiblePageArray(this.currentPage, this.totalPages);
        const today = new Date();
        const timeSheetsToday = this.timeSheets.filter((timeSheet) => {
          const timeSheetDate = new Date(timeSheet.record_date);
          return (
            timeSheetDate.getDate() === today.getDate() &&
            timeSheetDate.getMonth() === today.getMonth() &&
            timeSheetDate.getFullYear() === today.getFullYear()
          );
        });
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
  filterByDate(): void {
    // Lọc dữ liệu theo ngày tìm kiếm
    if (this.searchDate) {
      this.attendanceRecords = this.attendanceRecords.filter(
        (record) =>
          record.date.toDateString() === this.searchDate.toDateString()
      );
    } else {
      // Nếu không có ngày tìm kiếm, khôi phục dữ liệu ban đầu
      this.attendanceRecords = [];
      // this.generateFakeData();
    }
  }

  getTotalPages(): number {
    return Math.ceil(this.totalItems / this.itemsPerPage);
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
  parseStringToDateTime(dateString: any): string {
    // Kiểm tra xem dateString có phải là mảng không
    if (!Array.isArray(dateString) || dateString.length <5) {
      throw new Error('Invalid date string format');
    }

    // Trích xuất các thành phần ngày và giờ từ mảng và tạo đối tượng Date
    const [year, month, day, hours, minutes, seconds] = dateString;
    const date = new Date(year, month - 1, day, hours, minutes, seconds);

    // Định dạng lại ngày giờ theo định dạng "dd/MM/yyyy HH:mm:ss"
    const formattedDate = `${('0' + day).slice(-2)}/${('0' + month).slice(
      -2
    )}/${year} ${('0' + hours).slice(-2)}:${('0' + minutes).slice(-2)}:${(
      '0' + seconds
    ).slice(-2)}`;

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
  openPopup(message: string): void {
    this.dialog.open(PopupComponent, {
      width: '250px',
      data: { message: message },
      position: {
        top: '50px', // Thiết lập vị trí top của popup
        left: '50px' // Thiết lập vị trí left của popup
      }
    });
  }
}
