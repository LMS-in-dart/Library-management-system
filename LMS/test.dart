import 'dart:io';

void main(List<String> args) {
  print("Enter your name and email and password and phone number");
  String name, email, password, phoneNumber;

  List <Map<String, dynamic>> librarian = [];

    for (int i = 0; i < 1; i++) 
    {
      name = stdin.readLineSync()!;
      email = stdin.readLineSync()!;
      password = stdin.readLineSync()!;
      phoneNumber = stdin.readLineSync()!;

      librarian.add({'name': name, 'email': email, 'phoneNumber': phoneNumber, 'password': password});

      print(librarian[i]['name']);
    }
    print(librarian);
}