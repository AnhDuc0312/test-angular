export interface LeaveDTO {
  from_datetime : string;
  to_datetime : string;
  total_hours: number;
  type ?: String;
  reason : string;
  evident ?: string;
  approver_id: number;
  approver?: string;
  comment: string;
  status : string;
}