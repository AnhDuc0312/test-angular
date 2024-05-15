export interface TimeSheetDTO {
    id?: number;
    in_time: Date; // Sử dụng kiểu string cho inTime và outTime
    out_time: Date;
    status: string;
    working_hours: number;
    overtime_hours: number;
    leave_hours: number;
    user_id: number;
    record_date: Date; // Sử dụng kiểu string cho recordDate
    check_in: Date;
    check_out: Date;
    type_work: string;
    code : string;
  }