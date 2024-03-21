import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/screen_margins.dart';
import '../constants/text_styles.dart';
import '../hive_services/card_details_service.dart';
import '../widgets/custom_button_styles.dart';
import '../widgets/custom_input_decoration.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  static String id = '/card-screen';

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Payment',
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: Container(
        margin: kMainPageMargin,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/png/Card 2.png',
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Card Holder\'s Name',
                style: kBoldBigBlackFontStyle,
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration:
                kCustomInputDecoration(hintText: 'Input your name here'),
                controller: _nameController,
              ),
              const SizedBox(height: 20.0),
              Text(
                'Card Number',
                style: kBoldBigBlackFontStyle,
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: kCustomInputDecoration(
                    hintText: 'Input your card number here'),
                controller: _numberController,
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expiry Date',
                          style: kBoldBigBlackFontStyle,
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          decoration: kCustomInputDecoration(
                              hintText: 'Input expiry date'),
                          controller: _expiryController,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CVV',
                          style: kBoldBigBlackFontStyle,
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          decoration: kCustomInputDecoration(hintText: 'CVV'),
                          controller: _cvvController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: kMainPageMargin,
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () async {
            CardDetailsService hiveService = CardDetailsService();
            SaveCardResult result = await hiveService.saveCardDetails(
              cardHolderName: _nameController.text,
              cardNumber: _numberController.text,
              expiryDate: _expiryController.text,
              cvv: _cvvController.text,
            );

            if (!result.success) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: Text(result.message),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Dismiss alert dialog
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              Navigator.of(context).pop(true); // Pass true to indicate success
            }
          },
          style: kAuthenticationButtonStyle,
          child: Text(
            'Add Card',
            style: kAuthenticationButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}
