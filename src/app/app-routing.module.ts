import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { RemoteComponent } from './components/remote/remote.component';
import { RemoteListComponent } from './components/remote-list/remote-list.component';
import { NgModel } from '@angular/forms';
import { NgModule } from '@angular/core';
import { OvertimeComponent } from './components/overtime/overtime.component';
import { CalendarComponent } from './components/calendar/calendar.component';
import { LeaveListComponent } from './components/leave-list/leave-list.component';
import { LeaveComponent } from './components/leave/leave.component';
import { TimekeepComponent } from './components/timekeep/timekeep.component';
import { UserProfileComponent } from './components/user-profile/user-profile.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { AdminComponent } from './components/admin/admin.component';
import { NewsComponent } from './components/news/news.component';
import { TrainComponent } from './components/train/train.component';
import { OvertimeListComponent } from './components/overtime-list/overtime-list.component';

export const routes: Routes = [
    { path: '', component:HomeComponent},
    { path: 'login', component: LoginComponent},
    { path: 'remote_form' , component: RemoteComponent},
    { path: 'remote_my', component: RemoteListComponent},
    { path: 'overtime_form', component: OvertimeComponent},
    { path: 'overtime_my', component: OvertimeListComponent},
    { path: 'leave_form', component: LeaveComponent},
    { path: 'leave_my', component: LeaveListComponent},
    { path: 'timekeep_my', component: TimekeepComponent},
    { path: 'calendar' , component: CalendarComponent},
    { path: 'user-profile', component:UserProfileComponent},
    { path: 'dashboard', component:DashboardComponent},
    { path: 'admin', component : AdminComponent},
    { path: 'news', component : NewsComponent},
    { path: 'train', component : TrainComponent},
    { path: 'profile', component : UserProfileComponent}

   
];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})

export class AppRoutingModule{}