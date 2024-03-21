// import 'package:hive/hive.dart';
//
// class AddressDetailsService {
//   static const String _boxName = "businessAddressDetails";
//
//   Future<Box> _openBox() async {
//     var box = await Hive.openBox(_boxName);
//     print('Hive box opened');
//     return box;
//   }
//
//   Future<void> saveAddressDetails({
//     required String houseAddress,
//     required String city,
//     required String state,
//     required String postalCode,
//   }) async {
//     final box = await _openBox();
//     await box.put('houseAddress', houseAddress);
//     await box.put('city', city);
//     await box.put('state', state);
//     await box.put('postalCode', postalCode);
//     print('Address details saved');
//   }
//
//   Future<Map<String, String>> getAddressDetails() async {
//     final box = await _openBox();
//     final Map<String, String> details = {
//       'houseAddress': box.get('houseAddress', defaultValue: ''),
//       'city': box.get('city', defaultValue: ''),
//       'state': box.get('state', defaultValue: ''),
//       'postalCode': box.get('postalCode', defaultValue: ''),
//     };
//     print('Address details retrieved');
//     return details;
//   }
// }

import 'package:hive/hive.dart';

class AddressDetailsService {
  static const String _boxName = "businessAddressDetails";

  Future<Box> _openBox() async {
    var box = await Hive.openBox(_boxName);
    print('Hive box opened');
    return box;
  }

  Future<bool> saveAddressDetails({
    required String houseAddress,
    required String city,
    required String state,
    required String postalCode,
  }) async {
    try {
      final box = await _openBox();
      await box.put('houseAddress', houseAddress);
      await box.put('city', city);
      await box.put('state', state);
      await box.put('postalCode', postalCode);
      print('Address details saved');
      return true; // Success
    } catch (e) {
      print('Error saving address details: $e');
      return false; // Failure
    }
  }

  Future<Map<String, String>> getAddressDetails() async {
    final box = await _openBox();
    final Map<String, String> details = {
      'houseAddress': box.get('houseAddress', defaultValue: ''),
      'city': box.get('city', defaultValue: ''),
      'state': box.get('state', defaultValue: ''),
      'postalCode': box.get('postalCode', defaultValue: ''),
    };
    print('Address details retrieved');
    return details;
  }
}
