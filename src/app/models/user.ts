import { Department } from "./department";
import { Role } from "./role";
export interface User {
    id: number;
    username: string;
    email: string;
    fullName: string;
    password: string;
    role: Role;
    department : Department;
}
  