class UserModel {
  final String userId;
  final String userType;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  UserModel({
    required this.userId,
    required this.userType,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] ?? 'N/A', // Default value if null
      userType: json['userType'] ?? 'N/A', // Default value if null
      firstName: json['firstName'] ?? 'N/A', // Default value if null
      lastName: json['lastName'] ?? 'N/A', // Default value if null
      email: json['email'] ?? 'N/A', // Default value if null
      phoneNumber: json['phoneNumber'] ?? 'N/A', // Default value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userType': userType,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
