import '../models/user_model.dart';
import '../models/customer_model.dart';
import '../models/product_model.dart';
import '../models/order_model.dart';
import '../models/payment_model.dart';
import '../models/employee_model.dart';
import '../models/target_model.dart';
import '../models/expense_model.dart';
import '../models/beat_plan_model.dart';
import '../models/communication_model.dart';
import '../models/dashboard_model.dart';

class MockDataService {
  // Current User
  static User getCurrentUser() {
    return User(
      id: 'U001',
      name: 'Rajesh Kumar',
      email: 'rajesh.kumar@elona.com',
      phone: '+91 98765 43210',
      role: UserRole.salesRep,
      designation: 'Senior Sales Representative',
      territory: 'North Mumbai',
      joinDate: DateTime(2023, 1, 15),
      avatar: null,
    );
  }

  // Mock Customers
  static List<Customer> getCustomers() {
    return [
      Customer(
        id: 'C001',
        name: 'Amit Traders',
        email: 'amit@traders.com',
        phone: '+91 98765 11111',
        address: 'Shop 12, Market Road, Andheri',
        city: 'Mumbai',
        state: 'Maharashtra',
        pincode: '400058',
        gstin: '27AABCU9603R1ZM',
        customerType: 'Retailer',
        creditLimit: 500000,
        outstandingBalance: 125000,
        latitude: 19.1136,
        longitude: 72.8697,
        assignedTo: 'U001',
        createdAt: DateTime(2024, 1, 10),
        beat: 'Beat A',
      ),
      Customer(
        id: 'C002',
        name: 'Sharma Enterprises',
        email: 'sharma@enterprises.com',
        phone: '+91 98765 22222',
        address: '45, MG Road, Bandra',
        city: 'Mumbai',
        state: 'Maharashtra',
        pincode: '400050',
        gstin: '27AABCU9603R1ZN',
        customerType: 'Wholesaler',
        creditLimit: 1000000,
        outstandingBalance: 450000,
        latitude: 19.0596,
        longitude: 72.8295,
        assignedTo: 'U001',
        createdAt: DateTime(2024, 2, 5),
        beat: 'Beat A',
      ),
      Customer(
        id: 'C003',
        name: 'Krishna Store',
        email: 'krishna@store.com',
        phone: '+91 98765 33333',
        address: '78, Station Road, Dadar',
        city: 'Mumbai',
        state: 'Maharashtra',
        pincode: '400014',
        customerType: 'Retailer',
        creditLimit: 300000,
        outstandingBalance: 85000,
        latitude: 19.0176,
        longitude: 72.8561,
        assignedTo: 'U001',
        createdAt: DateTime(2024, 3, 12),
        beat: 'Beat B',
      ),
      Customer(
        id: 'C004',
        name: 'Patel Distributors',
        email: 'patel@distributors.com',
        phone: '+91 98765 44444',
        address: '23, Industrial Area, Malad',
        city: 'Mumbai',
        state: 'Maharashtra',
        pincode: '400064',
        gstin: '27AABCU9603R1ZP',
        customerType: 'Distributor',
        creditLimit: 2000000,
        outstandingBalance: 780000,
        latitude: 19.1868,
        longitude: 72.8481,
        assignedTo: 'U001',
        createdAt: DateTime(2023, 11, 20),
        beat: 'Beat C',
      ),
      Customer(
        id: 'C005',
        name: 'Gupta Retail Mart',
        email: 'gupta@retail.com',
        phone: '+91 98765 55555',
        address: '56, Link Road, Goregaon',
        city: 'Mumbai',
        state: 'Maharashtra',
        pincode: '400062',
        customerType: 'Retailer',
        creditLimit: 400000,
        outstandingBalance: 150000,
        latitude: 19.1663,
        longitude: 72.8526,
        assignedTo: 'U001',
        createdAt: DateTime(2024, 1, 25),
        beat: 'Beat B',
      ),
    ];
  }

