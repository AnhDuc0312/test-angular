import { Component, OnInit } from '@angular/core';
import { Payroll } from '../../../models/payroll';
import { PayrollService } from '../../../services/payroll.service';
import { NgModel } from '@angular/forms';

@Component({
  selector: 'app-payroll-ad',
  // standalone: true,
  // imports: [

  // ],
  templateUrl: './payroll-ad.component.html',
  styleUrl: './payroll-ad.component.scss'
})
export class PayrollAdComponent implements OnInit {
  payrollList: Payroll[] = [];

  constructor(private payrollService: PayrollService) { }

  ngOnInit(): void {
    this.getPayrollList();
  }

  getPayrollList(): void {
    // this.payrollService.getAlls()
    //   .subscribe(payrollList => this.payrollList = payrollList);
  }
  searchParams = {
    time: ''
};
currentPage = 1;
pageSize = 10;
totalPages = 0;
salaries: any[] = [];
pages = [1,2,3,4,5,6,7]


// search() {
//     this.$http.get('/salaries', { params: this.searchParams })
//         .then((response: any) => {
//             this.salaries = response.data;
//         });
// }

prevPage() {
    if (this.currentPage > 1) {
        this.currentPage--;
        // this.search();
    }
}

nextPage() {
    if (this.currentPage < this.totalPages) {
        this.currentPage++;
        // this.search();
    }
}

setPage(page: number) {
    this.currentPage = page;
    // this.search();
}

// init() {
//     this.search();
// }

}
