import { Controller, Post, Req, Body } from "@nestjs/common";
import { Request } from "express";
import { AuthService } from "./auth.service";
import { AuthDto } from "./dto/auth.dto";

@Controller("auth")
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post("signup")
  signup(@Body('input') dto: AuthDto) {
    console.log({dto})
    return this.authService.signUp();
  }

  @Post("login")
  login(@Req() req: Request) {
    console.log(req)
    return this.authService.login();
  }
}
