import { AdminComponent } from "./admin.component";
import { Route, Router,Routes } from "@angular/router";
import { NgModule } from "@angular/core";
import { RouterModule } from "@angular/router";
import { EmployeeAdComponent } from "./employee-ad/employee-ad.component";
import { LeaveAdComponent } from "./leave-ad/leave-ad.component";
import { OvertimeAdComponent } from "./overtime-ad/overtime-ad.component";
import { TimekeepAdComponent } from "./timekeep-ad/timekeep-ad.component";
import { RemoteAdComponent } from "./remote-ad/remote-ad.component";
import { AboutComponent } from "./about/about.component";
import { CommonModule } from "@angular/common";
import { NewsAdComponent } from "./news-ad/news-ad.component";
import { AddNewsComponent } from "./add-news/add-news.component";
import { PayrollAdComponent } from "./payroll-ad/payroll-ad.component";

export const routesAdmin: Routes = [
    {
        path: 'admin',
        component: AdminComponent,
        children: [
            {
                path: 'employees',
                component: EmployeeAdComponent
            },
            {
                path: 'leaves',
                component: LeaveAdComponent
            },
            {
                path: 'overtimes',
                component: OvertimeAdComponent
            },
            {
                path: 'timekeeps',
                component: TimekeepAdComponent
            },
            {
                path: 'remotes',
                component: RemoteAdComponent
            },
            {
                path: 'about',
                component: AboutComponent
            },
            {
                path: 'news',
                component: NewsAdComponent
            },
            {
                path: 'news/add',
                component: AddNewsComponent
            },
            {
                path: 'payrolls',
                component: PayrollAdComponent
            },
        ]
    }
];
@NgModule({
    imports: [
        RouterModule.forChild(routesAdmin)
        
    ],
    exports: [RouterModule]
})
export class AdminRoutingModule { }
