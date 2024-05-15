import { HttpClient } from "@angular/common/http";
import { Injectable, inject } from "@angular/core";
import { HttpUtilService } from './http.util.service';
import { Employee } from "../models/employee";
import { environment } from "../../environments/enviroment";
import { EmployeeDTO } from "../dtos/employee/employee.dto";
import { Observable } from "rxjs";
import { EmployeeResponse } from "../responses/employee/employee.response";
import { ApiResponse } from "../responses/api.response";
import { UpdateEmployeeDTO } from "../responses/employee/updateE.dto";


@Injectable({
    providedIn: 'root'
})

export class EmployeeService {
    // Kết nối APIs
    private api = `${environment.apiBaseUrl}/employees`;
    // private apiGetAll = `${environment.apiBaseUrl}/employeee/${id}`;
    // private apiGetById = `${environment.apiBaseUrl}/employeee/${id}`;

    //Inject 
    private http = inject(HttpClient);
    private httpUtilService = inject(HttpUtilService); // đa ngôn nghữ i18n

    //Cấu hình các request
    private apiConfig = {
        headers: this.httpUtilService.createHeaders(),
    }

    createEmployee (emloyeeData : Employee, avatar : File): Observable<any>{
        const formData : FormData = new FormData();
        formData.append('employeeDTO', JSON.stringify(emloyeeData));
        formData.append('avatar', avatar);

        return this.http.post<any>(this.api,formData);

    }

    getAllEmployees(page : number, size: number, departmentId: number,keyword : string) : Observable<Employee[]>{
        const params = {
            keyword : keyword,
            department_id : departmentId.toString(),
            page: page.toString() ,
            size : size.toString() 

        }
        return this.http.get<Employee[]>(this.api,{params});
    }
    getById (id : number) : Observable<any> {
        return this.http.get<ApiResponse>(`${this.api}/${id}`);
    }

    getByUsername (username : string) : Observable<any> {
        return this.http.get<any>(`${this.api}/user/${username}`);
    }

    delete (username : string ) :Observable<any> {
        return this.http.delete<string>(`${this.api}/${username}`);
    }

    update (username : string , formData : UpdateEmployeeDTO) :Observable<any> {
        
        return this.http.put<ApiResponse>(`${this.api}/${username}`, formData);
    }

    
}
