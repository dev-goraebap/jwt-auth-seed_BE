import { text, sqliteTable, int  } from "drizzle-orm/sqlite-core";
import {relations, sql} from "drizzle-orm";

const createdAt = int('created_at', { mode: 'timestamp' });
const updatedAt = int('updated_at', { mode: 'timestamp' });
const deletedAt = int('deleted_at', { mode: 'timestamp' });

export const users = sqliteTable("users", {
    id: text({ length: 30 }).primaryKey(),
    nickname: text({ length: 20 }).notNull(),
    email: text({ length: 50 }).notNull().unique(),
    isEmailVerified: int('is_email_verified', { mode: 'boolean' }).notNull(),
    password: text({ length: 200 }),
    otp: text({ length: 6 }),
    otpExpiryDate: int('otp_expiry_date', { mode: 'timestamp' }),
    createdAt,
    updatedAt,
    deletedAt
});

export const userTokens = sqliteTable("user_tokens", {
    id: text({ length: 30 }).notNull().primaryKey(),
    userId: text('user_id').notNull().unique().references(() => users.id, { onDelete: 'cascade' }),
    refreshToken: text('refresh_token', { length: 100 }).notNull().unique(),
    expiryDate: int('expiry_date', { mode: 'timestamp' }),
    lastRefreshingDate: int('last_refreshing_date', { mode: 'timestamp' }),
    createdAt,
    updatedAt,
    deletedAt
});
