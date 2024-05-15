// import { Injectable } from '@angular/core';
// import { Timekeeping } from '../models/timekeep';

// @Injectable({
//   providedIn: 'root'
// })
// export class TimekeepingService {

//   constructor() { }

//   generateTimekeepingRecords(): Timekeeping[] {
//     // Tạo dữ liệu mẫu cho bản ghi chấm công
//     const records: Timekeeping[] = [];
//     for (let i = 1; i <= 100; i++) {
//       const record = new Timekeeping(
//         i,
//         this.getRandomDate(),
//         `EMP${i}`,
//         this.getRandomTime(),
//         this.getRandomTime(),
//         Math.random() * 8, // Giả sử làm 8 giờ mỗi ngày
//         Math.random() > 0.5 ? 'Approved' : 'Pending' // Random trạng thái
//       );
//       records.push(record);
//     }
//     return records;
//   }

//   // Phương thức để tạo ngẫu nhiên một ngày trong tháng hiện tại
//   private getRandomDate(): string {
//     const date = new Date();
//     const year = date.getFullYear();
//     const month = date.getMonth() + 1;
//     const day = Math.floor(Math.random() * 30) + 1; // Giả sử tháng này có tối đa 30 ngày
//     return `${year}-${month < 10 ? '0' + month : month}-${day < 10 ? '0' + day : day}`;
//   }

//   // Phương thức để tạo ngẫu nhiên một thời gian trong ngày
//   private getRandomTime(): string {
//     const hours = Math.floor(Math.random() * 24);
//     const minutes = Math.floor(Math.random() * 60);
//     return `${hours < 10 ? '0' + hours : hours}:${minutes < 10 ? '0' + minutes : minutes}`;
//   }
// }

import { HttpClient } from "@angular/common/http";
import { Injectable, inject } from "@angular/core";
import { HttpUtilService } from './http.util.service';
import { Observable } from "rxjs";
import { TimeSheet } from "../models/timekeep";
import { environment } from "../../environments/enviroment";
import { ApiResponse } from "../responses/api.response";
import { TimeSheetDTO } from "../dtos/form/timesheet.dto";


@Injectable({
    providedIn: 'root'
})

export class TimeSheetService {
    // Kết nối APIs


    //Inject 
    private http = inject(HttpClient);
    private httpUtilService = inject(HttpUtilService); // đa ngôn nghữ i18n

    //Cấu hình các request
    private apiConfig = {
        headers: this.httpUtilService.createHeaders(),
    }

    // Các phương thức
    private api = `${environment.apiBaseUrl}/timesheets`;
    checkin (timesheetData : TimeSheetDTO): Observable<any>{
    // Các phương thứccreateEmployee (emloyeeData : Employee, avatar : File): Observable<any>{
        // const formData : FormData = new FormData();
        // formData.append('timesheetDTO', JSON.stringify(timesheetData));
        // formData.append('avatar', avatar);

        return this.http.post<any>(`${this.api}/check-in`,timesheetData);

    }

    checkout (timesheetData : TimeSheetDTO): Observable<any>{
        // Các phương thứccreateEmployee (emloyeeData : Employee, avatar : File): Observable<any>{
            // const formData : FormData = new FormData();
            // formData.append('timesheetDTO', JSON.stringify(timesheetData));
            // formData.append('avatar', avatar);
    
            return this.http.post<any>(`${this.api}/check-out`,timesheetData);
    
        }

    getAll() : Observable<TimeSheet[]>{
        
        return this.http.get<TimeSheet[]>(`${this.api}/all`);
    }
    getById (id : number) : Observable<any> {
        return this.http.get<ApiResponse>(`${this.api}/user/${id}`);
    }

    delete (id : number ) :Observable<any> {
        return this.http.delete<string>(`${this.api}/${id}`);
    }

    update (id : number) :Observable<any> {
        const params = {

        }
        return this.http.put<ApiResponse>(`${this.api}/${id}`, params);
    }
    
}