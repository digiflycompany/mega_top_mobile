
class OrderList {
  final List<MyOrder> orders;

  OrderList({required this.orders});

  factory OrderList.fromJson(List<dynamic> parsedJson) {
    List<MyOrder> orders = parsedJson.map((i) => MyOrder.fromJson(i)).toList();
    return OrderList(orders: orders);
  }
}

class productModel {
  late int id;
  late String name;
  late String price;
  late bool wishlist;
  List<Images> images = [];
  List<Categories> categories = [];

  productModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    wishlist = json["wishlist"];
    json["images"].forEach((element) {
      images.add(Images.fromJson(element));
    });
    json["categories"].forEach((element) {
      categories.add(Categories.fromJson(element));
    });
  }
}

class Images {
  late int id;
  late String src;

  Images.fromJson(json) {
    id = json["id"];
    src = json["src"];
  }
}

class Categories {
  late int id;
  late String name;

  Categories.fromJson(json) {
    id = json["id"];
    name = json["name"];
  }
}

class MyOrder {
  final int id;
  final int parentId;
  final String status;
  final String currency;
  final String version;
  final bool pricesIncludeTax;
  final String dateCreated;
  final String dateModified;
  final String discountTotal;
  final String discountTax;
  final String shippingTotal;
  final String shippingTax;
  final String cartTax;
  final String total;
  final String totalTax;
  final int customerId;
  final String orderKey;
  final Billing billing;
  final Shipping shipping;
  final String paymentMethod;
  final String paymentMethodTitle;
  final String transactionId;
  final String customerIpAddress;
  final String customerUserAgent;
  final String createdVia;
  final String customerNote;
  final dynamic dateCompleted; // Could be null
  final dynamic datePaid; // Could be null
  final String cartHash;
  final String number;
  final List<MetaData> metaData;
  final List<LineItem> lineItems;
  final String paymentUrl;
  final bool isEditable;
  final bool needsPayment;
  final bool needsProcessing;
  final String dateCreatedGmt;
  final String dateModifiedGmt;
  final dynamic dateCompletedGmt; // Could be null
  final dynamic datePaidGmt; // Could be null
  final String currencySymbol;
  final Links links;

  MyOrder({
    required this.id,
    required this.parentId,
    required this.status,
    required this.currency,
    required this.version,
    required this.pricesIncludeTax,
    required this.dateCreated,
    required this.dateModified,
    required this.discountTotal,
    required this.discountTax,
    required this.shippingTotal,
    required this.shippingTax,
    required this.cartTax,
    required this.total,
    required this.totalTax,
    required this.customerId,
    required this.orderKey,
    required this.billing,
    required this.shipping,
    required this.paymentMethod,
    required this.paymentMethodTitle,
    required this.transactionId,
    required this.customerIpAddress,
    required this.customerUserAgent,
    required this.createdVia,
    required this.customerNote,
    this.dateCompleted,
    this.datePaid,
    required this.cartHash,
    required this.number,
    required this.metaData,
    required this.lineItems,
    required this.paymentUrl,
    required this.isEditable,
    required this.needsPayment,
    required this.needsProcessing,
    required this.dateCreatedGmt,
    required this.dateModifiedGmt,
    this.dateCompletedGmt,
    this.datePaidGmt,
    required this.currencySymbol,
    required this.links,
  });

  factory MyOrder.fromJson(Map<String, dynamic> json) => MyOrder(
    id: json['id'],
    parentId: json['parent_id'],
    status: json['status'],
    currency: json['currency'],
    version: json['version'],
    pricesIncludeTax: json['prices_include_tax'],
    dateCreated: json['date_created'],
    dateModified: json['date_modified'],
    discountTotal: json['discount_total'],
    discountTax: json['discount_tax'],
    shippingTotal: json['shipping_total'],
    shippingTax: json['shipping_tax'],
    cartTax: json['cart_tax'],
    total: json['total'],
    totalTax: json['total_tax'],
    customerId: json['customer_id'],
    orderKey: json['order_key'],
    billing: Billing.fromJson(json['billing']),
    shipping: Shipping.fromJson(json['shipping']),
    paymentMethod: json['payment_method'],
    paymentMethodTitle: json['payment_method_title'],
    transactionId: json['transaction_id'],
    customerIpAddress: json['customer_ip_address'],
    customerUserAgent: json['customer_user_agent'],
    createdVia: json['created_via'],
    customerNote: json['customer_note'],
    dateCompleted: json['date_completed'],
    datePaid: json['date_paid'],
    cartHash: json['cart_hash'],
    number: json['number'],
    metaData: List<MetaData>.from(json['meta_data'].map((x) => MetaData.fromJson(x))),
    lineItems: List<LineItem>.from(json['line_items'].map((x) => LineItem.fromJson(x))),
    paymentUrl: json['payment_url'],
    isEditable: json['is_editable'],
    needsPayment: json['needs_payment'],
    needsProcessing: json['needs_processing'],
    dateCreatedGmt: json['date_created_gmt'],
    dateModifiedGmt: json['date_modified_gmt'],
    dateCompletedGmt: json['date_completed_gmt'],
    datePaidGmt: json['date_paid_gmt'],
    currencySymbol: json['currency_symbol'],
    links: Links.fromJson(json['_links']),
  );
}

