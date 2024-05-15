import { Component, OnInit } from '@angular/core';
import { LeaveService } from '../../services/leave.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-leave',
  // standalone: true,
  // imports: [],
  templateUrl: './leave.component.html',
  styleUrl: './leave.component.scss'
})
export class LeaveComponent implements OnInit{
  plan: string = 'da-thong-qua';
  reason: string = '';
  date: string = '';
  startTime: Date = new Date();
  endTime: Date = new Date;
  task: string = '';

  constructor(
    private leaveService : LeaveService,
    private router : Router,
  ) {
   
  }
  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }

  submitForm() {
    const formData = {
      from_datetime : this.date +'T'+ this.startTime,
     to_datetime :this.date +'T'+ this.endTime,
     total_hours: 0,
     reason : this.reason,
     approver_id: 1,
     comment: this.task,
     status : "",
  };
  this.leaveService.create(formData).subscribe(response => {
    // Xử lý phản hồi từ server (nếu cần)
    console.log(response);
    alert("đăng kí hoàn tất")
    this.router.navigate(['/leave_my']);

  }, error => {
    // Xử lý lỗi (nếu có)
    console.error(error);
  });
}

  cancel() {
    // Logic to cancel form submission
  }

}
