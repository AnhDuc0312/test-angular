import {
    IsString, 
    IsNotEmpty, 
} from 'class-validator';

export class LoginDTO {
    @IsNotEmpty()
    username: string;

    @IsString()
    @IsNotEmpty()
    password: string;

    role_id: number;

    constructor(data: any) {
        this.username = data.phone_number;
        this.password = data.password;
        this.role_id = data.role_id
    }
}