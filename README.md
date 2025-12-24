# CRUD Product App (Flutter + GetX)

A simple and clean **CRUD Product Application** built with **Flutter**, using **GetX** for state management and **REST API** for backend communication.

---

## 🚀 Features

- 📦 View product list from backend API
- ➕ Create new product
- ✏️ Update existing product
- ❌ Delete product
- 🔄 Real-time UI update using GetX
- 🌐 API-based backend integration

---

## 🛠️ Technologies Used

- **Flutter**
- **Dart**
- **GetX** (State Management & Dependency Injection)
- **REST API**
- **HTTP Package**

---

## 📁 Project Structure (Overview)

lib/
│
├── data/
│ ├── models/
│ │ └── product_model.dart
│ └── services/
│ └── api_service.dart
│
├── presentation/
│ ├── screens/
│ │ ├── product_list.dart
│ │ ├── create_product.dart
│ │ └── update_product.dart
│ └── widgets/
│
├── controller/
│ └── product_controller.dart
│
├── utils/
│ └── api_urls.dart
│
└── main.dart

yaml
Copy code

---

## 🔄 State Management

This project uses **GetX** for:

- State management
- API response handling
- Navigation
- Dependency injection

Example:
```dart
final ProductController controller = Get.put(ProductController());
🌐 API Operations
The app supports the following API operations:

GET → Fetch product list

POST → Create new product

POST → Update product

GET → Delete product


▶️ How to Run the Project
Clone the repository

bash
Copy code
git clone https://github.com/your-username/crud-product-app.git
Install dependencies

bash
Copy code
flutter pub get
Run the app

bash
Copy code
flutter run
🎯 Purpose of This Project
This project is created to practice:

Flutter API integration

GetX state management

Clean folder structure

CRUD operations

👨‍💻 Developer
Md Salauddin Rony
Junior Flutter Developer