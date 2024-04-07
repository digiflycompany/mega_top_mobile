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
  final dynamic dateCompleted;
  final dynamic datePaid;
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
  final dynamic dateCompletedGmt;
  final dynamic datePaidGmt;
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
    required this.email,
    required this.phone,
  });
}
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
  final List<dynamic> taxes; // You might want to create a specific class for this if needed
  final List<dynamic> metaData; // Same as above
  final String sku;
  final int price;
  final Image image;
  final dynamic parentName;

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
}

class Image {
  final String id;
  final String src;

  Image({
    required this.id,
    required this.src,
  });
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
}

class Link {
  final String href;

  Link({
    required this.href,
  });
}
