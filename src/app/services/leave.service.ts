import { HttpClient } from "@angular/common/http";
import { Injectable, inject } from "@angular/core";
import { HttpUtilService } from './http.util.service';
import { environment } from "../../environments/enviroment";
import { Leave } from "../models/leave";
import { Observable } from "rxjs";
import { ApiResponse } from "../responses/api.response";
import { LeaveDTO } from "../dtos/form/leave.dto";


@Injectable({
    providedIn: 'root'
})

export class LeaveService {
    // Kết nối APIs



    //Inject 
    private http = inject(HttpClient);
    private httpUtilService = inject(HttpUtilService); // đa ngôn nghữ i18n

    //Cấu hình các request
    private apiConfig = {
        headers: this.httpUtilService.createHeaders(),
    }

    private api = `${environment.apiBaseUrl}/leaves`;
    create (formData : LeaveDTO): Observable<any>{
        return this.http.post<any>(`${this.api}/create`,formData);

    }

    getAll() : Observable<Leave[]>{
        
        return this.http.get<Leave[]>(`${this.api}/all`);
    }
    getById (id : number) : Observable<any> {
        return this.http.get<ApiResponse>(`${this.api}/${id}`);
    }

    getByUserId() : Observable<any> {
        return this.http.get<ApiResponse>(`${this.api}/my`);
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