  // Mock Products
  static List<Product> getProducts() {
    return [
      Product(
        id: 'P001',
        name: 'Britannia Good Day Cookies',
        description: 'Delicious butter cookies, 200g pack',
        category: 'Biscuits',
        brand: 'Britannia',
        sku: 'BRI-GD-200',
        price: 35,
        mrp: 40,
        unit: 'Packet',
        minOrderQty: 10,
        gst: 12,
        imageUrl: null,
        stockQuantity: 1500,
      ),
      Product(
        id: 'P002',
        name: 'Parle-G Gold Biscuits',
        description: 'Classic glucose biscuits, 1kg pack',
        category: 'Biscuits',
        brand: 'Parle',
        sku: 'PAR-G-1KG',
        price: 95,
        mrp: 100,
        unit: 'Packet',
        minOrderQty: 5,
        gst: 12,
        imageUrl: null,
        stockQuantity: 2000,
      ),
      Product(
        id: 'P003',
        name: 'Amul Fresh Milk',
        description: 'Full cream fresh milk, 1 liter',
        category: 'Dairy',
        brand: 'Amul',
        sku: 'AMU-MLK-1L',
        price: 58,
        mrp: 62,
        unit: 'Liter',
        minOrderQty: 20,
        gst: 5,
        imageUrl: null,
        stockQuantity: 800,
      ),
      Product(
        id: 'P004',
        name: 'Tata Tea Gold',
        description: 'Premium tea leaves, 500g pack',
        category: 'Beverages',
        brand: 'Tata',
        sku: 'TAT-TEA-500',
        price: 220,
        mrp: 240,
        unit: 'Packet',
        minOrderQty: 5,
        gst: 12,
        imageUrl: null,
        stockQuantity: 600,
      ),
      Product(
        id: 'P005',
        name: 'Maggi 2-Minute Noodles',
        description: 'Masala noodles, pack of 12',
        category: 'Instant Food',
        brand: 'Maggi',
        sku: 'MAG-NOD-12',
        price: 144,
        mrp: 156,
        unit: 'Pack',
        minOrderQty: 10,
        gst: 12,
        imageUrl: null,
        stockQuantity: 1200,
      ),
      Product(
        id: 'P006',
        name: 'Colgate Total Toothpaste',
        description: 'Advanced toothpaste, 200g',
        category: 'Personal Care',
        brand: 'Colgate',
        sku: 'COL-TP-200',
        price: 145,
        mrp: 160,
        unit: 'Piece',
        minOrderQty: 10,
        gst: 18,
        imageUrl: null,
        stockQuantity: 500,
      ),
      Product(
        id: 'P007',
        name: 'Surf Excel Detergent',
        description: 'Matic front load, 2kg',
        category: 'Home Care',
        brand: 'Surf Excel',
        sku: 'SUR-DET-2KG',
        price: 380,
        mrp: 420,
        unit: 'Kg',
        minOrderQty: 5,
        gst: 18,
        imageUrl: null,
        stockQuantity: 400,
      ),
      Product(
        id: 'P008',
        name: 'Fortune Sunflower Oil',
        description: 'Refined sunflower oil, 5 liter',
        category: 'Edible Oil',
        brand: 'Fortune',
        sku: 'FOR-OIL-5L',
        price: 650,
        mrp: 700,
        unit: 'Liter',
        minOrderQty: 5,
        gst: 12,
        imageUrl: null,
        stockQuantity: 300,
      ),
      Product(
        id: 'P009',
        name: 'Coca-Cola 2.25L',
        description: 'Carbonated soft drink, 2.25 liter',
        category: 'Beverages',
        brand: 'Coca-Cola',
        sku: 'COK-225L',
        price: 90,
        mrp: 100,
        unit: 'Bottle',
        minOrderQty: 12,
        gst: 28,
        imageUrl: null,
        stockQuantity: 900,
      ),
      Product(
        id: 'P010',
        name: 'Lays Chips Family Pack',
        description: 'Classic salted chips, 200g',
        category: 'Snacks',
        brand: 'Lays',
        sku: 'LAY-CHP-200',
        price: 95,
        mrp: 105,
        unit: 'Packet',
        minOrderQty: 10,
        gst: 12,
        imageUrl: null,
        stockQuantity: 750,
      ),
    ];
  }

