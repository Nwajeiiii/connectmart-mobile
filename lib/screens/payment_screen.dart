import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/screen_margins.dart';
import '../hive_services/card_details_service.dart';
import '../models/card_detail_model.dart';
import 'card_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.cartName}) : super(key: key);

  final String cartName;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final CardDetailsService _cardDetailsService = CardDetailsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Methods',
          style: GoogleFonts.montserrat(),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: kMainPageMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Credit & Debit Cards',
              style: GoogleFonts.montserrat(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: FutureBuilder<List<CardDetail>>(
                future: _cardDetailsService.getAllCardDetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return Text("No cards added.", style: GoogleFonts.montserrat(),);
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        CardDetail card = snapshot.data![index];
                        return ListTile(
                          leading: const Icon(Icons.credit_card),
                          title: Text(card.cardHolderName),
                          onLongPress: () async {
                            await _cardDetailsService.deleteCardDetail(index);
                            // Refresh the UI by calling setState
                            setState(() {});
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.pushNamed(context, CardScreen.id);
                  // Check if the result is true, indicating a new card was added
                  if (result == true) {
                    setState(() {}); // Rebuild UI to reflect the new card
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                child: const Text(
                  'Add New Card',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
