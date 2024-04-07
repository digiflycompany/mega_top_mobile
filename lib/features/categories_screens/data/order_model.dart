
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
  final Billing billing;
  final Shipping shipping;
  final String paymentMethod;
  final String paymentMethodTitle;
  final String transactionId;
  final String customerIpAddress;
  final String customerUserAgent;
  final String createdVia;
  final String customerNote;
  final dynamic dateCompleted; // Could be String or null
  final dynamic datePaid; // Could be String or null
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
  final dynamic dateCompletedGmt; // Could be String or null
  final dynamic datePaidGmt; // Could be String or null
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

  factory Order.fromJson(Map<String, dynamic> json) => Order(
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

  Map<String, dynamic> toJson() => {
    'id': id,
    'parent_id': parentId,
    'status': status,
    'currency': currency,
    'version': version,
    'prices_include_tax': pricesIncludeTax,
    'date_created': dateCreated,
    'date_modified': dateModified,
    'discount_total': discountTotal,
    'discount_tax': discountTax,
    'shipping_total': shippingTotal,
    'shipping_tax': shippingTax,
    'cart_tax': cartTax,
    'total': total,
    'total_tax': totalTax,
    'customer_id': customerId,
    'order_key': orderKey,
    'billing': billing.toJson(),
    'shipping': shipping.toJson(),
    'payment_method': paymentMethod,
    'payment_method_title': paymentMethodTitle,
    'transaction_id': transactionId,
    'customer_ip_address': customerIpAddress,
    'customer_user_agent': customerUserAgent,
    'created_via': createdVia,
    'customer_note': customerNote,
    'date_completed': dateCompleted,
    'date_paid': datePaid,
    'cart_hash': cartHash,
    'number': number,
    'meta_data': metaData.map((e) => e.toJson()).toList(),
    'line_items': lineItems.map((e) => e.toJson()).toList(),
    'payment_url': paymentUrl,
    'is_editable': isEditable,
    'needs_payment': needsPayment,
    'needs_processing': needsProcessing,
    'date_created_gmt': dateCreatedGmt,
    'date_modified_gmt': dateModifiedGmt,
    'date_completed_gmt': dateCompletedGmt,
    'date_paid_gmt': datePaidGmt,
    'currency_symbol': currencySymbol,
    '_links': links.toJson(),
  };
}

class BillingShipping {
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

  BillingShipping({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    this.email = '',
    this.phone = '',
  });

  factory BillingShipping.fromJson(Map<String, dynamic> json) => BillingShipping(
    firstName: json['first_name'],
    lastName: json['last_name'],
    company: json['company'],
    address1: json['address_1'],
    address2: json['address_2'],
    city: json['city'],
    state: json['state'],
    postcode: json['postcode'],
    country: json['country'],
    email: json['email'] ?? '',
    phone: json['phone'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'company': company,
    'address_1': address1,
    'address_2': address2,
    'city': city,
    'state': state,
    'postcode': postcode,
    'country': country,
    'email': email,
    'phone': phone,
  };
}

// Alias Billing and Shipping to use the same structure since they share the same fields
typedef Billing = BillingShipping;
typedef Shipping = BillingShipping;

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

  Map<String, dynamic> toJson() => {
    'id': id,
    'key': key,
    'value': value,
  };
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
      self: _convertLinks(json['self']),
      collection: _convertLinks(json['collection']),
      customer: _convertLinks(json['customer']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'self': self.map((link) => link.toJson()).toList(),
      'collection': collection.map((link) => link.toJson()).toList(),
      'customer': customer.map((link) => link.toJson()).toList(),
    };
  }

  static List<Link> _convertLinks(dynamic json) {
    if (json != null && json is List) {
      return json.map<Link>((item) => Link.fromJson(item)).toList();
    } else {
      return [];
    }
  }
}


class Link {
  final String href;

  Link({required this.href});

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      href: json['href'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
    };
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
  final List<dynamic> taxes; // Consider creating a class for taxes if the structure is known
  final List<dynamic> metaData; // Consider creating a class for metaData items if the structure is known
  final String sku;
  final int price;
  final Image image;
  final dynamic parentName; // Could be null, hence dynamic

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

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'product_id': productId,
    'variation_id': variationId,
    'quantity': quantity,
    'tax_class': taxClass,
    'subtotal': subtotal,
    'subtotal_tax': subtotalTax,
    'total': total,
    'total_tax': totalTax,
    'taxes': taxes, // You may need to map each element to toJson if a class is made
    'meta_data': metaData, // Same as above
    'sku': sku,
    'price': price,
    'image': image.toJson(),
    'parent_name': parentName,
  };
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

  Map<String, dynamic> toJson() => {
    'id': id,
    'src': src,
  };
}


// Include definitions for Image, Links, Link classes with their fromJson and toJson methods
// Due to space constraints, these are omitted here but should follow the same pattern as above

