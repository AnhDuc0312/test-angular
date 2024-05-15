import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { EmployeeAdComponent } from './employee-ad/employee-ad.component';
import { LeaveAdComponent } from './leave-ad/leave-ad.component';
import { RemoteAdComponent } from './remote-ad/remote-ad.component';
import { OvertimeAdComponent } from './overtime-ad/overtime-ad.component';
import { TimekeepAdComponent } from './timekeep-ad/timekeep-ad.component';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from '../../app-routing.module';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatFormFieldModule } from '@angular/material/form-field';
import { RouterModule } from '@angular/router';
import { AboutComponent } from './about/about.component';
import { AddNewsComponent } from './add-news/add-news.component';
import { AddEmployeeComponent } from './add-employee/add-employee.component';
import { PayrollAdComponent } from './payroll-ad/payroll-ad.component';

@NgModule({
  declarations: [
    AboutComponent,
    AddEmployeeComponent
  
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    // BrowserModule,
    FormsModule,
    AppRoutingModule,
    // HttpClientModule,
    // BrowserAnimationsModule,
    // MatFormFieldModule,
    RouterModule,
    // PayrollAdComponent
  ],
})
export class AdminModule {}
