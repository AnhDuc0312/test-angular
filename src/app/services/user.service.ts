import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable, inject } from '@angular/core';
import { HttpUtilService } from './http.util.service';
import { environment } from '../../environments/enviroment';
import { LoginDTO } from '../dtos/user/login.user';
import { Observable } from 'rxjs';
import { ApiResponse } from '../responses/api.response';
import { UserResponse } from '../responses/user/user.response';
import { UpdateUserDTO } from '../dtos/user/update.user.dto';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  // Kết nối APIs
  private apiRegister = `${environment.apiBaseUrl}/users/register`;
  private apiLogin = `${environment.apiBaseUrl}/users/login`;
  private apiUserDetail = `${environment.apiBaseUrl}/users/details`;

  //Inject
  private http = inject(HttpClient);
  private httpUtilService = inject(HttpUtilService); // đa ngôn nghữ i18n

  // localStorage?:Storage;
  localStorage = window.localStorage;

  //Cấu hình các request
  private apiConfig = {
    headers: this.httpUtilService.createHeaders(),
  };

  // Các phương thức
//   register(registerDTO: RegisterDTO): Observable<ApiResponse> {
//     return this.http.post<ApiResponse>(
//       this.apiRegister,
//       registerDTO,
//       this.apiConfig
//     );
//   }

  login(loginDTO: LoginDTO): Observable<ApiResponse> {
    return this.http.post<ApiResponse>(this.apiLogin, loginDTO, this.apiConfig);
  }
//   getUserDetail(token: string): Observable<ApiResponse> {
//     return this.http.post<ApiResponse>(this.apiUserDetail, {
//       headers: new HttpHeaders({
//         'Content-Type': 'application/json',
//         Authorization: `Bearer ${token}`,
//       }),
//     });
//   }
  getUsers(params: { page: number, limit: number, keyword: string }): Observable<ApiResponse> {
    const url = `${environment.apiBaseUrl}/users`;
    return this.http.get<ApiResponse>(url, { params: params });
  }

  resetPassword(username: string): Observable<ApiResponse> {
    const url = `${environment.apiBaseUrl}/users/${username}/reset-password`;
    return this.http.post<ApiResponse>(url, null, this.apiConfig);
  }

  getUserResponseFromLocalStorage():UserResponse | null {
    try {
      // Retrieve the JSON string from local storage using the key
      const userResponseJSON = this.localStorage?.getItem('user'); 
      if(userResponseJSON == null || userResponseJSON == undefined) {
        return null;
      }
      // Parse the JSON string back to an object
      const userResponse = JSON.parse(userResponseJSON!);  
      console.log('User response retrieved from local storage.');
      return userResponse;
    } catch (error) {
      console.error('Error retrieving user response from local storage:', error);
      return null; // Return null or handle the error as needed
    }
  }
  removeUserFromLocalStorage():void {
    try {
      // Remove the user data from local storage using the key
      // this.localStorage?.removeItem('username');
      // console.log('User data removed from local storage.');
      this.localStorage?.clear();
      console.log('All data removed from local storage.');
    } catch (error) {
      console.error('Error removing user data from local storage:', error);
      // Handle the error as needed
    }
  }
  updateUserDetail(token: string, updateUserDTO: UpdateUserDTO): Observable<ApiResponse>  {
    debugger
    let userResponse = this.getUserResponseFromLocalStorage();        
    return this.http.put<ApiResponse>(`${this.apiUserDetail}/${userResponse?.id}`,updateUserDTO,{
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        Authorization: `Bearer ${token}`
      })
    })
  }

  // getUserDetail(token: string): Observable<ApiResponse> {
    
    // return this.http.post<ApiResponse>(this.apiUserDetail, {
    //   headers: new HttpHeaders({
    //     'Content-Type': 'application/json',
    //     Authorization: `Bearer ${token}`
    //   })
    // })
  // }
  getUserDetail(token: string): Observable<ApiResponse> {
    // Tạo header chứa token
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    // Gửi yêu cầu API với header chứa token
    return this.http.post<ApiResponse>(this.apiUserDetail, {}, { headers });
  }
  saveUserResponseToLocalStorage(userResponse?: UserResponse) {
    try {
      debugger
      if(userResponse == null || !userResponse) {
        return;
      }
      // Convert the userResponse object to a JSON string
      const userResponseJSON = JSON.stringify(userResponse);  
      // Save the JSON string to local storage with a key (e.g., "userResponse")
      this.localStorage?.setItem('user', userResponseJSON);  
      // this.localStorage?.setItem('id', userResponse.id.toString());
      console.log('User response saved to local storage.');
    } catch (error) {
      console.error('Error saving user response to local storage:', error);
    }
  }

  changePassword(id: number , oldPass : string , newPass :string): Observable<ApiResponse> {
    const url = `${environment.apiBaseUrl}/users/${id}/change-password?oldPassword=${oldPass}&newPassword=${newPass}`;
    return this.http.put<ApiResponse>(url, null, this.apiConfig);
  }

}
