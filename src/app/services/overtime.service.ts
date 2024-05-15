// import { HttpClient } from "@angular/common/http";
import { Injectable, inject } from "@angular/core";
import { HttpUtilService } from './http.util.service';
import { HttpClient } from "@angular/common/http";
import { environment } from "../../environments/enviroment";
import { Overtime } from "../models/overtime";
import { Observable } from "rxjs";
import { ApiResponse } from "../responses/api.response";
import { OvertimeDTO } from "../dtos/form/overtime.dto";



@Injectable({
    providedIn: 'root'
})

export class OvertimeService {
    // Kết nối APIs


    //Inject 
    private http = inject(HttpClient);
    private httpUtilService = inject(HttpUtilService); // đa ngôn nghữ i18n

    //Cấu hình các request
    private apiConfig = {
        headers: this.httpUtilService.createHeaders(),
    }

    // Các phương thức
    private api = `${environment.apiBaseUrl}/overtimes`;
    create (formData : OvertimeDTO,): Observable<any>{
    // Các phương thứccreateEmployee (emloyeeData : Employee, avatar : File): Observable<any>{
        

        return this.http.post<any>(`${this.api}/create` , formData);

    }

    getAll() : Observable<Overtime[]>{
        
        return this.http.get<Overtime[]>(`${this.api}/all`);
    }
    getById (id : number) : Observable<any> {
        return this.http.get<ApiResponse>(`${this.api}/${id}`);
    }
    getByUserId (id : number) : Observable<any> {
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

    count () : Observable<any> {
        return this.http.get<ApiResponse>(`${this.api}/statistics`)
    }
    
    
}