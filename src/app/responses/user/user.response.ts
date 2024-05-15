import { Department } from "../../models/department";
import { Role } from "../../models/role";
export interface UserResponse {
    id: number;
    username: string;
    email: string;
    fullName: string;
    password: string;
    role: Role;
    department : Department;  
}

