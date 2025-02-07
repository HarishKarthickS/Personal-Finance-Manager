# Personal-Finance-Manager# 💼 Personal Finance Manager

## Overview
The **Personal Finance Manager** is a cross-platform mobile application built with **Flutter** that allows users to track their expenses, manage budgets, and analyze spending trends. The backend API, developed using **Node.js** and **Express**, processes expense transactions and serves data to the mobile application.

---

## Features

### Mobile App (Flutter)
- **Expense Tracking:** Users can log transactions with details like amount, category, and description.
- **Transaction History:** View all recorded transactions in an organized list.
- **Analytics Dashboard:** Visualize spending trends (future implementation).
- **Intuitive UI:** User-friendly design optimized for seamless expense management.

### Backend API (Node.js + Express)
- **RESTful API Endpoints:** Supports transaction logging and retrieval.
- **In-Memory Data Storage:** Temporary storage for demonstration purposes.
- **CORS Enabled:** Allows smooth communication between the mobile app and backend.

---

## Tech Stack

### Frontend
- **Flutter (Dart):** UI development for cross-platform mobile applications.
- **HTTP Package:** Handles API requests to communicate with the backend.

### Backend
- **Node.js:** Server-side runtime for handling API requests.
- **Express.js:** Lightweight framework for creating RESTful APIs.
- **CORS:** Middleware for handling cross-origin requests.

---

## Project Structure

```
personal_finance_manager/
├── pubspec.yaml               # Flutter project configuration
└── lib/
    ├── main.dart              # App entry point
    ├── models/
    │   └── transaction.dart   # Transaction model
    ├── screens/
    │   ├── home_screen.dart           # Home screen
    │   ├── expense_log_screen.dart    # Expense logging UI
    │   └── analytics_screen.dart      # Analytics dashboard
    └── services/
        └── api_service.dart   # Handles API calls

personal_finance_backend/
├── package.json               # Node.js project configuration
└── index.js                   # Express server and API endpoints
```

---

## Installation & Setup

### Backend Setup (Node.js API)
1. **Prerequisites:** Ensure [Node.js](https://nodejs.org/) is installed on your system.
2. **Navigate to the backend directory:**
   ```bash
   cd personal_finance_backend
   ```
3. **Install Dependencies:**
   ```bash
   npm install
   ```
4. **Start the Server:**
   ```bash
   npm start
   ```
   The backend API should now be running at `http://localhost:3000`.

---

### Frontend Setup (Flutter App)
1. **Prerequisites:** Install the [Flutter SDK](https://flutter.dev/docs/get-started/install).
2. **Navigate to the Flutter project directory:**
   ```bash
   cd personal_finance_manager
   ```
3. **Install Flutter Dependencies:**
   ```bash
   flutter pub get
   ```
4. **Run the App:**
   ```bash
   flutter run
   ```
   The mobile app will launch on an emulator or connected device.

---

## API Documentation

### GET /transactions
**Description:** Retrieve all logged transactions.

**Request:**
```
GET /transactions HTTP/1.1
Host: http://localhost:3000
```

**Response:**
```json
[
  {
    "id": 1,
    "amount": 50.0,
    "description": "Groceries",
    "date": "2025-02-07T10:30:00Z",
    "category": "Food"
  }
]
```

---

### POST /transactions
**Description:** Log a new expense transaction.

**Request:**
```
POST /transactions HTTP/1.1
Host: http://localhost:3000
Content-Type: application/json
```

**Body:**
```json
{
  "amount": 75.5,
  "description": "Electricity Bill",
  "date": "2025-02-08T12:00:00Z",
  "category": "Utilities"
}
```

**Response:**
```json
{
  "id": 2,
  "amount": 75.5,
  "description": "Electricity Bill",
  "date": "2025-02-08T12:00:00Z",
  "category": "Utilities"
}
```

---

## Future Enhancements
- **User Authentication:** Secure user login and account management.
- **Database Integration:** Transition from in-memory storage to a database (e.g., MongoDB).
- **Advanced Analytics:** Generate insights with charts and spending trends.
- **Recurring Expenses:** Automate logging for regular transactions.

---

## Contributors

| Name           | Role           | Contact                   |
| -------------- | -------------- | ------------------------- |
| **Harish Karthick S**  | Developer      | harish.s@kalvium.community   |


---

## License
This project is licensed under the MIT License. Feel free to use, modify, and distribute.

---

## Support & Contribution
If you'd like to contribute:
- **Fork** the repository.
- Create a **new branch** for your feature or bug fix.
- Make your **changes**.
- Submit a **Pull Request**.

For any issues or feature requests, please open an issue on the GitHub repository. Your support and contributions are greatly appreciated!

---

Happy Coding! 🚀

