# ELONA SFA - Sales Force Automation System

A comprehensive Flutter mobile application for Sales Force Automation (SFA) and Field Sales Management.

## Features

### 📱 Core Modules

1. **Authentication**
   - Login/Register
   - Forgot Password
   - OTP Verification
   - Password Reset

2. **Dashboard**
   - Real-time KPIs
   - Sales Analytics
   - Target Progress
   - Quick Actions
   - Recent Activities

3. **Customer Management**
   - Customer List with Search
   - Customer Details with Tabs
   - Add/Edit Customers
   - Outstanding Balance Tracking
   - Order & Payment History

4. **Product Management**
   - Product Grid View
   - Category Filters
   - Product Details
   - Stock Availability
   - Pricing Information

5. **Order Management**
   - Order Listing
   - Order Details
   - Create New Orders
   - Order Status Tracking
   - Cart Functionality

6. **Payment Collection**
   - Payment List
   - Multiple Payment Modes (Cash, UPI, NEFT, Cheque, Card)
   - Pending Payment Tracking
   - Payment Collection Form

7. **Expense Management**
   - Expense Listing
   - Expense Types (Fuel, Food, Travel, Accommodation)
   - Approval Status Tracking

8. **Employee Management**
   - Employee Directory
   - Employee Details
   - Performance Tracking

9. **Sales Targets**
   - Target Listing
   - Progress Tracking
   - Achievement Percentage
   - Sales/Order/Visit Targets

10. **Reports & Analytics**
    - Sales Reports
    - Order Reports
    - Visit Reports
    - Payment Reports
    - Product Performance
    - Employee Performance

11. **Settings**
    - User Profile
    - Change Password
    - Notifications
    - App Settings
    - Logout

## 🛠️ Tech Stack

- **Framework**: Flutter (Latest Stable)
- **State Management**: Provider
- **Architecture**: Clean Architecture
- **UI**: Material Design 3
- **Charts**: FL Chart
- **Navigation**: Named Routes
- **Fonts**: Google Fonts (Poppins)

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  google_fonts: ^6.1.0
  fl_chart: ^0.65.0
  go_router: ^12.1.3
  google_maps_flutter: ^2.5.0
  geolocator: ^10.1.0
  font_awesome_flutter: ^10.6.0
  intl: ^0.18.1
  image_picker: ^1.0.4
  shared_preferences: ^2.2.2
  uuid: ^4.2.2
  flutter_form_builder: ^9.1.1
```

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   └── app_strings.dart
│   └── utils/
│       └── formatters.dart
├── models/
│   ├── user_model.dart
│   ├── customer_model.dart
│   ├── product_model.dart
│   ├── order_model.dart
│   ├── payment_model.dart
│   ├── employee_model.dart
│   ├── target_model.dart
│   ├── expense_model.dart
│   ├── beat_plan_model.dart
│   ├── communication_model.dart
│   └── dashboard_model.dart
├── services/
│   └── mock_data_service.dart
├── providers/
│   ├── auth_provider.dart
│   ├── customer_provider.dart
│   ├── product_provider.dart
│   ├── order_provider.dart
│   ├── payment_provider.dart
│   └── dashboard_provider.dart
├── features/
│   ├── auth/
│   ├── dashboard/
│   ├── customers/
│   ├── products/
│   ├── orders/
│   ├── payments/
│   ├── expenses/
│   ├── employees/
│   ├── targets/
│   ├── reports/
│   ├── settings/
│   ├── more/
│   └── home_screen.dart
└── main.dart
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- Android SDK / iOS SDK

### Installation

1. Clone the repository

```bash
git clone <repository-url>
cd ELONA
```

2. Install dependencies

```bash
flutter pub get
```

3. Run the app

```bash
flutter run
```

### Default Login Credentials

- **Email**: admin@example.com
- **Password**: Any password (Mock authentication)

## 📱 Screenshots

- Dashboard with KPIs and Charts
- Customer Management
- Order Creation
- Payment Collection
- Reports & Analytics

## 🎨 Design Features

- Material Design 3
- Responsive layouts
- Card-based UI
- Bottom navigation
- Pull-to-refresh
- Status color coding
- Modern color scheme
- Custom fonts (Poppins)

## 🔐 User Roles

1. **Admin** - Full access
2. **Sales Manager** - Team management & reports
3. **Sales Representative** - Field operations
4. **Distributor** - Order & payment management

## 📊 Mock Data

The app includes realistic mock data for:

- 5 Customers (Mumbai-based)
- 10 Products (FMCG)
- 3 Orders
- 3 Payments
- 3 Employees
- 2 Targets
- 3 Expenses
- 3 Beat Plans
- Dashboard Statistics

## 🔄 State Management

Using Provider pattern with:

- AuthProvider - Authentication state
- CustomerProvider - Customer CRUD operations
- ProductProvider - Product filtering & search
- OrderProvider - Order management & cart
- PaymentProvider - Payment collection
- DashboardProvider - Dashboard data

## 🎯 Key Features

- ✅ Production-grade UI
- ✅ Clean Architecture
- ✅ Comprehensive data models
- ✅ Mock data service
- ✅ State management
- ✅ Form validation
- ✅ Navigation flow
- ✅ Charts & analytics
- ✅ Responsive design
- ✅ Status tracking

## 📝 TODO (Future Enhancements)

- [ ] Field Tracking with GPS
- [ ] Beat Planning screens
- [ ] Inventory Management
- [ ] Communication module
- [ ] Daily Activity tracking
- [ ] Backend API integration
- [ ] Push notifications
- [ ] Document upload
- [ ] Offline mode
- [ ] Data export

## 🤝 Contributing

Contributions are welcome! Please follow the existing code structure and conventions.

## 📄 License

This project is licensed under the MIT License.

## 👥 Team

Developed as a complete SFA solution for field sales teams.

---

**Note**: This application uses mock data for demonstration purposes. Replace `MockDataService` with actual API calls for production use.
