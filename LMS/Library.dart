import 'Member.dart';
import 'dart:io';
import 'data.dart';


main() 
{
  int choice;
  if ((choice = showMenu()) == 5)
  print("Goodbye");


    switch (choice)
    {
    
    case 1: login(); break;

    case 2: register(); break;

    case 3: search ();
    
    case 0:
    exit(0);
      
    default:
    print("Invalid choice. Please try again.");
    }    


  if (choice != 5)
  main();
}

class SherchBook
{
  void printMap ()
  {
    for (var element in userData)
    {
      // print the books name
      print(element['name']);
    }
  }
}

  int showMenu () {
    print("╔══════════════════════════════════╗");
    print("║    LIBRARY MANAGEMENT SYSTEM     ║");
    print("╠══════════════════════════════════╣");
    print("║ 1. Login                         ║");
    print("║ 2. Register                      ║");
    print("║ 3. Search Books                  ║");
    print("║ 0. Exit                          ║");
    print("╚══════════════════════════════════╝");  

    print("Enter your choice: ");
    int choice;
    choice = int.parse(stdin.readLineSync()!);
    return choice;
}

  void login() {
  print("Enter your username");
  String username = stdin.readLineSync()!;
  print("Enter your password");
  String password = stdin.readLineSync()!;
  user.login(username, password);
}

void register() {
  print("Enter your username");
  String username = stdin.readLineSync()!;
  print("Enter your password");
  String password = stdin.readLineSync()!;
  print("Enter your email");
  String email = stdin.readLineSync()!;
  print("Enter your phone number");
  String phone = stdin.readLineSync()!;
  user.register(username, password, email, phone);
}


void search () {
  
  print("╔══════════════════════════════════╗");
  print("║          Search Options          ║");
  print("╠══════════════════════════════════╣");
  print("║ 1. By Title                      ║");
  print("║ 2. By Author                     ║");
  print("║ 3. By Publisher                  ║");
  print("║ 4. By Classification             ║");
  print("║ 5. By Year                       ║");
  print("╚══════════════════════════════════╝");
  int searchNumber = int.parse(stdin.readLineSync()!);

  
  if (searchNumber == 1)      print("Enter the name of the book you want to search for:");
  else if (searchNumber == 2) print("Enter the name of the author you want to search for:");
  else if (searchNumber == 3) print("Enter the name of the publisher you want to search for:");
  else if (searchNumber == 4) print("Enter the name of the classification you want to search for:");
  else if (searchNumber == 5) print("Enter the name of the year you want to search for:");

  String searchWord = stdin.readLineSync()!;
  librarian.searchAny(searchWord.toLowerCase(), searchNumber);
  print("Are you done? (yes/no)");
    String done = stdin.readLineSync()!;
    done.toLowerCase();

    while ( done == "yes") {
    print("Goodbye from sherch book");
    showMenu();
    break;
    }
    while ( done == "no") {
    print("Enter the name of the book you want to search for:");
    search();
    break;
    }
}

void searchAdmin () {
  
  print("╔══════════════════════════════════╗");
  print("║          Search Options          ║");
  print("╠══════════════════════════════════╣");
  print("║ 1. By Title                      ║");
  print("║ 2. By Author                     ║");
  print("║ 3. By Publisher                  ║");
  print("║ 4. By Classification             ║");
  print("║ 5. By Year                       ║");
  print("╚══════════════════════════════════╝");
  int searchNumber = int.parse(stdin.readLineSync()!);

  
  if (searchNumber == 1)      print("Enter the name of the book you want to search for:");
  else if (searchNumber == 2) print("Enter the name of the author you want to search for:");
  else if (searchNumber == 3) print("Enter the name of the publisher you want to search for:");
  else if (searchNumber == 4) print("Enter the name of the classification you want to search for:");
  else if (searchNumber == 5) print("Enter the name of the year you want to search for:");

  String searchWord = stdin.readLineSync()!;
  librarian.searchAny(searchWord.toLowerCase(), searchNumber);
  print("Are you done? (yes/no)");
    String done = stdin.readLineSync()!;
    done.toLowerCase();

    while ( done == "yes") {
    print("Goodbye from sherch book");
    librarian.showAdminMenu();
    break;
    }
    while ( done == "no") {
    print("Enter the name of the book you want to search for:");
    searchAdmin();
    break;
    }
}

String readNonEmpty(String prompt) {
    while (true) {
      stdout.write(prompt);
      final input = stdin.readLineSync();
      if (input != null && input.trim().isNotEmpty) {
        return input.trim();
      }
      print('Input cannot be empty.');
    }
  }


User user = User();
Librarian librarian = Librarian();