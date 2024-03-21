import 'package:hive/hive.dart';
import '../models/card_detail_model.dart'; // Ensure this is correctly imported

class SaveCardResult {
  final bool success;
  final String message;

  SaveCardResult(this.success, this.message);
}

class CardDetailsService {
  final String _boxName = 'cardDetails';

  Future<SaveCardResult> saveCardDetails({
    required String cardHolderName,
    required String cardNumber,
    required String expiryDate,
    required String cvv,
  }) async {
    if (cardHolderName.isEmpty || cardNumber.isEmpty || expiryDate.isEmpty || cvv.isEmpty) {
      return SaveCardResult(false, 'Some fields are empty or null.');
    }

    var box = await Hive.openBox(_boxName);

    for (int i = 0; i < box.length; i++) {
      // Cast the result of box.getAt(i) to Map<String, dynamic>
      var existingCardDetailMap = box.getAt(i) as Map<dynamic, dynamic>;
      var existingCardDetail = CardDetail.fromMap(existingCardDetailMap.cast<String, dynamic>());

      if (existingCardDetail.cardNumber == cardNumber ||
          existingCardDetail.cardHolderName == cardHolderName ||
          existingCardDetail.cvv == cvv) {
        return SaveCardResult(false, 'Duplicate card details found.');
      }
    }

    final cardDetail = CardDetail(
      cardHolderName: cardHolderName,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cvv: cvv,
    );

    await box.add(cardDetail.toMap());
    return SaveCardResult(true, 'Card details saved successfully');
  }

  Future<List<CardDetail>> getAllCardDetails() async {
    var box = await Hive.openBox(_boxName);
    List<CardDetail> cardDetails = [];

    for (int i = 0; i < box.length; i++) {
      var raw = box.getAt(i);
      if (raw is Map<dynamic, dynamic>) {
        // Explicitly cast the map to Map<String, dynamic>
        var castedMap = raw.cast<String, dynamic>();
        cardDetails.add(CardDetail.fromMap(castedMap));
      }
    }

    return cardDetails;
  }

  Future<void> deleteCardDetail(int index) async {
    var box = await Hive.openBox(_boxName);
    await box.deleteAt(index); // Deletes the card detail at the specified index
    print('Card detail deleted successfully');
  }

}
