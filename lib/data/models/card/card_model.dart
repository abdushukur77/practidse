class CardModel {
  final String uuid;
  final String cardName;
  final String expireDate;
  final String cardNumber;
  final String ownerName;
  final double amount;
  final String color;
  final String bankName;
  final String providerName;
  final bool isMain;

  CardModel({
    required this.color,
    required this.amount,
    required this.cardNumber,
    required this.expireDate,
    required this.bankName,
    required this.cardName,
    required this.isMain,
    required this.ownerName,
    required this.uuid,
    required this.providerName,
  });

  CardModel copyWith({
    String? uuid,
    String? cardName,
    String? expireDate,
    String? cardNumber,
    String? ownerName,
    double? amount,
    String? color,
    String? bankName,
    String? providerName,
    bool? isMain,
  }) {
    return CardModel(
      color: uuid ?? this.uuid,
      amount: amount ?? this.amount,
      cardNumber: cardNumber ?? this.cardNumber,
      expireDate: expireDate ?? this.expireDate,
      bankName: bankName ?? this.bankName,
      cardName: cardName ?? this.cardName,
      isMain: isMain ?? this.isMain,
      ownerName: ownerName ?? this.ownerName,
      uuid: uuid ?? this.uuid,
      providerName: providerName ?? this.providerName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "color": color,
      "amount": amount,
      "card_number": cardNumber,
      "expire_date": expireDate,
      "bank_name": bankName,
      "card_name": cardName,
      "is_main": isMain,
      "owner_name": ownerName,
      "provider_name": providerName,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "color": color,
      "_uuid": uuid,
      "amount": amount,
      "card_number": cardNumber,
      "expire_date": expireDate,
      "bank_name": bankName,
      "card_name": cardName,
      "is_main": isMain,
      "owner_name": ownerName,
      "provider_name": providerName,
    };
  }

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      uuid: json["_uuid"] as String? ?? "",
      color: json["color"] as String? ?? "",
      amount: (json["amount"] as num? ?? 0.0).toDouble(),
      cardNumber: json["card_number"] as String? ?? "",
      expireDate: json["expire_date"] as String? ?? "",
      bankName: json["ban_name"] as String? ?? "",
      cardName: json["card_name"] as String? ?? "",
      isMain: json["is_main"] as bool? ?? false,
      ownerName: json["owner_name"] as String? ?? "",
      providerName: json["provider_name"] as String? ?? "",
    );
  }

  static initial() => CardModel(
        color: "",
        amount: 0.0,
        cardNumber: "",
        expireDate: "",
        bankName: "",
        cardName: "",
        isMain: false,
        ownerName: "",
        uuid: "",
        providerName: "",
      );
}