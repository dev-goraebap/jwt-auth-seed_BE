import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import * as nodemailer from 'nodemailer';
import {EnvService} from "../env";

@Injectable()
export class MailService {

    private transporter: nodemailer.Transporter;

    constructor(
        private readonly envService: EnvService
    ) {
        const { host, port, username, password } = this.envService.getMailEnv();
        this.transporter = nodemailer.createTransport({
            host, // SMTP 서버 주소
            port, // SMTP 포트 (일반적으로 587 사용)
            secure: false, // TLS를 사용할지 여부 (true는 포트 465에서 사용)
            auth: {
                user: username, // 이메일 계정
                pass: password, // 이메일 비밀번호 또는 앱 비밀번호
            },
        });
    }

    /**
     * @todo 이메일에 OTP 인증번호를 발송합니다.
     */
    async send(email: string, otp: string) {
        try {
            const info = await this.transporter.sendMail({
                from: '"NestJS App" <no-reply@example.com>',
                to: email,
                subject: '제목',
                text: otp,
            });
            console.log('Email sent:', info.messageId);
        } catch (error) {
            console.error('Error sending email:', error);
        }
    }
}