import { Component } from '@angular/core';
import { EmployeeService } from '../../../services/employee.service';
import { Employee } from '../../../models/employee';

@Component({
  selector: 'app-add-employee',
  templateUrl: './add-employee.component.html',
  styleUrl: './add-employee.component.scss'
})
export class AddEmployeeComponent {
 // Khởi tạo một đối tượng Employee mới để lưu thông tin của nhân viên được nhập từ form

  constructor(private employeeService: EmployeeService ) {} // Inject service EmployeeService

  submitEmployee() {
    // Gọi phương thức trong service để thêm mới nhân viên
    // this.employeeService.addEmployee(this.employee).subscribe(
      // () => {
        // Xử lý sau khi thêm mới nhân viên thành công
        // console.log('Employee added successfully!');
      // },
      // (error) => {
        // Xử lý khi có lỗi xảy ra
      //   console.error('Error adding employee:', error);
      // }
    // );

}
}

