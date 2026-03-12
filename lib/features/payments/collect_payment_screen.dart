import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../models/payment_model.dart';
import '../../providers/payment_provider.dart';
import '../../providers/customer_provider.dart';

class CollectPaymentScreen extends StatefulWidget {
  const CollectPaymentScreen({Key? key}) : super(key: key);

  @override
  State<CollectPaymentScreen> createState() => _CollectPaymentScreenState();
}

class _CollectPaymentScreenState extends State<CollectPaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _transactionIdController = TextEditingController();
  final _chequeNumberController = TextEditingController();
  final _notesController = TextEditingController();

  String? _selectedCustomerId;
  String? _selectedCustomerName;
  PaymentMode _selectedMode = PaymentMode.cash;

  @override
  void dispose() {
    _amountController.dispose();
    _transactionIdController.dispose();
    _chequeNumberController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Collect Payment'),
        backgroundColor: AppColors.primary,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCustomerSelection(),
              SizedBox(height: 16),
              _buildAmountField(),
              SizedBox(height: 16),
              _buildPaymentModeCard(),
              if (_selectedMode == PaymentMode.upi || _selectedMode == PaymentMode.neft)
                _buildTransactionField(),
              if (_selectedMode == PaymentMode.cheque)
                _buildChequeFields(),
              SizedBox(height: 16),
              _buildNotesField(),
              SizedBox(height: 24),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerSelection() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Customer',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () async {
                final customers = context.read<CustomerProvider>().customers;
                final selected = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Select Customer'),
                    content: SizedBox(
                      width: double.maxFinite,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: customers.length,
                        itemBuilder: (context, index) {
                          final customer = customers[index];
                          return ListTile(
                            title: Text(customer.name),
                            subtitle: Text('Outstanding: ₹${customer.outstandingBalance}'),
                            onTap: () {
                              Navigator.pop(context, customer);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );

                if (selected != null) {
                  setState(() {
                    _selectedCustomerId = selected.id;
                    _selectedCustomerName = selected.name;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.divider),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person, color: AppColors.primary),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _selectedCustomerName ?? 'Choose a customer',
                        style: TextStyle(
                          fontSize: 15,
                          color: _selectedCustomerName != null
                              ? AppColors.textPrimary
                              : AppColors.textSecondary,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountField() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextFormField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            labelText: 'Payment Amount',
            prefixText: '₹ ',
            prefixStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter amount';
            }
            if (double.tryParse(value) == null) {
              return 'Please enter valid amount';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildPaymentModeCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Mode',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 12,
              children: PaymentMode.values.map((mode) {
                final isSelected = _selectedMode == mode;
                return ChoiceChip(
                  label: Text(mode.toString().split('.').last.toUpperCase()),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _selectedMode = mode;
                    });
                  },
                  selectedColor: AppColors.primary.withOpacity(0.2),
                  labelStyle: TextStyle(
                    color: isSelected ? AppColors.primary : AppColors.textSecondary,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionField() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextFormField(
          controller: _transactionIdController,
          decoration: InputDecoration(
            labelText: 'Transaction ID',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          validator: (value) {
            if (_selectedMode == PaymentMode.upi || _selectedMode == PaymentMode.neft) {
              if (value == null || value.isEmpty) {
                return 'Please enter transaction ID';
              }
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildChequeFields() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _chequeNumberController,
              decoration: InputDecoration(
                labelText: 'Cheque Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              validator: (value) {
                if (_selectedMode == PaymentMode.cheque) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter cheque number';
                  }
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesField() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextFormField(
          controller: _notesController,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Notes (Optional)',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _collectPayment,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.success,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        'Collect Payment',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> _collectPayment() async {
    if (_selectedCustomerId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a customer'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      final payment = await context.read<PaymentProvider>().collectPayment(
        customerId: _selectedCustomerId!,
        customerName: _selectedCustomerName!,
        amount: double.parse(_amountController.text),
        mode: _selectedMode,
        transactionId: _transactionIdController.text.isNotEmpty
            ? _transactionIdController.text
            : null,
        chequeNumber: _chequeNumberController.text.isNotEmpty
            ? _chequeNumberController.text
            : null,
        notes: _notesController.text.isNotEmpty
            ? _notesController.text
            : null,
      );

      if (payment != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Payment collected successfully'),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.pop(context);
      }
    }
  }
}
