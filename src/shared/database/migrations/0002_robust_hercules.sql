DROP INDEX "user_tokens_refresh_token_unique";--> statement-breakpoint
DROP INDEX "users_email_unique";--> statement-breakpoint
ALTER TABLE `users` ALTER COLUMN "otp_expiry_date" TO "otp_expiry_date" text;--> statement-breakpoint
CREATE UNIQUE INDEX `user_tokens_refresh_token_unique` ON `user_tokens` (`refresh_token`);--> statement-breakpoint
CREATE UNIQUE INDEX `users_email_unique` ON `users` (`email`);