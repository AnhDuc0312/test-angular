import { Component, OnInit, inject } from '@angular/core';
import { Employee } from '../../../models/employee';
import { EmployeeService } from '../../../services/employee.service';
import { environment } from '../../../../environments/enviroment';
import { EmployeeResponse } from '../../../responses/employee/employee.response';
import { UserService } from '../../../services/user.service';
import { Router } from '@angular/router';
import { NewEmployeeModalComponent } from '../new-employee-modal/new-employee-modal.component';
import { MdbModalRef, MdbModalService } from 'mdb-angular-ui-kit/modal';

@Component({
  selector: 'app-employee-ad',
  templateUrl: './employee-ad.component.html',
  styleUrls: ['./employee-ad.component.scss']
})
export class EmployeeAdComponent implements OnInit {
  company : string = "Zen Staff"
  totalEmployees: number = 0;
  totalDepartments: number = 0;
  employeesWorking: number = 0;
  searchQuery: string = '';
  filteredEmployees: Employee[] = [];
  currentPage: number = 0;
  pageSize: number = 50;
  pages: number[] = [];
  selectedRow: number = -1;
  employees : EmployeeResponse[] = [];
  keyword : string ="";
  selectedDepartmentId : number = 0;
  totalPages : number = 0;
  localStorage?:Storage;
  visiblePages: number[] = [];

  private employeeService  = inject(EmployeeService);
  modalRef: MdbModalRef<NewEmployeeModalComponent> | null = null;

  constructor(private userService : UserService,
    private router : Router,
    private modalService: MdbModalService) {
  }

  ngOnInit(): void {
    // Initialize data and calculate summary
    // this.filteredEmployees = this.employeeService.generateEmployees();
    this.calculateSummary();
    this.getEmployees(this.currentPage, this.pageSize, this.selectedDepartmentId,this.keyword);

  }

  getEmployees(page: number, size: number, selectedDepartmentId: number, keyword: string) {
    debugger
    this.employeeService.getAllEmployees(page, this.pageSize, selectedDepartmentId, keyword).subscribe({
      next: (response: any) => {
        debugger
        this.employees = response.employees;
        this.totalPages = response.totalPages;
        this.visiblePages = this.generateVisiblePageArray(this.currentPage, this.totalPages);
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

  onPageChange(page: number) {
    debugger;
    this.currentPage = page;    
    this.getEmployees(this.currentPage, this.pageSize, this.selectedDepartmentId, this.keyword);
  }

  generateVisiblePageArray(currentPage: number, totalPages: number): number[] {
    const maxVisiblePages = 5;
    const halfVisiblePages = Math.floor(maxVisiblePages / 2);
  
    let startPage = Math.max(currentPage - halfVisiblePages, 1);
    let endPage = Math.min(startPage + maxVisiblePages - 1, totalPages);
  
    if (endPage - startPage + 1 < maxVisiblePages) {
      startPage = Math.max(endPage - maxVisiblePages + 1, 1);
    }
  
    return new Array(endPage - startPage + 1).fill(0)
      .map((_, index) => startPage + index);
  }
  delete(id:number) {
    const confirmation = window
      .confirm('Are you sure you want to delete this order?');
    if (confirmation) {
      debugger
      this.employeeService.delete(this.employees[id].username).subscribe({
        next: (response: any) => {
          debugger 
          alert("Xóa nhân viên thành công !")
          location.reload();          
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
  resetPassword(id: number) {
    // Thực hiện logic để reset mật khẩu cho mục tương ứng ở chỉ mục index
    // Ví dụ: gọi một service để thực hiện hành động reset mật khẩu
    const confirmation = window
      .confirm('Are you sure you want to delete this order?');
    if (confirmation) {
      debugger
      this.userService.resetPassword(this.employees[id].username).subscribe({
        next: (response: any) => {
          debugger 
          alert("Successfully")
          location.reload();          
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




  calculateSummary() {
    this.totalEmployees = this.filteredEmployees.length;
    // Calculate total departments, employees working, etc.
    // You can add your actual data calculation logic here
  }

  searchEmployees() {
    // Filter employees based on search query
    this.currentPage = 0;
    this.pageSize = 10;
    // You should implement your actual search logic here
    // this.filterEmployees();
    this.getEmployees(this.currentPage, this.pageSize, this.selectedDepartmentId,this.keyword.trim());
  }

  filterEmployees() {
    // Apply pagination and filtering
    // You should implement your actual filtering and pagination logic here
    this.filteredEmployees = []; // Update with filtered employees
    this.generatePageNumbers();
  }

  generatePageNumbers() {
    // Generate page numbers based on filtered data and page size
    // You should implement your actual pagination logic here
    this.pages = []; // Update with generated page numbers
  }

  changePage(page: number) {
    // Change current page
    this.currentPage = page;
    this.filterEmployees();
  }

  getDetail(employeeId: number) {
    // Get details of a specific employee
    // You should implement your actual function to get employee details here
  }
  toggleDetails(index: number) {
    this.selectedRow = this.selectedRow === index ? -1 : index;
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

  openModal() {
    this.modalRef = this.modalService.open(NewEmployeeModalComponent , {
      data : {},
      
      modalClass: 'modal-xl',
      
    });
  }

  
}
