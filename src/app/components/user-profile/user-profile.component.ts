import { Component, OnInit } from '@angular/core';
import { EmployeeService } from '../../services/employee.service';
import { UserResponse } from '../../responses/user/user.response';
import { UserService } from '../../services/user.service';
import { Employee } from '../../models/employee';
import { EmployeeResponse } from '../../responses/employee/employee.response';
import { Router } from '@angular/router';

@Component({
  selector: 'app-user-profile',
  // standalone: true,
  // imports: [],
  templateUrl: './user-profile.component.html',
  styleUrl: './user-profile.component.scss'
})
export class UserProfileComponent implements OnInit{

  userResponse : UserResponse | null = null;
  employees : any= [];
  isEditing: boolean = false;
  company : string = "Zen Staff";
  currentPassword: string = '';
  newPassword: string = '';
  confirmNewPassword: string = '';

  constructor(private employeeService : EmployeeService,
    private userService : UserService,
    private router : Router ){
  }
  ngOnInit(): void {
    
    this.userResponse = this.userService.getUserResponseFromLocalStorage();
    this.getById();
    
  }

  getById() {
    this.employeeService.getByUsername(this.userResponse?.username ?? "").subscribe({
      next: (response: any) => {
        debugger;
        this.employees = response;
        this.employees.username = response.username;
        console.log(this.employees)
        
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
  toggleEditing() {
    this.isEditing = !this.isEditing;
    if (!this.isEditing) {
      // Nếu không trong trạng thái chỉnh sửa, gọi API để cập nhật thông tin nhân viên
      this.updateEmployeeInfo();
    }
  }

  updateEmployeeInfo() {
    // Lấy giá trị từ form
  const updatedEmployeeData = {
    
    full_name: this.employees.full_name,
    gender: this.employees.gender,
    date_of_birth: this.employees.date_of_birth,
    email: this.employees.email,
    phone_number: this.employees.phone_number,
    address: this.employees.address,
    contact_start_date: this.employees.contact_start_date,
    contact_end_date: this.employees.contact_end_date,
    position: this.employees.position,
    education: this.employees.education,
    department: this.employees.department,
    allowance: this.employees.allowance,
    
  };
  debugger

  // Gọi phương thức cập nhật thông tin nhân viên từ service
  this.employeeService.update(this.userResponse?.username ?? "",updatedEmployeeData).subscribe(response => {
    // Xử lý phản hồi từ API (nếu cần)
    debugger
    console.log('Thông tin nhân viên đã được cập nhật:', response);
    alert("Cập nhập thành công !")
    this.router.navigate(['/profile']);
  }, error => {
    // Xử lý lỗi (nếu có)
    console.error('Lỗi khi cập nhật thông tin nhân viên:', error);
    alert("Cập nhập thất bại !")
  });
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

  changePassword(){
    if(this.newPassword !== this.confirmNewPassword){
      // Nếu mật khẩu mới và mật khẩu xác nhận không khớp, hiển thị thông báo lỗi và dừng lại
    alert("Mật khẩu mới và mật khẩu xác nhận không khớp.");
    return;
    }
    this.userService.changePassword(this.userResponse?.id ?? 0,this.currentPassword,this.newPassword).subscribe(response => {
      // Xử lý phản hồi từ API (nếu cần)
      debugger
      console.log( response);
      alert("Cập nhập mật khẩu thành công !")
      this.router.navigate(['/profile']);
    }, error => {
      // Xử lý lỗi (nếu có)
      console.error('Lỗi khi cập nhật mật khẩu:', error);
      alert("Cập nhập thất bại !")
    });
  }
}
