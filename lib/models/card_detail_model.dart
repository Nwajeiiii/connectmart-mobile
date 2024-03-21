class CardDetail {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String cvv;

  CardDetail({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
  });

  Map<String, dynamic> toMap() {
    return {
      'cardHolderName': cardHolderName,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cvv': cvv,
    };
  }

  factory CardDetail.fromMap(Map<String, dynamic> map) {
    return CardDetail(
      cardHolderName: map['cardHolderName'],
      cardNumber: map['cardNumber'],
      expiryDate: map['expiryDate'],
      cvv: map['cvv'],
    );
  }

}