class Billing {
  final String firstName;
  final String lastName;
  final String company;
  final String address1;
  final String address2;
  final String city;
  final String state;
  final String postcode;
  final String country;
  final String email;
  final String phone;

  Billing({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    required this.email,
    required this.phone,
  });

  factory Billing.fromJson(Map<String, dynamic> json) => Billing(
    firstName: json['first_name'],
    lastName: json['last_name'],
    company: json['company'],
    address1: json['address_1'],
    address2: json['address_2'],
    city: json['city'],
    state: json['state'],
    postcode: json['postcode'],
    country: json['country'],
    email: json['email'],
    phone: json['phone'],
  );
}

class Shipping {
  // Same properties as Billing
  final String firstName;
  final String lastName;
  final String company;
  final String address1;
  final String address2;
  final String city;
  final String state;
  final String postcode;
  final String country;
  final String phone;

  Shipping({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    required this.phone,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
    firstName: json['first_name'],
    lastName: json['last_name'],
    company: json['company'],
    address1: json['address_1'],
    address2: json['address_2'],
    city: json['city'],
    state: json['state'],
    postcode: json['postcode'],
    country: json['country'],
    phone: json['phone'],
  );
}

class MetaData {
  final int id;
  final String key;
  final String value;

  MetaData({
    required this.id,
    required this.key,
    required this.value,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    id: json['id'],
    key: json['key'],
    value: json['value'],
  );
}

class LineItem {
  final int id;
  final String name;
  final int productId;
  final int variationId;
  final int quantity;
  final String taxClass;
  final String subtotal;
  final String subtotalTax;
  final String total;
  final String totalTax;
  final List<dynamic> taxes;
  final List<dynamic> metaData;
  final String sku;
  final int price;
  final Image image;
  final dynamic parentName; // Can be null

  LineItem({
    required this.id,
    required this.name,
    required this.productId,
    required this.variationId,
    required this.quantity,
    required this.taxClass,
    required this.subtotal,
    required this.subtotalTax,
    required this.total,
    required this.totalTax,
    required this.taxes,
    required this.metaData,
    required this.sku,
    required this.price,
    required this.image,
    this.parentName,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
    id: json['id'],
    name: json['name'],
    productId: json['product_id'],
    variationId: json['variation_id'],
    quantity: json['quantity'],
    taxClass: json['tax_class'],
    subtotal: json['subtotal'],
    subtotalTax: json['subtotal_tax'],
    total: json['total'],
    totalTax: json['total_tax'],
    taxes: json['taxes'] ?? [],
    metaData: json['meta_data'] ?? [],
    sku: json['sku'],
    price: json['price'],
    image: Image.fromJson(json['image']),
    parentName: json['parent_name'],
  );
}

class Image {
  final String id;
  final String src;

  Image({
    required this.id,
    required this.src,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json['id'],
    src: json['src'],
  );
}

class Links {
  final List<Link> self;
  final List<Link> collection;
  final List<Link> customer;

  Links({
    required this.self,
    required this.collection,
    required this.customer,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Link>.from(json['self'].map((x) => Link.fromJson(x))),
    collection: List<Link>.from(json['collection'].map((x) => Link.fromJson(x))),
    customer: List<Link>.from(json['customer'].map((x) => Link.fromJson(x))),
  );
}

class Link {
  final String href;

  Link({required this.href});

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    href: json['href'],
  );
}
