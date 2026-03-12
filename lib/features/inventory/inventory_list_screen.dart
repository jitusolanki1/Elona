import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/formatters.dart';
import '../../services/mock_data_service.dart';

class InventoryListScreen extends StatelessWidget {
  const InventoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inventoryItems = MockDataService.getInventory();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Inventory'),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Filter options coming soon')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSummaryCards(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: inventoryItems.length,
              itemBuilder: (context, index) {
                final item = inventoryItems[index];
                final product = MockDataService.getProducts().firstWhere(
                  (p) => p.id == item.productId,
                  orElse: () => MockDataService.getProducts().first,
                );
                final lowStock = item.quantity < 50; // Simple threshold

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: lowStock
                            ? AppColors.error.withAlpha(25)
                            : AppColors.success.withAlpha(25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.inventory_2,
                        color: lowStock ? AppColors.error : AppColors.success,
                      ),
                    ),
                    title: Text(
                      product.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text('Warehouse: ${item.warehouseName}'),
                        const SizedBox(height: 4),
                        Text(
                          'Stock: ${item.quantity} units',
                          style: TextStyle(
                            fontSize: 12,
                            color: lowStock ? AppColors.error : AppColors.textSecondary,
                            fontWeight: lowStock ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        if (lowStock) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.warning, size: 14, color: AppColors.error),
                              const SizedBox(width: 4),
                              Text(
                                'Low Stock Alert',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppColors.error,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                    trailing: Icon(Icons.chevron_right, color: AppColors.textSecondary),
                    onTap: () {
                      _showInventoryDetail(context, product, item);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildSummaryCard('Total Stock', '12,450', AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildSummaryCard('Low Stock', '3', AppColors.error),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildSummaryCard('Reserved', '850', AppColors.warning),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showInventoryDetail(BuildContext context, product, item) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildDetailRow('SKU', product.sku),
            _buildDetailRow('Warehouse', item.warehouseName),
            _buildDetailRow('Stock', '${item.quantity} units'),
            _buildDetailRow('Last Updated', Formatters.formatDateTime(item.lastUpdated)),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Stock transfer coming soon')),
                  );
                },
                icon: const Icon(Icons.swap_horiz),
                label: const Text('Transfer Stock'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: AppColors.textSecondary),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
