import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_store/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // helper function to get full name
  String get fullName => "$firstName $lastName";

  // helper function to get formatted phone number
  String get formattedPhoneNo => AppFormater.formatPhoneNumber(phoneNumber);

  // helper function to generate username from the full name
  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  // static function for empty user model
  static UserModel empty() => UserModel(
        id: "",
        firstName: "",
        lastName: "",
        username: "",
        email: "",
        phoneNumber: "",
        profilePicture: "",
      );

  // helper function to convert user model to json to store in firebase
  Map<String, dynamic> toJson() => {
        'Id': id,
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
        'profilePicture': profilePicture,
      };

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? "",
        lastName: data['lastName'] ?? "",
        username: data['username'] ?? "",
        email: data['email'] ?? "",
        phoneNumber: data['phoneNumber'] ?? "",
        profilePicture: data['profilePicture'] ?? "",
      );
    }else {
      return UserModel.empty();
    }
  }
}
