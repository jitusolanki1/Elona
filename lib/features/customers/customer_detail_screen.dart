import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/formatters.dart';
import '../../models/customer_model.dart';
import '../../models/beat_plan_model.dart';
import '../../services/mock_data_service.dart';

class CustomerDetailScreen extends StatelessWidget {
  final Customer customer;

  const CustomerDetailScreen({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Customer Details'),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit customer
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              _showMoreOptions(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildInfoSection(),
            _buildActionButtons(context),
            _buildTabSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.primary,
            child: Text(
              customer.name[0].toUpperCase(),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            customer.name,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              customer.customerType,
              style: TextStyle(
                color: AppColors.info,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildInfoRow(Icons.phone, 'Phone', customer.phone),
          Divider(height: 1),
          _buildInfoRow(Icons.email, 'Email', customer.email),
          Divider(height: 1),
          _buildInfoRow(Icons.location_on, 'Address',
              '${customer.address}, ${customer.city}, ${customer.state} - ${customer.pincode}'),
          if (customer.gstin != null) ...[
            Divider(height: 1),
            _buildInfoRow(Icons.business, 'GSTIN', customer.gstin!),
          ],
          Divider(height: 1),
          _buildInfoRow(Icons.calendar_today, 'Customer Since',
              Formatters.formatDate(customer.createdAt)),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/orders/create', arguments: customer);
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text('New Order'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/payments/collect', arguments: customer);
              },
              icon: Icon(Icons.payment),
              label: Text('Collect Payment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.success,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSection(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          SizedBox(height: 16),
          Container(
            color: Colors.white,
            child: TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              tabs: [
                Tab(text: 'Orders'),
                Tab(text: 'Payments'),
                Tab(text: 'Visits'),
              ],
            ),
          ),
          Container(
            height: 400,
            color: Colors.white,
            child: TabBarView(
              children: [
                _buildOrdersTab(),
                _buildPaymentsTab(),
                _buildVisitsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersTab() {
    final orders = MockDataService.getOrders()
        .where((o) => o.customerId == customer.id)
        .toList();

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          margin: EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Icon(Icons.shopping_cart, color: AppColors.primary),
            title: Text(order.id),
            subtitle: Text(Formatters.formatDate(order.orderDate)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Formatters.formatCurrency(order.totalAmount),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  order.status.toString().split('.').last,
                  style: TextStyle(fontSize: 11, color: AppColors.success),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaymentsTab() {
    final payments = MockDataService.getPayments()
        .where((p) => p.customerId == customer.id)
        .toList();

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: payments.length,
      itemBuilder: (context, index) {
        final payment = payments[index];
        return Card(
          margin: EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Icon(Icons.payment, color: AppColors.success),
            title: Text(Formatters.formatCurrency(payment.amount)),
            subtitle: Text(Formatters.formatDate(payment.paymentDate)),
            trailing: Text(payment.mode.toString().split('.').last.toUpperCase()),
          ),
        );
      },
    );
  }

  Widget _buildVisitsTab() {
    final visits = MockDataService.getCustomerVisits()
        .where((v) => v.customerId == customer.id)
        .toList();

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: visits.length,
      itemBuilder: (context, index) {
        final visit = visits[index];
        return Card(
          margin: EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Icon(Icons.location_on, color: AppColors.info),
            title: Text(visit.purpose ?? 'Customer Visit'),
            subtitle: Text(Formatters.formatDate(visit.visitDate)),
            trailing: Icon(
              visit.status == VisitStatus.completed
                  ? Icons.check_circle
                  : Icons.pending,
              color: visit.status == VisitStatus.completed
                  ? AppColors.success
                  : AppColors.warning,
            ),
          ),
        );
      },
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.map),
                title: Text('View on Map'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to map
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Call Customer'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share Details'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: AppColors.error),
                title: Text('Delete Customer', style: TextStyle(color: AppColors.error)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
