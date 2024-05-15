import { Component , OnInit} from '@angular/core';
import { Remote } from '../../../models/remote';
import { RemoteService } from '../../../services/remote.service';

@Component({
  selector: 'app-remote-ad',
  // standalone: true,
  // imports: [],
  templateUrl: './remote-ad.component.html',
  styleUrl: './remote-ad.component.scss'
})
export class RemoteAdComponent implements OnInit{
  totalToday: number = 0;
  totalApproved: number = 0;
  totalPending: number = 0;
  searchQuery: string = '';
  records: Remote[] = [];
  currentPage: number = 1;
  pageSize: number = 15;
  pages: number[] = [];
  filteredRecords: Remote[] = [];
  selectedRow: number = -1;

  constructor(private remoteService: RemoteService) { }

  ngOnInit(): void {
    // this.records = this.remoteService.generateRemoteWorkRecords(); 
    // Sử dụng records thay vì filteredRecords
    this.filteredRecords = this.records; // Khởi tạo filteredRecords với toàn bộ records ban đầu
    this.calculateSummary();
    this.generatePageNumbers();
    this.getAlls();
  }

  getAlls() {
    debugger
    this.remoteService.getAll().subscribe({
      next: (response: any) => {
        debugger
        this.records = response;
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
    // Calculate summary statistics
    // Replace this with actual logic
    this.totalToday = 50;
    this.totalApproved = 30;
    this.totalPending = 20;
  }

  search() {
    // Implement search functionality
    // Replace this with actual search logic
    this.filteredRecords = this.records.filter(record =>
      record.user.id.toString().includes(this.searchQuery) || record.user.fullName.toString().includes(this.searchQuery)
    );
    this.calculateSummary();
    this.generatePageNumbers();
  }

  showDetail(record: Remote) {
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
    this.pages = Array.from({ length: Math.ceil(this.filteredRecords.length / this.pageSize) }, (_, i) => i + 1);
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
