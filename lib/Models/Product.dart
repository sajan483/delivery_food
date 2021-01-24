class ProductList {
  List<Product> product;
  ProductList({this.product});
  factory ProductList.fromJson(List<dynamic> json)=> ProductList(
    product: List<Product>.from(json.map((x)=> Product.fromJson(x))));
}

class Product {
  int id;
  String name;
  ProductType productType;
  int productCode;
  int quantity;
  int rating;
  double price;
  double netAmount;
  double grossAmount;
  double tax;
  double offer;
  String dateOrder;
  String datePatch;
  bool isReturned;
  bool isAvailable;
  String image;
  String thumbnail;
  int vendor;

  
  Product({
    this.id, 
    this.name, 
    this.productType,
    this.price, 
    this.dateOrder, 
    this.datePatch, 
    this.grossAmount, 
    this.image, 
    this.isAvailable, 
    this.isReturned, 
    this.netAmount, 
    this.offer, 
    this.productCode, 
    this.quantity, 
    this.rating, 
    this.tax, 
    this.thumbnail, 
    this.vendor
    });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    productType: json["product_type"],
    name: json["name"],
    price: json["price"],
    dateOrder: json["date_order"],
    productCode: json["product_code"],
    quantity: json["quantity"],
    rating: json["ratings"],
    netAmount: json["net_amout"],
    grossAmount: json["gross_amount"],
    tax: json["tax"],
    offer: json["offer"],
    datePatch: json["date_dispatch"],
    isReturned: json["is_returned"],
    isAvailable: json["is_available"],
    image: json["image"],
    thumbnail: json["thumbnail"],
    vendor: json["vendor_staff"],
  );
}

class  ProductType {
  int id;
  String title;
  String slug;
  String contextText;
  ProductType({this.id, this.title, this.slug, this.contextText});

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    contextText: json["context_text"] 
  );
}