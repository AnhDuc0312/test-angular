import { Component , OnInit} from '@angular/core';
import { Overtime } from '../../../models/overtime';
import { OvertimeService } from '../../../services/overtime.service';

@Component({
  selector: 'app-overtime-ad',
  // standalone: true,
  // imports: [],
  templateUrl: './overtime-ad.component.html',
  styleUrl: './overtime-ad.component.scss'
})
export class OvertimeAdComponent implements OnInit{
  totalToday: number = 0;
  totalApproved: number = 0;
  totalPending: number = 0;
  searchQuery: string = '';
  records: Overtime[] = [];
  filteredRecords: Overtime[] = [];
  currentPage: number = 1;
  pageSize: number = 15;
  pages: number[] = [];
  overtimes : Overtime[] = [];
  selectedRow: number = -1;

  constructor(private overtimeService: OvertimeService) {}

  ngOnInit(): void {
    // this.records = this.overtimeService.generateOvertimeRecords();
    this.filteredRecords = this.records;
    this.calculateSummary();
    this.generatePageNumbers();
    this.getAlls();
  }

  getAlls() {
    debugger
    this.overtimeService.getAll().subscribe({
      next: (response: any) => {
        debugger
        this.overtimes = response;
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

  calculateSummary() {
    this.totalToday = this.records.filter(record => record.date === this.getCurrentDate()).length;
    this.totalApproved = this.records.filter(record => record.status === 'Approved').length;
    this.totalPending = this.records.filter(record => record.status === 'Pending').length;
  }

  search() {
    this.filteredRecords = this.records.filter(
      record =>
        record.user.username.includes(this.searchQuery) ||
        record.user.fullName.includes(this.searchQuery)
    );
    this.calculateSummary();
    this.generatePageNumbers();
  }

  showDetail(record: Overtime) {
    console.log('Detail:', record);
  }

  changePage(page: number) {
    this.currentPage = page;
    this.generatePageNumbers();
  }

  generatePageNumbers() {
    this.pages = Array.from(
      { length: Math.ceil(this.filteredRecords.length / this.pageSize) },
      (_, i) => i + 1
    );
  }

  getCurrentDate(): string {
    const today = new Date();
    const year = today.getFullYear();
    const month = today.getMonth() + 1 < 10 ? '0' + (today.getMonth() + 1) : today.getMonth() + 1;
    const day = today.getDate() < 10 ? '0' + today.getDate() : today.getDate();
    return `${year}-${month}-${day}`;
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

toggleDetails(index: number) {
  this.selectedRow = this.selectedRow === index ? -1 : index;
}
reject(id : number) {

}

aprrove(id : number) {
  
}
}