  // Mock Orders
  static List<Order> getOrders() {
    final now = DateTime.now();
    return [
      Order(
        id: 'ORD001',
        customerId: 'C001',
        customerName: 'Amit Traders',
        salesRepId: 'U001',
        salesRepName: 'Rajesh Kumar',
        orderDate: now,
        items: [
          OrderItem(
            productId: 'P001',
            productName: 'Britannia Good Day Cookies',
            quantity: 50,
            price: 35,
            discount: 0,
            gst: 12,
          ),
          OrderItem(
            productId: 'P002',
            productName: 'Parle-G Gold Biscuits',
            quantity: 30,
            price: 95,
            discount: 5,
            gst: 12,
          ),
        ],
        subtotal: 4600,
        discount: 142.5,
        gstAmount: 534.30,
        totalAmount: 4991.80,
        status: OrderStatus.pending,
        notes: 'Urgent delivery required',
        invoiceNumber: 'INV-2026-001',
      ),
      Order(
        id: 'ORD002',
        customerId: 'C002',
        customerName: 'Sharma Enterprises',
        salesRepId: 'U001',
        salesRepName: 'Rajesh Kumar',
        orderDate: now.subtract(Duration(days: 1)),
        items: [
          OrderItem(
            productId: 'P003',
            productName: 'Amul Fresh Milk',
            quantity: 100,
            price: 58,
            discount: 0,
            gst: 5,
          ),
          OrderItem(
            productId: 'P004',
            productName: 'Tata Tea Gold',
            quantity: 25,
            price: 220,
            discount: 0,
            gst: 12,
          ),
        ],
        subtotal: 11300,
        discount: 0,
        gstAmount: 950,
        totalAmount: 12250,
        status: OrderStatus.confirmed,
        invoiceNumber: 'INV-2026-002',
      ),
      Order(
        id: 'ORD003',
        customerId: 'C003',
        customerName: 'Krishna Store',
        salesRepId: 'U001',
        salesRepName: 'Rajesh Kumar',
        orderDate: now.subtract(Duration(days: 2)),
        items: [
          OrderItem(
            productId: 'P005',
            productName: 'Maggi 2-Minute Noodles',
            quantity: 40,
            price: 144,
            discount: 0,
            gst: 12,
          ),
        ],
        subtotal: 5760,
        discount: 0,
        gstAmount: 691.20,
        totalAmount: 6451.20,
        status: OrderStatus.dispatched,
        deliveryDate: now.add(Duration(days: 1)),
        invoiceNumber: 'INV-2026-003',
      ),
    ];
  }

  // Mock Payments
  static List<Payment> getPayments() {
    final now = DateTime.now();
    return [
      Payment(
        id: 'PAY001',
        customerId: 'C001',
        customerName: 'Amit Traders',
        salesRepId: 'U001',
        salesRepName: 'Rajesh Kumar',
        amount: 25000,
        mode: PaymentMode.upi,
        status: PaymentStatus.completed,
        paymentDate: now,
        transactionId: 'UPI2026031201234',
        notes: 'Payment for invoice INV-2026-001',
        orderId: 'ORD001',
      ),
      Payment(
        id: 'PAY002',
        customerId: 'C002',
        customerName: 'Sharma Enterprises',
        salesRepId: 'U001',
        salesRepName: 'Rajesh Kumar',
        amount: 50000,
        mode: PaymentMode.cheque,
        status: PaymentStatus.pending,
        paymentDate: now.subtract(Duration(days: 1)),
        chequeNumber: 'CHQ123456',
        chequeDate: now.add(Duration(days: 7)),
        bankName: 'HDFC Bank',
        notes: 'Post-dated cheque',
      ),
      Payment(
        id: 'PAY003',
        customerId: 'C004',
        customerName: 'Patel Distributors',
        salesRepId: 'U001',
        salesRepName: 'Rajesh Kumar',
        amount: 75000,
        mode: PaymentMode.neft,
        status: PaymentStatus.completed,
        paymentDate: now.subtract(Duration(days: 3)),
        transactionId: 'NEFT2026030901122',
        bankName: 'ICICI Bank',
      ),
    ];
  }

