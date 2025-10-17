class Product {
  int? id;
  String name;
  String price;
  String image;
  String soldNumber;


  Product({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.soldNumber,
  });


  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'name': name,
      'price': price,
      'image': image,
      'soldNumber': soldNumber,
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
      soldNumber: map['soldNumber'],
    );
  }
}
