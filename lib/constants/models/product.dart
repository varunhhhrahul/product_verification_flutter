class Product {
  final String address;
  final String name;
  final String companyName;
  final String manufactureYear;
  final String manufacturePlace;

  Product({
    required this.address,
    required this.name,
    required this.companyName,
    required this.manufactureYear,
    required this.manufacturePlace,
  });

  Product.copy(
    Product copy, {
    String? address,
    String? name,
    String? companyName,
    String? manufactureYear,
    String? manufacturePlace,
  }) : this(
          address: address ?? copy.address,
          name: name ?? copy.name,
          companyName: companyName ?? copy.companyName,
          manufactureYear: manufactureYear ?? copy.manufactureYear,
          manufacturePlace: manufacturePlace ?? copy.manufacturePlace,
        );

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'name': name,
      'manufactureYear': manufactureYear,
      'companyName': companyName,
      'manufacturePlace': manufacturePlace,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      address: json['address'],
      name: json['name'],
      companyName: json['companyName'],
      manufactureYear: json['manufactureYear'],
      manufacturePlace: json['manufacturePlace'],
    );
  }
}
