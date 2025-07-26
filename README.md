# Remittance

# 💸 Remittance App

A mobile remittance application built with **Flutter**, powered by **Riverpod** for state management. This app allows users to securely send and receive money, view their transaction history, manage their account, and switch between light, dark, and system themes.

---

## ✨ Features

- 🔐 **Authentication**
  - User login & registration
  - Email & phone number support
- 💸 **Send & Receive Money**
  - Secure transaction handling
  - Balance checks & validation
- 📜 **Transaction History**
  - Sent & received transaction logs
  - User-to-user details with timestamps
- 🌗 **Theme Switching**
  - Light / Dark / System theme support
  - Persistent user preference via Riverpod
- ⚙️ **User Profile**
  - View account info
  - Logout & reset session
- 🚀 **Responsive UI**
  - Adaptive layout for multiple screen sizes
  - Clean & modern UI with custom themes
- ⚙️ **Mock Backend**
  - `json-server` for testing API endpoints
  - Easy to replace with a real backend

---

## 📦 Tech Stack

| Layer            | Technology         |
|------------------|--------------------|
| UI               | Flutter, Dart      |
| State Management | Riverpod           |
| Routing          |  `auto_route` |
| Theming          | Flutter `ThemeData`, Riverpod |
| Local Mock Server| `json-server`      |
| Network Calls    | `http` package     |
| Loading Indicator| `flutter_easyloading` |
| Icons/Images     | Custom + Asset     |

---

## 🛠 Installation

1. **Clone the repo**

     git clone https://github.com/BeleShew/remittance.git
     cd remittance

2. **Install dependencies**

    flutter pub get

3. **Run mock backend**

   Ensure you have json-server installed globally:
   
    npm install -g json-server
   
    json-server --watch db.json --port 3000

5. **Run the app**
     flutter run
   
**State Management**
  Riverpod is used to handle:
  Authentication state
  User profile and balance
  Transaction data
  Theme preferences (with SharedPreferences)

  
**Screenshots**

  ![photo_2025-07-27_00-10-01](https://github.com/user-attachments/assets/da7014ee-84b4-4cbf-9eca-9ec055d6e3b2)
  ![photo_3_2025-07-27_00-06-35](https://github.com/user-attachments/assets/626af919-b13b-456e-92d3-1eb098dba96b)
  ![photo_2_2025-07-27_00-06-35](https://github.com/user-attachments/assets/b770f4a9-79b9-4159-bea9-ac8f39aee230)
  ![photo_1_2025-07-27_00-06-35](https://github.com/user-attachments/assets/727a564a-90b6-47ce-adad-cc8b09061944)
  ![photo_2025-07-27_00-12-07](https://github.com/user-attachments/assets/f32e400a-716a-4517-8398-318b96353096)

**A live demo of the app and walking through key features**

  https://1drv.ms/v/c/dd15fd3834aab02e/EfFG4NUTiCROkhzTijnuVIABi2_GPxJ9fBSXyxg6tHPTMQ

✅ TODO

   Add biometric login
  
   Integrate real-time notifications (e.g. Firebase)
  
   Replace mock server with real API
  
   Improve input validation and error handling

📄 **License**
This project is licensed under the MIT License.
