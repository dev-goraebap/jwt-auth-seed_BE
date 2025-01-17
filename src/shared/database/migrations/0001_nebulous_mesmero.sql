DROP INDEX `user_tokens_refreshToken_unique`;--> statement-breakpoint
ALTER TABLE `user_tokens` ADD `refresh_token` text(100) NOT NULL;--> statement-breakpoint
ALTER TABLE `user_tokens` ADD `expiry_date` integer;--> statement-breakpoint
CREATE UNIQUE INDEX `user_tokens_refresh_token_unique` ON `user_tokens` (`refresh_token`);--> statement-breakpoint
ALTER TABLE `user_tokens` DROP COLUMN `refreshToken`;--> statement-breakpoint
ALTER TABLE `user_tokens` DROP COLUMN `refresh_token_expiry_date`;