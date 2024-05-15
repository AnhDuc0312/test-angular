import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { LoginDTO } from '../../dtos/user/login.user';
import { RoleService } from '../../services/role.service';
import { ApiResponse } from '../../responses/api.response';
import { Role } from '../../models/role';
import { UserResponse } from '../../responses/user/user.response';
import { UserService } from '../../services/user.service';
import { TokenService } from '../../services/token.service';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-login',
  // standalone: true,
  // imports: [],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent implements OnInit {
  @ViewChild('loginForm') loginForm!: NgForm;

  /*
  //Login user1
  phoneNumber: string = '33445566';
  password: string = '123456789';

  //Login user2
  phoneNumber: string = '0964896239';
  password: string = '123456789';


  //Login admin
  phoneNumber: string = '11223344';
  password: string = '11223344';

  */
  username: string = 'admin';
  password: string = '123456';
  showPassword: boolean = false;

  roles: Role[] = []; // Mảng roles
  rememberMe: boolean = true;
  selectedRole: Role | undefined; // Biến để lưu giá trị được chọn từ dropdown
  userResponse?: UserResponse

  onUsernameChange() {
    console.log(`Phone typed: ${this.username}`);
    //how to validate ? phone must be at least 6 characters
  }
  constructor(
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private userService: UserService,
    private tokenService: TokenService,
    private roleService: RoleService,
    
  ) { }

  ngOnInit() {
    // Gọi API lấy danh sách roles và lưu vào biến roles
    debugger
    this.roleService.getRoles().subscribe({      
      next: (apiResponse: ApiResponse) => { // Sử dụng kiểu Role[]
        debugger
        debugger
    if (Array.isArray(apiResponse)) {
        const roles = apiResponse.map(item => ({
            id: item.id,
            name: item.name.toUpperCase()
        }));
        this.roles = roles;
        this.selectedRole = roles.length > 0 ? roles[0] : undefined;
    } else {
        console.error("Dữ liệu không hợp lệ trong apiResponse");
    }
      
      },
      complete: () => {
        debugger
      },  
      error: (error: any) => {
        debugger
        console.error('Error getting roles:', error);
      }
    });
  }
  createAccount() {
    debugger
    // Chuyển hướng người dùng đến trang đăng ký (hoặc trang tạo tài khoản)
    this.router.navigate(['/register']); 
  }
  login() {
    const message = `phone: ${this.username}` +
      `password: ${this.password}`;
    //alert(message);
    debugger

    const loginDTO: LoginDTO = {
      username: this.username,
      password: this.password,
      role_id: this.selectedRole?.id ?? 1
    };
    this.userService.login(loginDTO).subscribe({
      next: (apiResponse: ApiResponse) => {
        debugger;
        let token: string| undefined = apiResponse.token; // Khởi tạo biến token

      // if (typeof apiResponse.data === "object" && typeof apiResponse.data.token === "string") {
      //   token = apiResponse.data.token; // Trích xuất token nếu tồn tại
      // }
        
        if (token && this.rememberMe) {          
          this.tokenService.setToken(token);
          debugger;
          this.userService.getUserDetail(token).subscribe({
            next: (apiResponse2: ApiResponse) => {
              debugger
              this.userResponse = {
                ...apiResponse2.data
                
              };    
              this.userService.saveUserResponseToLocalStorage(this.userResponse); 
              if(this.userResponse?.role.name == 'admin') {
                this.router.navigate(['/admin']);    
              } else if(this.userResponse?.role.name == 'user') {
                this.router.navigate(['/']);                      
              }
              
            },
            complete: () => {
              debugger;
            },
            error: (error: any) => {
              debugger;
              alert(error.error.message);
            }
          })
        }                        
      },
      complete: () => {
        debugger;
      },
      error: (error: any) => {
        debugger;
        alert(error.error.message);
      }
    });
  }
  togglePassword() {
    this.showPassword = !this.showPassword;
  }

  // username : string = '';
  // password : string ='';
  // role : string ='';

  // roles: Role[] = []; // Mảng roles
  // rememberMe: boolean = true;
  // selectedRole: Role | undefined; // Biến để lưu giá trị được chọn từ dropdown
  // userResponse?: UserResponse

  // constructor(private router : Router,
  //   private roleService : RoleService,
  //   private userService : UserService,
  //   private tokenService : TokenService,){}
  // ngOnInit() {
  //   // Gọi API lấy danh sách roles và lưu vào biến roles
  //   debugger
  //   this.roleService.getRoles().subscribe({      
  //     next: (apiResponse: ApiResponse) => { // Sử dụng kiểu Role[]
  //       debugger
  //       const roles = apiResponse.data
  //       this.roles = roles;
  //       this.selectedRole = roles.length > 0 ? roles[0] : undefined;
  //     },
  //     complete: () => {
  //       debugger
  //     },  
  //     error: (error: any) => {
  //       debugger
  //       console.error('Error getting roles:', error);
  //     }
  //   });
  // }

  // onSubmit() {
    
  //   const loginDTO: LoginDTO = {
  //     username: this.username,
  //     password: this.password,
  //     role_id: this.selectedRole?.id ?? 1
  //   };

  //   this.userService.login(loginDTO).subscribe({
  //     next: (apiResponse: ApiResponse) => {
  //       debugger;
  //       const { token } = apiResponse.data;
  //       if (this.rememberMe) {          
  //         this.tokenService.setToken(token);
  //         debugger;
  //         this.userService.getUserDetail(token).subscribe({
  //           next: (apiResponse2: ApiResponse) => {
  //             debugger
  //             this.userResponse = {
  //               ...apiResponse2.data,
  //               date_of_birth: new Date(apiResponse2.data.date_of_birth),
  //             };    
  //             this.userService.saveUserResponseToLocalStorage(this.userResponse); 
  //             if(this.userResponse?.role.name == 'admin') {
  //               this.router.navigate(['/admin']);    
  //             } else if(this.userResponse?.role.name == 'user') {
  //               this.router.navigate(['/']);                      
  //             }
              
  //           },
  //           complete: () => {
              
  //             debugger;
  //           },
  //           error: (error: any) => {
  //             debugger;
  //             alert(error.error.message);
  //           }
  //         })
  //       }                        
  //     },
  //     complete: () => {
  //       debugger;
  //     },
  //     error: (error: any) => {
  //       debugger;
  //       alert(error.error.message);
  //     }
  //   });
  




}