  // Mock Employees
  static List<Employee> getEmployees() {
    return [
      Employee(
        id: 'E001',
        name: 'Rajesh Kumar',
        email: 'rajesh@elona.com',
        phone: '+91 98765 43210',
        designation: 'Senior Sales Representative',
        department: 'Sales',
        managerId: 'M001',
        managerName: 'Suresh Patel',
        territory: 'North Mumbai',
        joinDate: DateTime(2023, 1, 15),
        employeeCode: 'EMP001',
      ),
      Employee(
        id: 'E002',
        name: 'Priya Sharma',
        email: 'priya@elona.com',
        phone: '+91 98765 43211',
        designation: 'Sales Representative',
        department: 'Sales',
        managerId: 'M001',
        managerName: 'Suresh Patel',
        territory: 'South Mumbai',
        joinDate: DateTime(2023, 6, 1),
        employeeCode: 'EMP002',
      ),
      Employee(
        id: 'E003',
        name: 'Amit Verma',
        email: 'amit@elona.com',
        phone: '+91 98765 43212',
        designation: 'Sales Representative',
        department: 'Sales',
        managerId: 'M001',
        managerName: 'Suresh Patel',
        territory: 'West Mumbai',
        joinDate: DateTime(2024, 1, 10),
        employeeCode: 'EMP003',
      ),
    ];
  }

  // Mock Targets
  static List<Target> getTargets() {
    final now = DateTime.now();
    return [
      Target(
        id: 'T001',
        employeeId: 'E001',
        employeeName: 'Rajesh Kumar',
        salesTarget: 500000,
        salesAchieved: 385000,
        orderTarget: 100,
        orderAchieved: 78,
        visitTarget: 150,
        visitAchieved: 112,
        period: 'Monthly',
        startDate: DateTime(now.year, now.month, 1),
        endDate: DateTime(now.year, now.month + 1, 0),
      ),
      Target(
        id: 'T002',
        employeeId: 'E002',
        employeeName: 'Priya Sharma',
        salesTarget: 400000,
        salesAchieved: 320000,
        orderTarget: 80,
        orderAchieved: 65,
        visitTarget: 120,
        visitAchieved: 95,
        period: 'Monthly',
        startDate: DateTime(now.year, now.month, 1),
        endDate: DateTime(now.year, now.month + 1, 0),
      ),
    ];
  }

  // Mock Expenses
  static List<Expense> getExpenses() {
    final now = DateTime.now();
    return [
      Expense(
        id: 'EXP001',
        employeeId: 'E001',
        employeeName: 'Rajesh Kumar',
        type: ExpenseType.fuel,
        amount: 1500,
        description: 'Petrol for field visit',
        expenseDate: now,
        status: ExpenseStatus.pending,
      ),
      Expense(
        id: 'EXP002',
        employeeId: 'E001',
        employeeName: 'Rajesh Kumar',
        type: ExpenseType.food,
        amount: 450,
        description: 'Client lunch meeting',
        expenseDate: now.subtract(Duration(days: 1)),
        status: ExpenseStatus.approved,
        approvedBy: 'M001',
        approvedDate: now,
      ),
      Expense(
        id: 'EXP003',
        employeeId: 'E001',
        employeeName: 'Rajesh Kumar',
        type: ExpenseType.travel,
        amount: 800,
        description: 'Local travel - taxi fare',
        expenseDate: now.subtract(Duration(days: 2)),
        status: ExpenseStatus.approved,
        approvedBy: 'M001',
        approvedDate: now.subtract(Duration(days: 1)),
      ),
    ];
  }

  // Mock Customer Visits
  static List<CustomerVisit> getCustomerVisits() {
    final now = DateTime.now();
    return [
      CustomerVisit(
        id: 'V001',
        customerId: 'C001',
        customerName: 'Amit Traders',
        employeeId: 'E001',
        employeeName: 'Rajesh Kumar',
        visitDate: now,
        checkInTime: now.subtract(Duration(hours: 2)),
        checkOutTime: now.subtract(Duration(hours: 1, minutes: 30)),
        checkInLatitude: 19.1136,
        checkInLongitude: 72.8697,
        purpose: 'Order collection and payment follow-up',
        feedback: 'Customer satisfied with service',
        status: VisitStatus.completed,
      ),
      CustomerVisit(
        id: 'V002',
        customerId: 'C002',
        customerName: 'Sharma Enterprises',
        employeeId: 'E001',
        employeeName: 'Rajesh Kumar',
        visitDate: now.subtract(Duration(days: 1)),
        checkInTime: now.subtract(Duration(days: 1, hours: 3)),
        checkOutTime: now.subtract(Duration(days: 1, hours: 2, minutes: 15)),
        checkInLatitude: 19.0596,
        checkInLongitude: 72.8295,
        purpose: 'New product introduction',
        feedback: 'Interested in new products',
        status: VisitStatus.completed,
      ),
      CustomerVisit(
        id: 'V003',
        customerId: 'C003',
        customerName: 'Krishna Store',
        employeeId: 'E001',
        employeeName: 'Rajesh Kumar',
        visitDate: now,
        status: VisitStatus.planned,
        purpose: 'Regular visit and stock check',
      ),
    ];
  }

