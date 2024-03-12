
import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  List<ParcelModel> content;
  int totalElements;
  int page;
  int size;
  Summary summary;

  ResponseModel({
    required this.content,
    required this.totalElements,
    required this.page,
    required this.size,
    required this.summary,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    content: List<ParcelModel>.from(json["content"].map((x) => ParcelModel.fromJson(x))),
    totalElements: json["totalElements"],
    page: json["page"],
    size: json["size"],
    summary: Summary.fromJson(json["summary"]),
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
    "totalElements": totalElements,
    "page": page,
    "size": size,
    "summary": summary.toJson(),
  };
}

class ParcelModel {
  String status;
  List<dynamic> parcelGroupRecords;
  List<String> statusRecordList;
  int deliveryCharge;
  int returnCharge;
  double merchantAmount;
  double totalCharge;
  double codCharge;
  int collectedAmount;
  int fine;
  bool payable;
  String paymentStatus;
  bool editable;
  int stockPrice;
  bool partialDelivered;
  int previousPrice;
  bool receivedInHubManually;
  bool assignDeliverymanManually;
  int weightCharge;
  String id;
  String merchantOrderId;
  String recipientName;
  String recipientPhone;
  String recipientCity;
  String recipientArea;
  String recipientZone;
  String recipientAddress;
  int amountToCollect;
  String itemDescription;
  int itemQuantity;
  int itemWeight;
  String specialInstruction;
  String shopId;
  SellerModel seller;
  String cityType;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  String invoice;
  int v;
  String? operationSlot;
  String? deliveryFailedReasons;
  DateTime? returnedAt;
  String? transactionGroup;

  ParcelModel({
    required this.status,
    required this.parcelGroupRecords,
    required this.statusRecordList,
    required this.deliveryCharge,
    required this.returnCharge,
    required this.merchantAmount,
    required this.totalCharge,
    required this.codCharge,
    required this.collectedAmount,
    required this.fine,
    required this.payable,
    required this.paymentStatus,
    required this.editable,
    required this.stockPrice,
    required this.partialDelivered,
    required this.previousPrice,
    required this.receivedInHubManually,
    required this.assignDeliverymanManually,
    required this.weightCharge,
    required this.id,
    required this.merchantOrderId,
    required this.recipientName,
    required this.recipientPhone,
    required this.recipientCity,
    required this.recipientArea,
    required this.recipientZone,
    required this.recipientAddress,
    required this.amountToCollect,
    required this.itemDescription,
    required this.itemQuantity,
    required this.itemWeight,
    required this.specialInstruction,
    required this.shopId,
    required this.seller,
    required this.cityType,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.invoice,
    required this.v,
    this.operationSlot,
    this.deliveryFailedReasons,
    this.returnedAt,
    this.transactionGroup,
  });

