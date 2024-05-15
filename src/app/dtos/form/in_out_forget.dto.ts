export class InOutForgetDTO {
    from_date_time : Date;
    end_date_time : Date;
    date: string;
    type ?: String;
    reason : string;
    evident ?: string;
    approver_id: string;
    approver?: string;
    comment: string;

    constructor(from_date_time: Date, end_date_time: Date, date: string, reason: string, approver_id: string, comment: string, type?: string, evident?: string, approver?: string) {
       this.from_date_time = from_date_time;
       this.end_date_time = end_date_time;
       this.date = date;
       this.reason = reason;
       this.approver_id = approver_id;
       this.comment = comment;
       
       // Kiểm tra và gán giá trị cho các thuộc tính tùy chọn
       if (type) {
         this.type = type;
       }
       if (evident) {
         this.evident = evident;
       }
       if (approver) {
         this.approver = approver;
       }
     }
   
}