import { Component } from '@angular/core';
import { RemoteService } from '../../services/remote.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-remote',
  // standalone: true,
  // imports: [],
  templateUrl: './remote.component.html',
  styleUrl: './remote.component.scss'
})
export class RemoteComponent {
  type: string = '0';
  reason: string = '';
  date: string = '';
  startTime: Date = new Date();
  endTime: Date = new Date;
  task: string = '';

  constructor(private remoteService: RemoteService,
    private router : Router){
  }

 

  submitForm() {
    const formData = {
      from_datetime : this.date +'T'+ this.startTime,
     to_datetime :this.date +'T'+ this.endTime,
     total_hours: 0,
     type : this.type,
     reason : this.reason,
    //  evident ?: string;
     approver_id: 1,
    //  approver?: string;
     comment: this.task,
     status : "",
    };
    this.remoteService.create(formData).subscribe(response => {
      // Xử lý phản hồi từ server (nếu cần)
      console.log(response);
      alert("đăng kí hoàn tất")
      this.router.navigate(['/remote_my']);

    }, error => {
      // Xử lý lỗi (nếu có)
      console.error(error);
      alert("Thời gian lỗi, xin kiểm tra lại !")
    });

  }

  cancel() {
    // Code to handle form cancellation goes here
    this.router.navigate(['/remote_my']);
  }
  parseStringToDateTime(dateString: any): string {
    // Kiểm tra xem dateString có phải là mảng không
    if (!Array.isArray(dateString) || dateString.length !== 6) {
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
  // Hàm chuyển đổi chuỗi thời gian thành đối tượng Date
parseTimeStringToHour(timeString: string): number {
  const parts = timeString.split(':');
  if (parts.length !== 2) {
    throw new Error('Invalid time string format');
  }
  const hours = parseInt(parts[0], 10);
  return hours;
}

}
