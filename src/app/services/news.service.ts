// import { HttpClient } from "@angular/common/http";
import { Injectable, inject } from "@angular/core";
import { HttpUtilService } from './http.util.service';
import { HttpClient } from "@angular/common/http";
import { environment } from "../../environments/enviroment";
import { Observable } from "rxjs";
import { News } from "../models/news";
import { ApiResponse } from "../responses/api.response";
import { NewsDTO } from "../dtos/form/news.dto";


@Injectable({
    providedIn: 'root'
})

export class NewsService {
    // Kết nối APIs


    //Inject 
    private http = inject(HttpClient);
    private httpUtilService = inject(HttpUtilService); // đa ngôn nghữ i18n

    //Cấu hình các request
    private apiConfig = {
        headers: this.httpUtilService.createHeaders(),
    }

    // Các phương thức
    private api = `${environment.apiBaseUrl}/news`;
    create (newsData : News): Observable<any>{

        return this.http.post<any>(`${this.api}/create`,newsData);

    }

    getAll() : Observable<News[]>{
       
        return this.http.get<News[]>(this.api);
    }
    getById (id : number) : Observable<any> {
        return this.http.get<ApiResponse>(`${this.api}/${id}`);
    }

    delete (id : number ) :Observable<any> {
        return this.http.delete<string>(`${this.api}/${id}`);
    }

    update (id : number ,newsDTO : NewsDTO) :Observable<any> {
        return this.http.put<ApiResponse>(`${this.api}/${id}`, newsDTO);
    }
}