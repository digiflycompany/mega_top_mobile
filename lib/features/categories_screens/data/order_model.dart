class Order {
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
  final Billing shipping;
  final Billing billing;
  final String paymentMethod;
  final String paymentMethodTitle;
  final String transactionId;
  final String customerIpAddress;
  final String customerUserAgent;
  final String createdVia;
  final String customerNote;
  final String? dateCompleted;
  final String? datePaid;
  final String cartHash;
  final String number;
  final List<MetaData> metaData;
  final List<LineItem> lineItems;
  final List<dynamic> taxLines;
  final List<dynamic> shippingLines;
  final List<dynamic> feeLines;
  final List<dynamic> couponLines;
  final List<dynamic> refunds;
  final String paymentUrl;
  final bool isEditable;
  final bool needsPayment;
  final bool needsProcessing;
  final String dateCreatedGmt;
  final String dateModifiedGmt;
  final String? dateCompletedGmt;
  final String? datePaidGmt;
  final String currencySymbol;
  final Links links;

  Order({
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
    required this.taxLines,
    required this.shippingLines,
    required this.feeLines,
    required this.couponLines,
    required this.refunds,
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
  factory Order.fromJson(Map<String, dynamic> json) {
  return Order(
  id: json['id'] as int,
  parentId: json['parent_id'] as int,
  status: json['status'] as String,
  currency: json['currency'] as String,
  version: json['version'] as String,
  pricesIncludeTax: json['prices_include_tax'] as bool,
  dateCreated: json['date_created'] as String,
  dateModified: json['date_modified'] as String,
  discountTotal: json['discount_total'] as String,
  discountTax: json['discount_tax'] as String,
  shippingTotal: json['shipping_total'] as String,
  shippingTax: json['shipping_tax'] as String,
  cartTax: json['cart_tax'] as String,
  total: json['total'] as String,
  totalTax: json['total_tax'] as String,
  customerId: json['customer_id'] as int,
  orderKey: json['order_key'] as String,
  billing: Billing.fromJson(json['billing']),
  shipping: Billing.fromJson(json['shipping']), // Using the same Billing class for simplicity
  paymentMethod: json['payment_method'] as String,
  paymentMethodTitle: json['payment_method_title'] as String,
  transactionId: json['transaction_id'] as String,
  customerIpAddress: json['customer_ip_address'] as String,
  customerUserAgent: json['customer_user_agent'] as String,
  createdVia: json['created_via'] as String,
  customerNote: json['customer_note'] as String,
  dateCompleted: json['date_completed'],
  datePaid: json['date_paid'],
  cartHash: json['cart_hash'] as String,
  number: json['number'] as String,
  metaData: List<MetaData>.from(json['meta_data'].map((x) => MetaData.fromJson(x))),
  lineItems: List<LineItem>.from(json['line_items'].map((x) => LineItem.fromJson(x))),
  taxLines: json['tax_lines'] as List<dynamic>,
  shippingLines: json['shipping_lines'] as List<dynamic>,
  feeLines: json['fee_lines'] as List<dynamic>,
  couponLines: json['coupon_lines'] as List<dynamic>,
  refunds: json['refunds'] as List<dynamic>,
  paymentUrl: json['payment_url'] as String,
  isEditable: json['is_editable'] as bool,
  needsPayment: json['needs_payment'] as bool,
  needsProcessing: json['needs_processing'] as bool,
  dateCreatedGmt: json['date_created_gmt'] as String,
  dateModifiedGmt: json['date_modified_gmt'] as String,
  dateCompletedGmt: json['date_completed_gmt'],
  datePaidGmt: json['date_paid_gmt'],
  currencySymbol: json['currency_symbol'] as String,
  links: Links.fromJson(json['_links']),
  );
  }
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
  factory Billing.fromJson(Map<String, dynamic> json) {
    return Billing(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      company: json['company'] as String,
      address1: json['address_1'] as String,
      address2: json['address_2'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      postcode: json['postcode'] as String,
      country: json['country'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }
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
  final List<MetaData> metaData;
  final String sku;
  final int price;
  final ProductImage image;
  final String? parentName;

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
  factory LineItem.fromJson(Map<String, dynamic> json) {
    return LineItem(
      id: json['id'] as int,
      name: json['name'] as String,
      productId: json['product_id'] as int,
      variationId: json['variation_id'] as int,
      quantity: json['quantity'] as int,
      taxClass: json['tax_class'] as String,
      subtotal: json['subtotal'] as String,
      subtotalTax: json['subtotal_tax'] as String,
      total: json['total'] as String,
      totalTax: json['total_tax'] as String,
      taxes: json['taxes'] as List<dynamic>,
      metaData: List<MetaData>.from(json['meta_data'].map((x) => MetaData.fromJson(x))),
      sku: json['sku'] as String,
      price: json['price'] as int,
      image: ProductImage.fromJson(json['image']),
      parentName: json['parent_name'] as String?,
    );
  }
}

class MetaData {
  final int id;
  final String key;
  final dynamic value;

  MetaData({
    required this.id,
    required this.key,
    required this.value,
  });
  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      id: json['id'] as int,
      key: json['key'] as String,
      value: json['value'],
    );
  }
}

class ProductImage {
  final String id;
  final String src;

  ProductImage({
    required this.id,
    required this.src,
  });
  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'].toString(),
      src: json['src'] as String,
    );
  }
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
  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: (json['self'] as List<dynamic>).map((e) => Link.fromJson(e)).toList(),
      collection: (json['collection'] as List<dynamic>).map((e) => Link.fromJson(e)).toList(),
      customer: (json['customer'] as List<dynamic>).map((e) => Link.fromJson(e)).toList(),
    );
  }
}

class Link {
  final String href;

  Link({required this.href});
  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      href: json['href'] as String,
    );
  }
}
