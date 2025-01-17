CREATE TABLE `user_tokens` (
	`id` text(30) PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`refreshToken` text(100) NOT NULL,
	`refresh_token_expiry_date` integer,
	`last_refreshing_date` integer,
	`created_at` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`deleted_at` text,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `user_tokens_refreshToken_unique` ON `user_tokens` (`refreshToken`);--> statement-breakpoint
CREATE TABLE `users` (
	`id` text(30) PRIMARY KEY NOT NULL,
	`nickname` text(20) NOT NULL,
	`email` text(50) NOT NULL,
	`is_email_verified` integer NOT NULL,
	`password` text(200),
	`otp` text(6),
	`otp_expiry_date` integer,
	`created_at` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`deleted_at` text
);
--> statement-breakpoint
CREATE UNIQUE INDEX `users_email_unique` ON `users` (`email`);