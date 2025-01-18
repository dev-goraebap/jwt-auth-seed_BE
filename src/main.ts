import {DocumentBuilder, SwaggerModule} from "@nestjs/swagger";
import { NestFactory } from '@nestjs/core';
import { Logger } from '@nestjs/common';

import {MainModule} from "./main.module";
import {EnvService} from "./shared/env";

async function bootstrap() {
  const app = await NestFactory.create(MainModule);

  app.setGlobalPrefix('api');
  app.enableVersioning();

  const envService = app.get(EnvService);

  const config = new DocumentBuilder()
      .setTitle('JWT AUTH SEED API')
      .setDescription('JWT Authentication Seed API')
      .addBearerAuth()
      .setVersion('1.0')
      .build();
  const documentFactory = () => SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, documentFactory);

  const { name, port } = envService.getAppEnv();
  await app.listen(port ?? 8000, () => Logger.log(`[${name}] Server started on port ${port}`));
}
bootstrap();
