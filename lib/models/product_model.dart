class Product {
  final String id;
  final String name;
  final String description;
  final String category;
  final String brand;
  final String sku;
  final double price;
  final double mrp;
  final String unit; // Piece, Box, Kg, Liter
  final int minOrderQty;
  final double gst;
  final String? imageUrl;
  final bool isActive;
  final int stockQuantity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.brand,
    required this.sku,
    required this.price,
    required this.mrp,
    required this.unit,
    required this.minOrderQty,
    required this.gst,
    this.imageUrl,
    this.isActive = true,
    required this.stockQuantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      brand: json['brand'],
      sku: json['sku'],
      price: json['price'].toDouble(),
      mrp: json['mrp'].toDouble(),
      unit: json['unit'],
      minOrderQty: json['minOrderQty'],
      gst: json['gst'].toDouble(),
      imageUrl: json['imageUrl'],
      isActive: json['isActive'] ?? true,
      stockQuantity: json['stockQuantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'brand': brand,
      'sku': sku,
      'price': price,
      'mrp': mrp,
      'unit': unit,
      'minOrderQty': minOrderQty,
      'gst': gst,
      'imageUrl': imageUrl,
      'isActive': isActive,
      'stockQuantity': stockQuantity,
    };
  }

  double get discount => mrp - price;
  double get discountPercentage => ((mrp - price) / mrp) * 100;
}
