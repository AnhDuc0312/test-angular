// import { Component } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { formatDate, startOfMonth, endOfMonth, addDays, isWeekend ,addMonths} from 'date-fns';

interface CalendarDay {
  date: number;
  workingDay: boolean;
  isWeekend: boolean;
}

@Component({
  selector: 'app-calendar',
  // standalone: true,
  // imports: [],
  templateUrl: './calendar.component.html',
  styleUrl: './calendar.component.scss'
})
export class CalendarComponent implements OnInit{
  currentMonth: string;
  currentYear: number;
  calendarDays: any[][] = [];

  ngOnInit(): void {
    const currentDate = new Date();
    this.currentMonth = formatDate(currentDate, 'MMMM');
    this.currentYear = currentDate.getFullYear();
    this.generateCalendar(currentDate);
  }

  constructor() {
    const currentDate = new Date();
    this.currentMonth = formatDate(currentDate, 'MMMM');
    this.currentYear = currentDate.getFullYear();
  }

  generateCalendar(date: Date): void {
    const firstDayOfMonth = startOfMonth(date);
    const lastDayOfMonth = endOfMonth(date);
    const numberOfDays = lastDayOfMonth.getDate();
    const firstDayOfWeek = firstDayOfMonth.getDay();

    let currentDay = firstDayOfMonth;
    let week: any[] = [];

    for (let i = 0; i < firstDayOfWeek; i++) {
      week.push({ date: '', isWeekend: false });
    }

    for (let i = 1; i <= numberOfDays; i++) {
      week.push({ date: i, isWeekend: isWeekend(currentDay) });
      if (week.length === 7) {
        this.calendarDays.push(week);
        week = [];
      }
      currentDay = addDays(currentDay, 1);
    }

    if (week.length > 0) {
      while (week.length < 7) {
        week.push({ date: '', isWeekend: false });
      }
      this.calendarDays.push(week);
    }
  }

  previousMonth(): void {
    const previousMonthDate = addMonths(new Date(this.currentYear, this.getMonthNumber(this.currentMonth)), -1);
    this.currentMonth = formatDate(previousMonthDate, 'MMMM');
    this.currentYear = previousMonthDate.getFullYear();
    this.calendarDays = [];
    this.generateCalendar(previousMonthDate);
  }

  nextMonth(): void {
    const nextMonthDate = addMonths(new Date(this.currentYear, this.getMonthNumber(this.currentMonth)), 1);
    this.currentMonth = formatDate(nextMonthDate, 'MMMM');
    this.currentYear = nextMonthDate.getFullYear();
    this.calendarDays = [];
    this.generateCalendar(nextMonthDate);
  }

  getMonthNumber(monthName: string): number {
    return new Date(Date.parse(monthName + ' 1, 2000')).getMonth();
  }
}
