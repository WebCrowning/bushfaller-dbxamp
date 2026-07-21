# PayPal Sandbox Integration - Setup Guide

This application uses **PayPal Sandbox** for secure payment processing. All payments are verified on the backend before saving orders to the database.

## 🔐 Security Architecture

✅ **Backend-Only Payment Verification** - Customers cannot fake payments
✅ **Secure API Tokens** - PayPal credentials never exposed to frontend
✅ **Amount Validation** - Backend recalculates total before capturing
✅ **Transaction Tracking** - All PayPal transaction IDs stored in database

## 📋 Environment Variables

Add these to your `.env.local`:

```bash
# PayPal Sandbox - From PayPal Developer Console
PAYPAL_CLIENT_ID=your_sandbox_client_id
PAYPAL_CLIENT_SECRET=your_sandbox_client_secret
NEXT_PUBLIC_PAYPAL_CLIENT_ID=your_sandbox_client_id

# PayPal API Base URL (sandbox)
PAYPAL_BASE_URL=https://api-m.sandbox.paypal.com
```

Important:
- `NEXT_PUBLIC_PAYPAL_CLIENT_ID` is safe for frontend.
- `PAYPAL_CLIENT_SECRET` must stay backend-only and must never be prefixed with `NEXT_PUBLIC_`.

## 📦 Your Sandbox Credentials

Use credentials copied from PayPal Developer Dashboard for one app pair:

**Required pair**
- Client ID: Full value from the same app
- Secret: Full value from the same app

Do not mix a Client ID from one app with a Secret from another app.

## 🧪 Testing Payments

### Test Buyer Account (Sandbox)
Access PayPal Sandbox at: https://www.sandbox.paypal.com

1. Go to checkout page
2. Fill in shipping details
3. Click PayPal button
4. You'll be redirected to PayPal sandbox
5. Log in with your sandbox **personal (buyer)** account
6. Approve the payment
7. Order will be created with `status = "Paid"`

### Test Credentials in Sandbox Dashboard
- Buyer Email: Created in your PayPal Developer Console
- Buyer Password: Created in your PayPal Developer Console

## 💳 Payment Flow

```
[Customer] 
   ↓
[Checkout Page - Client]
   ↓
[POST /api/payments/paypal/create-order] ← Server creates ORDER on PayPal
   ↓
[Customer approves on PayPal]
   ↓
[POST /api/payments/paypal/capture-order] ← Server CAPTURES payment & verifies
   ↓
[Order saved to MySQL]
   ↓
[Redirect to /checkout/success]
```

## 🛡️ Backend Verification (CRITICAL)

**Endpoint:** `POST /api/payments/paypal/capture-order`

The backend:
1. ✅ Gets PayPal orderID from frontend
2. ✅ Retrieves product prices from database
3. ✅ Recalculates expected total
4. ✅ **Verifies frontend total matches** (detects tampering)
5. ✅ Captures payment via PayPal API
6. ✅ Verifies PayPal status = COMPLETED
7. ✅ Verifies paid amount = expected total
8. ✅ Saves order to database
9. ✅ Returns order ID to frontend

## 📊 Database Schema

Orders now include PayPal fields:

```sql
-- orders table
- paypal_order_id (PayPal order ID)
- paypal_transaction_id (Capture transaction ID)
- status (Pending, Paid, Shipped, Delivered)

-- order_items table
- product_id
- quantity  
- price (snapshot at time of order)
```

## 🚀 Going Live (When Ready)

Update `.env.local` with your live credentials:

```bash
# Live PayPal settings
PAYPAL_ENV=live
PAYPAL_BASE_URL=https://api-m.paypal.com
PAYPAL_CLIENT_ID=your_live_client_id
PAYPAL_CLIENT_SECRET=your_live_client_secret
NEXT_PUBLIC_PAYPAL_CLIENT_ID=your_live_client_id
PAYPAL_MERCHANT_EMAIL=your_live_merchant_email
PAYPAL_WEBHOOK_ID=your_live_webhook_id
```

Important:
- Use the live credentials from your PayPal business account, not sandbox credentials.
- `PAYPAL_CLIENT_ID` and `NEXT_PUBLIC_PAYPAL_CLIENT_ID` must come from the same PayPal app.
- The live webhook must also be created in PayPal live mode.

**Everything else stays the same!** The code detects sandbox vs live automatically.

## ✅ Testing Checklist

- [ ] Add PayPal credentials to `.env.local`
- [ ] Restart dev server (`npm run dev`)
- [ ] Add products to cart at `/products`
- [ ] Go to checkout (`/checkout`)
- [ ] Fill shipping details
- [ ] Click PayPal button
- [ ] Approve payment in sandbox
- [ ] Verify order created in database
- [ ] Check `/orders` to see order details
- [ ] Admin can update order status at `/admin/orders`

## 🐛 Troubleshooting

**"Missing NEXT_PUBLIC_PAYPAL_CLIENT_ID"**
- Add `NEXT_PUBLIC_PAYPAL_CLIENT_ID` to `.env.local`
- Restart dev server

**"Failed to create PayPal order"**
- Verify `PAYPAL_CLIENT_ID` and `PAYPAL_CLIENT_SECRET` are correct
- Check PayPal Developer dashboard for app credentials

**"Payment not verified"**
- Order was created but backend couldn't verify with PayPal
- Check server logs for PayPal API errors
- Verify network connectivity to PayPal API

**"Paid amount does not match"**
- Someone tried to tamper with the total on frontend
- The backend rejected it (this is working correctly!)

## 📝 File Structure

```
src/
├── app/
│   ├── checkout/
│   │   └── page.tsx (Updated checkout form)
│   └── api/
│       └── payments/
│           └── paypal/
│               ├── create-order/
│               │   └── route.ts (NEW)
│               ├── capture-order/
│               │   └── route.ts (NEW)
│               └── route.ts (OLD - for reference)
├── components/
│   └── paypal-button.tsx (NEW - reusable component)
└── lib/
    └── env.ts (PayPal env vars)
```

## 🔒 Security Best Practices

✅ **Never expose `PAYPAL_CLIENT_SECRET` to frontend**
✅ **Always verify amounts on backend**
✅ **Always verify status with PayPal API**
✅ **Store transaction IDs for reconciliation**
✅ **Log failed payments for investigation**
✅ **Use HTTPS in production**

---

**Ready to test?** Add your PayPal credentials to `.env.local` and start the dev server!
