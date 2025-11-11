# Midtrans Payment Gateway

A simple Spring Boot application integrated with Midtrans Snap API for handling payments (donations). The application allows users to enter their email and payment amount, then redirects them automatically to Midtrans payment page.

---

## Features
- Input email & payment amount
- Redirect to Midtrans Snap payment page
- Credit card secure transaction
- Auto-generated order ID
- Send success email on successful payment
- JSP views styled with TailwindCSS

---

## Setup

### 1. Clone
```bash
git clone https://github.com/mragilsa/midtrans-payment-gateway.git
```
```
cd midtrans-payment-gateway
```
Open the project in your preferred IDE to inspect and run the code.

### 2. Configure application.properties
This project includes an `application.properties.example` template. Copy it to application.properties and update the values with your own keys.
You must create a Midtrans account first to obtain your Server Key and Client Key.
```
midtrans.server.key=YOUR_SERVER_KEY
```
```
midtrans.client.key=YOUR_CLIENT_KEY
```

### 3. Build & Run
```
mvn clean install
```
```
mvn spring-boot:run
```

Access the app at: http://localhost:8080/

---

## How to Use

1. Open the payment page.
2. Enter your email and payment amount.
3. Click Pay.
4. You will be redirected to Midtrans Snap payment page to complete the transaction.
5. You will receive a success email after the payment is completed.

---

## Note
- Sandbox keys are used for testing only.
- Order IDs are generated automatically using UUID.
- Only credit card secure payment method is configured.