  // Mock Beat Plans
  static List<BeatPlan> getBeatPlans() {
    return [
      BeatPlan(
        id: 'B001',
        name: 'Beat A - North Zone',
        employeeId: 'E001',
        employeeName: 'Rajesh Kumar',
        territory: 'North Mumbai',
        customerIds: ['C001', 'C002'],
        dayOfWeek: 'Monday',
        effectiveFrom: DateTime(2024, 1, 1),
      ),
      BeatPlan(
        id: 'B002',
        name: 'Beat B - Central Zone',
        employeeId: 'E001',
        employeeName: 'Rajesh Kumar',
        territory: 'North Mumbai',
        customerIds: ['C003', 'C005'],
        dayOfWeek: 'Wednesday',
        effectiveFrom: DateTime(2024, 1, 1),
      ),
      BeatPlan(
        id: 'B003',
        name: 'Beat C - West Zone',
        employeeId: 'E001',
        employeeName: 'Rajesh Kumar',
        territory: 'North Mumbai',
        customerIds: ['C004'],
        dayOfWeek: 'Friday',
        effectiveFrom: DateTime(2024, 1, 1),
      ),
    ];
  }

  // Mock Announcements
  static List<Announcement> getAnnouncements() {
    final now = DateTime.now();
    return [
      Announcement(
        id: 'A001',
        title: 'New Product Launch',
        message: 'We are launching 5 new products next week. Please prepare your customers.',
        postedBy: 'Admin',
        postedDate: now.subtract(Duration(days: 1)),
        isImportant: true,
      ),
      Announcement(
        id: 'A002',
        title: 'Monthly Sales Meeting',
        message: 'Monthly sales review meeting scheduled for 15th March at 10 AM',
        postedBy: 'Sales Manager',
        postedDate: now.subtract(Duration(days: 3)),
        isImportant: false,
      ),
    ];
  }

  // Mock Notifications
  static List<AppNotification> getNotifications() {
    final now = DateTime.now();
    return [
      AppNotification(
        id: 'N001',
        title: 'New Order Received',
        message: 'Order ORD001 from Amit Traders has been placed',
        type: 'order',
        timestamp: now.subtract(Duration(hours: 1)),
        relatedId: 'ORD001',
      ),
      AppNotification(
        id: 'N002',
        title: 'Payment Collected',
        message: 'Payment of ₹25,000 received from Amit Traders',
        type: 'payment',
        timestamp: now.subtract(Duration(hours: 2)),
        relatedId: 'PAY001',
      ),
      AppNotification(
        id: 'N003',
        title: 'Target Achievement Alert',
        message: 'You have achieved 77% of your monthly target',
        type: 'announcement',
        timestamp: now.subtract(Duration(days: 1)),
      ),
    ];
  }

  // Mock Dashboard Stats
  static DashboardStats getDashboardStats() {
    return DashboardStats(
      todaysSales: 125450,
      todaysOrders: 12,
      todaysVisits: 8,
      monthlyRevenue: 3854700,
      targetAchievement: 77.0,
      pendingOrders: 5,
      pendingPayments: 8,
      activeCustomers: 45,
    );
  }

  // Mock Inventory
  static List<Inventory> getInventory() {
    return [
      Inventory(
        id: 'INV001',
        productId: 'P001',
        productName: 'Britannia Good Day Cookies',
        quantity: 1500,
        warehouseId: 'W001',
        warehouseName: 'Mumbai Warehouse',
        lastUpdated: DateTime.now(),
      ),
      Inventory(
        id: 'INV002',
        productId: 'P002',
        productName: 'Parle-G Gold Biscuits',
        quantity: 2000,
        warehouseId: 'W001',
        warehouseName: 'Mumbai Warehouse',
        lastUpdated: DateTime.now(),
      ),
      Inventory(
        id: 'INV003',
        productId: 'P003',
        productName: 'Amul Fresh Milk',
        quantity: 800,
        warehouseId: 'W001',
        warehouseName: 'Mumbai Warehouse',
        lastUpdated: DateTime.now(),
      ),
    ];
  }
}
