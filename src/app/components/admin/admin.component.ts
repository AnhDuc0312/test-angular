import { Component, OnInit } from '@angular/core';

import { Router } from '@angular/router';
import { UserService } from '../../services/user.service';
import { UserResponse } from '../../responses/user/user.response';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.scss'],
})
export class AdminComponent implements OnInit {
  //adminComponent: string = 'orders';
  numberOfPendingRequests: number = 0;
  showTooltip: boolean = false;

  userResponse : UserResponse | null = null
  constructor(private router: Router,
    private userService : UserService
    ) {}
  ngOnInit() {
    this.router.navigate(['/admin/about']);
    this.getNumberOfPendingRequests();
    this.userResponse = this.userService.getUserResponseFromLocalStorage();
    if (!this.userResponse) {
      // Xử lý trường hợp không có giá trị userResponse từ localStorage
      console.error('No userResponse found in local storage.');
    }
  }
  logout() {
    this.router.navigate(['/']);
    // Xóa thông tin người dùng từ local storage khi người dùng đăng xuất
    this.userService.removeUserFromLocalStorage();
    // Cập nhật giá trị của userResponse
    this.userResponse = null;
  }
  showAdminComponent(componentName: string): void {
    //this.adminComponent = componentName;orders,categories
    if (componentName == 'employees') {
      this.router.navigate(['/admin/employees']);
    } else if (componentName == 'remotes') {
      this.router.navigate(['/admin/remotes']);
    } else if (componentName == 'overtimes') {
      this.router.navigate(['/admin/overtimes']);
    } else if (componentName == 'leaves') {
      this.router.navigate(['/admin/leaves']);
    } else if (componentName == 'timekeeps') {
      this.router.navigate(['/admin/timekeeps']);
    } else if (componentName == 'news') {
      this.router.navigate(['/admin/news']);
    }  else if (componentName == 'about') {
      this.router.navigate(['/admin/about']);
    } else if (componentName == 'payroll') {
      this.router.navigate(['/admin/payrolls']);
    } 

  }
  getNumberOfPendingRequests() {
    return 0;
  }
  sidebarExpanded: boolean = true;

    toggleSidebar() {
        this.sidebarExpanded = !this.sidebarExpanded;
        const sidebar = document.getElementById('sidebar');
        if (sidebar) {
            sidebar.style.width = this.sidebarExpanded ? '200px' : '60px';
        }
    }
}


/**
 npm install --save font-awesome
 angular.json:
 "styles": [   
    "node_modules/font-awesome/css/font-awesome.min.css"
],

 */
