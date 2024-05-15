import { Component, OnInit } from '@angular/core';
import { UserResponse } from '../../responses/user/user.response';
import { UserService } from '../../services/user.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  // standalone: true,
  // imports: [],
  templateUrl: './header.component.html',
  styleUrl: './header.component.scss'
})
export class HeaderComponent implements OnInit {

  userResponse : UserResponse | null = null;
  loggedIn: boolean = false;
  ngOnInit(): void {
    this.userResponse = this.userService.getUserResponseFromLocalStorage();
    if (this.userResponse) {
      this.loggedIn = true;
      
    }
  }

  constructor(
    private userService : UserService,
    private router : Router
  ) {
    
  }

  logout() {
    this.router.navigate(['/']);
    // Xóa thông tin người dùng từ local storage khi người dùng đăng xuất
    this.userService.removeUserFromLocalStorage();
    // Cập nhật giá trị của userResponse
    this.userResponse = null;
    this.loggedIn = false;
  }

}
