# Bushfaller E-Commerce Platform

Bushfaller is a full-stack e-commerce web application for selling African raw food products such as snails, dry fish, and eru.

Tech stack:
- Next.js (App Router)
- NextAuth.js (Google + Facebook social login)
- MySQL (XAMPP compatible)
- API Routes for backend logic
- PayPal payment verification

## Features Implemented

Customer features:
- Home page with promotional banner and featured products
- Products page with search and category filtering
- Product details page with add-to-cart
- Cart page with quantity updates, remove item, totals, and WhatsApp cart share
- Checkout page with shipping form and PayPal payment flow
- Order confirmation page
- Orders dashboard and order details for logged-in users
- Contact page to message admin

Admin features:
- Protected admin dashboard with dedicated email/password login page (`/admin-login`)
- Admin stats (orders, revenue, pending)
- Product management (add, edit, delete)
- Product image upload to `public/uploads`
- Order management (status updates)
- Message management and replies

Security measures:
- Input validation using `zod`
- Parameterized SQL queries (`mysql2` prepared statements)
- Protected user/admin routes
- Secrets loaded via environment variables

## Project Structure

- `src/app` pages and API routes
- `src/app/api` backend endpoints
- `src/app/admin` admin UI
- `src/lib/db.ts` MySQL pool and query helper
- `src/lib/validation.ts` request validation schemas
- `database/schema.sql` database schema and seed products

## Prerequisites

- Node.js 20+
- XAMPP (MySQL running)

## Setup (XAMPP + MySQL)

1. Start MySQL in XAMPP Control Panel.
2. Create database `bushfaller` in phpMyAdmin.
3. Import `database/schema.sql`.

### Existing Database Migration

If you already have a running database from an earlier version, run this migration:

- `database/migrations/2026-03-28-order-hardening.sql`

This migration adds:
- immutable order item snapshot fields (`product_name_snapshot`, `product_image_snapshot`)
- unique constraint for `orders.payment_id`
- backfill for existing order item snapshots

## Environment Variables

1. Copy `.env.example` to `.env.local`.
2. Fill all required values.

Important keys:
- `NEXTAUTH_URL=http://localhost:3000`
- `NEXTAUTH_SECRET=<strong-random-secret>`
- `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`
- `FACEBOOK_CLIENT_ID`, `FACEBOOK_CLIENT_SECRET`
- `MYSQL_HOST`, `MYSQL_PORT`, `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_DATABASE`
- `PAYPAL_CLIENT_ID`, `PAYPAL_CLIENT_SECRET`, `PAYPAL_BASE_URL`
- `NEXT_PUBLIC_PAYPAL_CLIENT_ID` (same value as `PAYPAL_CLIENT_ID`)
- `ADMIN_EMAILS=admin@bushfaller.com`

## Run Locally

```bash
npm install
npm run dev
```

Open `http://localhost:3000`.

## API Endpoints

Public/user endpoints:
- `GET /api/products`
- `GET /api/products/:id`
- `GET /api/orders` (authenticated user)
- `POST /api/orders` (authenticated user)
- `POST /api/messages`
- `POST /api/payments/paypal`

Admin endpoints:
- `GET /api/admin/stats`
- `GET /api/admin/products`
- `POST /api/admin/products`
- `PUT /api/admin/products/:id`
- `DELETE /api/admin/products/:id`
- `GET /api/admin/orders`
- `PATCH /api/admin/orders/:id/status`
- `GET /api/admin/messages`
- `PATCH /api/admin/messages/:id/reply`
- `POST /api/admin/upload`

## Authentication Notes

- Social login is handled by NextAuth providers:
	- Google
	- Facebook
- On sign-in, user profile data is upserted into `users` table.
- Session user ID is attached in JWT/session callbacks.

## Admin Login (Form)

- Admin access uses credentials on `/admin-login`.
- Configure `ADMIN_LOGIN_EMAIL` and `ADMIN_LOGIN_PASSWORD_HASH` in `.env.local`.
- `ADMIN_LOGIN_PASSWORD_HASH` is SHA-256 hash of your plain password.

## Optional Extensions

The current architecture supports adding:
- Product reviews and ratings
- Coupons/discounts
- More payment methods
- Better multi-currency conversion service
