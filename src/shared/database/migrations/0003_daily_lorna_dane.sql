DROP INDEX "user_tokens_refresh_token_unique";--> statement-breakpoint
DROP INDEX "users_email_unique";--> statement-breakpoint
ALTER TABLE `user_tokens` ALTER COLUMN "created_at" TO "created_at" integer;--> statement-breakpoint
CREATE UNIQUE INDEX `user_tokens_refresh_token_unique` ON `user_tokens` (`refresh_token`);--> statement-breakpoint
CREATE UNIQUE INDEX `users_email_unique` ON `users` (`email`);--> statement-breakpoint
ALTER TABLE `user_tokens` ALTER COLUMN "updated_at" TO "updated_at" integer;--> statement-breakpoint
ALTER TABLE `user_tokens` ALTER COLUMN "deleted_at" TO "deleted_at" integer;--> statement-breakpoint
ALTER TABLE `users` ALTER COLUMN "otp_expiry_date" TO "otp_expiry_date" integer;--> statement-breakpoint
ALTER TABLE `users` ALTER COLUMN "created_at" TO "created_at" integer;--> statement-breakpoint
ALTER TABLE `users` ALTER COLUMN "updated_at" TO "updated_at" integer;--> statement-breakpoint
ALTER TABLE `users` ALTER COLUMN "deleted_at" TO "deleted_at" integer;