import { Component, OnInit } from '@angular/core';
import { TimeSheet } from '../../../models/timekeep';
import { TimeSheetService } from '../../../services/timekeep.service';

@Component({
  selector: 'app-timekeep-ad',
  // standalone: true,
  // imports: [],
  templateUrl: './timekeep-ad.component.html',
  styleUrl: './timekeep-ad.component.scss',
})
export class TimekeepAdComponent implements OnInit {
  totalToday: number = 0;
  totalApproved: number = 0;
  totalPending: number = 0;
  searchQuery: string = '';
  records: TimeSheet[] = [];
  currentPage: number = 1;
  pageSize: number = 15;
  pages: number[] = [];
  filteredRecords: TimeSheet[] = [];
  timeSheets: TimeSheet[] = [];

  constructor(private timeSheetService: TimeSheetService) {}

  ngOnInit(): void {
    // this.records = this.timekeepingService.generateTimekeepingRecords();
    this.filteredRecords = this.records; // Khởi tạo filteredRecords với toàn bộ records ban đầu
    // this.calculateSummary();
    this.generatePageNumbers();
    this.getAlls();
  }

  calculateSummary() {
    // Calculate summary statistics
    // Replace this with actual logic
    this.totalToday = 50;
    this.totalApproved = 30;
    this.totalPending = 20;
  }

  getAlls() {
    debugger;
    this.timeSheetService.getAll().subscribe({
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
        this.totalToday = timeSheetsToday.length;
        const timeSheetsSts = this.timeSheets.filter((timeSheetsToday) => {
          const status = new String(timeSheetsToday.status);
          if (status === 'approver') {
            this.totalApproved++;
          } else if (status === 'pending') {
            this.totalPending++;
          }
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

  search() {
    // Implement search functionality
    // Replace this with actual search logic
    this.filteredRecords = this.records.filter((record) =>
      record.user.username.includes(this.searchQuery)
    );
    this.calculateSummary();
    this.generatePageNumbers();
  }

  showDetail(record: TimeSheet) {
    // Implement detail view
    // Replace this with actual detail view logic
    console.log('Detail:', record);
  }

  changePage(page: number) {
    // Change current page
    this.currentPage = page;
    this.generatePageNumbers();
  }

  generatePageNumbers() {
    // Generate page numbers based on filtered data and page size
    // Replace this with actual pagination logic
    this.pages = Array.from(
      { length: Math.ceil(this.filteredRecords.length / this.pageSize) },
      (_, i) => i + 1
    );
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
    const formattedDate = `${("0" + day).slice(-2)}/${("0" + month).slice(-2)}/${year} ${("0" + hours).slice(-2)}:${("0" + minutes).slice(-2)}:${("0" + seconds).slice(-2)}`;
    
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
    const formattedDate = `${("0" + day).slice(-2)}/${("0" + month).slice(-2)}/${year}`;
    
    return formattedDate;
  }
}