  factory ParcelModel.fromJson(Map<String, dynamic> json) => ParcelModel(
    status: json["status"],
    parcelGroupRecords: List<dynamic>.from(json["parcelGroupRecords"].map((x) => x)),
    statusRecordList: List<String>.from(json["statusRecordList"].map((x) => x)),
    deliveryCharge: json["deliveryCharge"],
    returnCharge: json["returnCharge"],
    merchantAmount: json["merchantAmount"]?.toDouble(),
    totalCharge: json["totalCharge"]?.toDouble(),
    codCharge: json["CODCharge"]?.toDouble(),
    collectedAmount: json["collectedAmount"],
    fine: json["fine"],
    payable: json["payable"],
    paymentStatus: json["paymentStatus"],
    editable: json["editable"],
    stockPrice: json["stockPrice"],
    partialDelivered: json["partialDelivered"],
    previousPrice: json["previousPrice"],
    receivedInHubManually: json["receivedInHubManually"],
    assignDeliverymanManually: json["assignDeliverymanManually"],
    weightCharge: json["weightCharge"],
    id: json["_id"],
    merchantOrderId: json["merchantOrderId"],
    recipientName: json["recipientName"],
    recipientPhone: json["recipientPhone"],
    recipientCity: json["recipientCity"],
    recipientArea: json["recipientArea"],
    recipientZone: json["recipientZone"],
    recipientAddress: json["recipientAddress"],
    amountToCollect: json["amountToCollect"],
    itemDescription: json["itemDescription"],
    itemQuantity: json["itemQuantity"],
    itemWeight: json["itemWeight"],
    specialInstruction: json["specialInstruction"],
    shopId: json["shopId"],
    seller: SellerModel.fromJson(json["seller"]),
    cityType: json["cityType"],
    createdBy: json["createdBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    invoice: json["invoice"],
    v: json["__v"],
    operationSlot: json["operationSlot"],
    deliveryFailedReasons: json["deliveryFailedReasons"],
    returnedAt: json["returnedAt"] == null ? null : DateTime.parse(json["returnedAt"]),
    transactionGroup: json["transactionGroup"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "parcelGroupRecords": List<dynamic>.from(parcelGroupRecords.map((x) => x)),
    "statusRecordList": List<dynamic>.from(statusRecordList.map((x) => x)),
    "deliveryCharge": deliveryCharge,
    "returnCharge": returnCharge,
    "merchantAmount": merchantAmount,
    "totalCharge": totalCharge,
    "CODCharge": codCharge,
    "collectedAmount": collectedAmount,
    "fine": fine,
    "payable": payable,
    "paymentStatus": paymentStatus,
    "editable": editable,
    "stockPrice": stockPrice,
    "partialDelivered": partialDelivered,
    "previousPrice": previousPrice,
    "receivedInHubManually": receivedInHubManually,
    "assignDeliverymanManually": assignDeliverymanManually,
    "weightCharge": weightCharge,
    "_id": id,
    "merchantOrderId": merchantOrderId,
    "recipientName": recipientName,
    "recipientPhone": recipientPhone,
    "recipientCity": recipientCity,
    "recipientArea": recipientArea,
    "recipientZone": recipientZone,
    "recipientAddress": recipientAddress,
    "amountToCollect": amountToCollect,
    "itemDescription": itemDescription,
    "itemQuantity": itemQuantity,
    "itemWeight": itemWeight,
    "specialInstruction": specialInstruction,
    "shopId": shopId,
    "seller": seller.toJson(),
    "cityType": cityType,
    "createdBy": createdBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "invoice": invoice,
    "__v": v,
    "operationSlot": operationSlot,
    "deliveryFailedReasons": deliveryFailedReasons,
    "returnedAt": returnedAt?.toIso8601String(),
    "transactionGroup": transactionGroup,
  };
}

class SellerModel {
  List<dynamic> productCategories;
  bool emailVerified;
  bool verified;
  bool requestForVerification;
  bool showShopInHomepage;
  bool active;
  String id;
  String companyName;
  String phoneNumber1;
  String ownerName;
  String email;
  SubscriptionPlanModel subscriptionPlan;
  List<dynamic> warehouseAddressList;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String bankAccountHolderName;
  String bankAccountNumber;
  String bankBranchName;
  String bankName;
  String bankRoutingNumber;
  String bkash;
  String nagad;
  dynamic reasonOfRejection;
  String rocket;
  String streetAddress;

  SellerModel({
    required this.productCategories,
    required this.emailVerified,
    required this.verified,
    required this.requestForVerification,
    required this.showShopInHomepage,
    required this.active,
    required this.id,
    required this.companyName,
    required this.phoneNumber1,
    required this.ownerName,
    required this.email,
    required this.subscriptionPlan,
    required this.warehouseAddressList,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.bankAccountHolderName,
    required this.bankAccountNumber,
    required this.bankBranchName,
    required this.bankName,
    required this.bankRoutingNumber,
    required this.bkash,
    required this.nagad,
    required this.reasonOfRejection,
    required this.rocket,
    required this.streetAddress,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) => SellerModel(
    productCategories: List<dynamic>.from(json["productCategories"].map((x) => x)),
    emailVerified: json["emailVerified"],
    verified: json["verified"],
    requestForVerification: json["requestForVerification"],
    showShopInHomepage: json["showShopInHomepage"],
    active: json["active"],
    id: json["_id"],
    companyName: json["companyName"],
    phoneNumber1: json["phoneNumber1"],
    ownerName: json["ownerName"],
    email: json["email"],
    subscriptionPlan: SubscriptionPlanModel.fromJson(json["subscriptionPlan"]),
    warehouseAddressList: List<dynamic>.from(json["warehouseAddressList"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    bankAccountHolderName: json["bankAccountHolderName"],
    bankAccountNumber: json["bankAccountNumber"],
    bankBranchName: json["bankBranchName"],
    bankName: json["bankName"],
    bankRoutingNumber: json["bankRoutingNumber"],
    bkash: json["bkash"],
    nagad: json["nagad"],
    reasonOfRejection: json["reasonOfRejection"],
    rocket: json["rocket"],
    streetAddress: json["streetAddress"],
  );

  Map<String, dynamic> toJson() => {
    "productCategories": List<dynamic>.from(productCategories.map((x) => x)),
    "emailVerified": emailVerified,
    "verified": verified,
    "requestForVerification": requestForVerification,
    "showShopInHomepage": showShopInHomepage,
    "active": active,
    "_id": id,
    "companyName": companyName,
    "phoneNumber1": phoneNumber1,
    "ownerName": ownerName,
    "email": email,
    "subscriptionPlan": subscriptionPlan.toJson(),
    "warehouseAddressList": List<dynamic>.from(warehouseAddressList.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "bankAccountHolderName": bankAccountHolderName,
    "bankAccountNumber": bankAccountNumber,
    "bankBranchName": bankBranchName,
    "bankName": bankName,
    "bankRoutingNumber": bankRoutingNumber,
    "bkash": bkash,
    "nagad": nagad,
    "reasonOfRejection": reasonOfRejection,
    "rocket": rocket,
    "streetAddress": streetAddress,
  };
}

class SubscriptionPlanModel {
  bool subscriptionPlanDefault;
  String id;
  int insideCityMinPrice;
  int subCityMinPrice;
  int outsideCityMinPrice;
  int minWeightThreshold;
  int minWeightThresholdInsideCity;
  int minWeightThresholdSubCity;
  int minWeightThresholdOutsideCity;
  int insideCityMaxPrice;
  int subCityMaxPrice;
  int outsideCityMaxPrice;
  int maxWeightThreshold;
  int maxWeightThresholdInsideCity;
  int maxWeightThresholdSubCity;
  int maxWeightThresholdOutsideCity;
  int extraWeightUnit;
  int extraWeightUnitInsideCity;
  int extraWeightUnitSubCity;
  int extraWeightUnitOutsideCity;
  int pricePerExtraWeightUnitInsideCity;
  int pricePerExtraWeightUnitSubCity;
  int pricePerExtraWeightUnitOutsideCity;
  int codChargePercentage;
  int codChargePercentageInsideCity;
  int codChargePercentageSubCity;
  int codChargePercentageOutsideCity;
  int minReturnChargeInsideCity;
  int minReturnChargeSubCity;
  int minReturnChargeOutsideCity;

  SubscriptionPlanModel({
    required this.subscriptionPlanDefault,
    required this.id,
    required this.insideCityMinPrice,
    required this.subCityMinPrice,
    required this.outsideCityMinPrice,
    required this.minWeightThreshold,
    required this.minWeightThresholdInsideCity,
    required this.minWeightThresholdSubCity,
    required this.minWeightThresholdOutsideCity,
    required this.insideCityMaxPrice,
    required this.subCityMaxPrice,
    required this.outsideCityMaxPrice,
    required this.maxWeightThreshold,
    required this.maxWeightThresholdInsideCity,
    required this.maxWeightThresholdSubCity,
    required this.maxWeightThresholdOutsideCity,
    required this.extraWeightUnit,
    required this.extraWeightUnitInsideCity,
    required this.extraWeightUnitSubCity,
    required this.extraWeightUnitOutsideCity,
    required this.pricePerExtraWeightUnitInsideCity,
    required this.pricePerExtraWeightUnitSubCity,
    required this.pricePerExtraWeightUnitOutsideCity,
    required this.codChargePercentage,
    required this.codChargePercentageInsideCity,
    required this.codChargePercentageSubCity,
    required this.codChargePercentageOutsideCity,
    required this.minReturnChargeInsideCity,
    required this.minReturnChargeSubCity,
    required this.minReturnChargeOutsideCity,
  });

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) => SubscriptionPlanModel(
    subscriptionPlanDefault: json["default"],
    id: json["_id"],
    insideCityMinPrice: json["insideCityMinPrice"],
    subCityMinPrice: json["subCityMinPrice"],
    outsideCityMinPrice: json["outsideCityMinPrice"],
    minWeightThreshold: json["minWeightThreshold"],
    minWeightThresholdInsideCity: json["minWeightThresholdInsideCity"],
    minWeightThresholdSubCity: json["minWeightThresholdSubCity"],
    minWeightThresholdOutsideCity: json["minWeightThresholdOutsideCity"],
    insideCityMaxPrice: json["insideCityMaxPrice"],
    subCityMaxPrice: json["subCityMaxPrice"],
    outsideCityMaxPrice: json["outsideCityMaxPrice"],
    maxWeightThreshold: json["maxWeightThreshold"],
    maxWeightThresholdInsideCity: json["maxWeightThresholdInsideCity"],
    maxWeightThresholdSubCity: json["maxWeightThresholdSubCity"],
    maxWeightThresholdOutsideCity: json["maxWeightThresholdOutsideCity"],
    extraWeightUnit: json["extraWeightUnit"],
    extraWeightUnitInsideCity: json["extraWeightUnitInsideCity"],
    extraWeightUnitSubCity: json["extraWeightUnitSubCity"],
    extraWeightUnitOutsideCity: json["extraWeightUnitOutsideCity"],
    pricePerExtraWeightUnitInsideCity: json["pricePerExtraWeightUnitInsideCity"],
    pricePerExtraWeightUnitSubCity: json["pricePerExtraWeightUnitSubCity"],
    pricePerExtraWeightUnitOutsideCity: json["pricePerExtraWeightUnitOutsideCity"],
    codChargePercentage: json["CODChargePercentage"],
    codChargePercentageInsideCity: json["CODChargePercentageInsideCity"],
    codChargePercentageSubCity: json["CODChargePercentageSubCity"],
    codChargePercentageOutsideCity: json["CODChargePercentageOutsideCity"],
    minReturnChargeInsideCity: json["minReturnChargeInsideCity"],
    minReturnChargeSubCity: json["minReturnChargeSubCity"],
    minReturnChargeOutsideCity: json["minReturnChargeOutsideCity"],
  );

  Map<String, dynamic> toJson() => {
    "default": subscriptionPlanDefault,
    "_id": id,
    "insideCityMinPrice": insideCityMinPrice,
    "subCityMinPrice": subCityMinPrice,
    "outsideCityMinPrice": outsideCityMinPrice,
    "minWeightThreshold": minWeightThreshold,
    "minWeightThresholdInsideCity": minWeightThresholdInsideCity,
    "minWeightThresholdSubCity": minWeightThresholdSubCity,
    "minWeightThresholdOutsideCity": minWeightThresholdOutsideCity,
    "insideCityMaxPrice": insideCityMaxPrice,
    "subCityMaxPrice": subCityMaxPrice,
    "outsideCityMaxPrice": outsideCityMaxPrice,
    "maxWeightThreshold": maxWeightThreshold,
    "maxWeightThresholdInsideCity": maxWeightThresholdInsideCity,
    "maxWeightThresholdSubCity": maxWeightThresholdSubCity,
    "maxWeightThresholdOutsideCity": maxWeightThresholdOutsideCity,
    "extraWeightUnit": extraWeightUnit,
    "extraWeightUnitInsideCity": extraWeightUnitInsideCity,
    "extraWeightUnitSubCity": extraWeightUnitSubCity,
    "extraWeightUnitOutsideCity": extraWeightUnitOutsideCity,
    "pricePerExtraWeightUnitInsideCity": pricePerExtraWeightUnitInsideCity,
    "pricePerExtraWeightUnitSubCity": pricePerExtraWeightUnitSubCity,
    "pricePerExtraWeightUnitOutsideCity": pricePerExtraWeightUnitOutsideCity,
    "CODChargePercentage": codChargePercentage,
    "CODChargePercentageInsideCity": codChargePercentageInsideCity,
    "CODChargePercentageSubCity": codChargePercentageSubCity,
    "CODChargePercentageOutsideCity": codChargePercentageOutsideCity,
    "minReturnChargeInsideCity": minReturnChargeInsideCity,
    "minReturnChargeSubCity": minReturnChargeSubCity,
    "minReturnChargeOutsideCity": minReturnChargeOutsideCity,
  };
}

class Summary {
  double totalCharge;
  double merchantAmount;
  int amountToCollect;
  int collectedAmount;
  int deliveryCharge;
  double codCharge;
  int returnCharge;
  int fine;
  int stockPrice;
  int previousPrice;

  Summary({
    required this.totalCharge,
    required this.merchantAmount,
    required this.amountToCollect,
    required this.collectedAmount,
    required this.deliveryCharge,
    required this.codCharge,
    required this.returnCharge,
    required this.fine,
    required this.stockPrice,
    required this.previousPrice,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalCharge: json["totalCharge"]?.toDouble(),
    merchantAmount: json["merchantAmount"]?.toDouble(),
    amountToCollect: json["amountToCollect"],
    collectedAmount: json["collectedAmount"],
    deliveryCharge: json["deliveryCharge"],
    codCharge: json["CODCharge"]?.toDouble(),
    returnCharge: json["returnCharge"],
    fine: json["fine"],
    stockPrice: json["stockPrice"],
    previousPrice: json["previousPrice"],
  );

  Map<String, dynamic> toJson() => {
    "totalCharge": totalCharge,
    "merchantAmount": merchantAmount,
    "amountToCollect": amountToCollect,
    "collectedAmount": collectedAmount,
    "deliveryCharge": deliveryCharge,
    "CODCharge": codCharge,
    "returnCharge": returnCharge,
    "fine": fine,
    "stockPrice": stockPrice,
    "previousPrice": previousPrice,
  };
}
