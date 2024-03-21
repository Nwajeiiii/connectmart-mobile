import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/screen_margins.dart';
import '../constants/text_styles.dart';
import '../hive_services/address_details_service.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../widgets/custom_button_styles.dart';
import '../widgets/custom_input_decoration.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  static String id = '/edit-profile';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final AddressDetailsService _hiveService = AddressDetailsService();

  @override
  void initState() {
    super.initState();
    _loadAddressDetails();
    _loadUserData();
  }

  Future<void> _loadAddressDetails() async {
    final details = await _hiveService.getAddressDetails();
    _houseAddressTextFieldController.text = details['houseAddress']!;
    _cityTextFieldController.text = details['city']!;
    _stateTextFieldController.text = details['state']!;
    _postalCodeFieldController.text = details['postalCode']!;
    print('Loaded existing address details into fields');
  }

  bool _isPasswordVisible = false;

  final _emailTextFieldController = TextEditingController(text: "MY EMAIL");
  final _passwordTextFieldController =
      TextEditingController(text: "MY PASSWORD");
  final _houseAddressTextFieldController = TextEditingController();
  final _cityTextFieldController = TextEditingController();
  final _stateTextFieldController = TextEditingController();
  final _postalCodeFieldController = TextEditingController();

  togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
  Future<void> _saveAddressDetails() async {
    bool success = await _hiveService.saveAddressDetails(
      houseAddress: _houseAddressTextFieldController.text,
      city: _cityTextFieldController.text,
      state: _stateTextFieldController.text,
      postalCode: _postalCodeFieldController.text,
    );

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(success ? 'Success' : 'Failure'),
        content: Text(success ? 'Your address has been successfully saved.' : 'Failed to save your address. Please try again.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _loadUserData() async {
    // Access the UserProvider to get the user data
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final UserModel? userDetails = await userProvider.getUserFromLocal();

    // Check if userDetails is not null
    if (userDetails != null) {
      setState(() {
        _emailTextFieldController.text = userDetails.email;
        // Assuming you've decided to store and then set the password, which is generally not recommended for security reasons
        _passwordTextFieldController.text = userDetails.password;
      });
    }

    // You can separately fetch and setState for address details if stored differently
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: GoogleFonts.montserrat()),
        centerTitle: true,
      ),
      body: Container(
        margin: kMainPageMargin,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal Details',
                style: kBoldLargeBlackFontStyle,
              ),
              const SizedBox(height: 30),
              Text(
                'Email Address',
                style: kW400SmallBlackFontStyle,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: kCustomPersonalDetailsUnmodifiableDecoration(),
                controller: _emailTextFieldController,
                readOnly: true,
              ),
              const SizedBox(height: 20),
              Text(
                'Password',
                style: kW400SmallBlackFontStyle,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordTextFieldController,
                obscureText: !_isPasswordVisible,
                decoration: kCustomPasswordInputDecoration(
                  hintText: 'Enter your password',
                  isPasswordVisible: _isPasswordVisible,
                  togglePasswordVisibility: togglePasswordVisibility,
                ),
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Change Password',
                        style: kAuthenticationTextStyle,
                      ))
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(height: 20),
              Text(
                'Business Address Details',
                style: kBoldLargeBlackFontStyle,
              ),
              const SizedBox(height: 30),
              Text(
                'House Address',
                style: kW400SmallBlackFontStyle,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _houseAddressTextFieldController,
                decoration: kCustomInputDecoration(
                  hintText: 'Enter your house address',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'City',
                style: kW400SmallBlackFontStyle,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _cityTextFieldController,
                decoration: kCustomInputDecoration(
                  hintText: 'Enter your city',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'State',
                style: kW400SmallBlackFontStyle,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: kCustomInputDecoration(
                  hintText: 'Enter your state',
                ),
                controller: _stateTextFieldController,
              ),
              const SizedBox(height: 20),
              Text(
                'Postal Code',
                style: kW400SmallBlackFontStyle,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: kCustomInputDecoration(
                  hintText: 'Enter your decoration',
                ),
                controller: _postalCodeFieldController,
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: kMainPageMargin,
        color: Colors.white,
        child: ElevatedButton(
          style: kAuthenticationButtonStyle,
          onPressed: _saveAddressDetails,
          child: Text(
            'Save Address',
            style: kAuthenticationButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

