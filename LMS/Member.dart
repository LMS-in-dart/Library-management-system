import 'data.dart';
import 'dart:io';
import 'Library.dart';


abstract class Member 
{
  int? mumberID;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  int? borrowedBooks; 
  String? role;

  Member({this.name, this.email, this.phoneNumber, this.password, this.borrowedBooks});


  void searchAny(searchWord, searchNumber) {
    switch (searchNumber) {
      case 1:
      bool bookFound = bookData.any((book) => book['name'] == searchWord);
      if (bookFound) {
        print('The book "$searchWord" is available.');
        for (var element in bookData) {
          if (element['name'] == searchWord) {

            print("╔═══════════════════════════════════════════════════════");
            print("║ 1. Book Name           ║${element['name']}           ");
            print("║ 2. Author              ║${element['author']}         ");
            print("║ 3. Publisher           ║${element['publisher']}      ");
            print("║ 4. Classification      ║${element['classification']} ");
            print("║ 5. Year of publication ║${element['year']}           ");
            print("║ 6. Volumes             ║${element['volumes']}        ");
            print("║ 7. Pages               ║${element['pages']}          ");
            print("╚═══════════════════════════════════════════════════════");
          }          
        }
      } 
      else {
        print('Sorry, the book "$searchWord" is not available.');
        }
        break;
      
      case 2: 
      bool authorFound = bookData.any((author) => author['author'] == searchWord);
      if (authorFound) {
        print('The author "$searchWord" Have the following books: ');
        for (var element in bookData) {
          if (element['author'] == searchWord) {
            print("Book Name: ${element['name']}");
            print("Classification: ${element['classification']}");
            print("═══════════════════════════════════════════════════════");

            }
          }
        } 
      else {
        print('Sorry, the author "$searchWord" books is not available.');
        }
        break;

      case 3: 
      bool publisherFound = bookData.any((publisher) => publisher['publisher'] == searchWord);
      if (publisherFound) {
        print('The publisher "$searchWord" Have the following books: ');
        for (var element in bookData) {
          if (element['publisher'] == searchWord) {
            print(element['name']);
            }
          }
        } 
      else {
        print('Sorry, the publisher "$searchWord" books is not available.');
        }
        break;

      case 4: 
      bool classificationFound = bookData.any((classification) => classification['classification'] == searchWord);
      if (classificationFound) {
        print('The classification "$searchWord" Have the following books: ');
        for (var element in bookData) {
          if (element['classification'] == searchWord) {
            print(element['name']);
            }
          }
        } 
      else {
        print('Sorry, the classification "$searchWord" books is not available.');
        }
        break;

        case 5:
        bool yearFound = bookData.any((year)  => year['year'] == searchWord);
        if (yearFound) {
          print('In year "$searchWord"  the following books has been published: ');
          for (var element in bookData) {
            if (element['year'] == searchWord) {
              print(element['name']);
              }
            }
          } 
        else {
          print('Sorry, the year "$searchWord" books is not available.');
          }
          break;     

    }
  }
}


class User extends Member
{

  int? mumberID;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? role;

  User({this .mumberID,this.name, this.email, this.phoneNumber, this.password, this.role});

    void login(name, password)
  {
    Librarian librarian = Librarian();
    bool found  = false;

    for (int i =0 ; i < librarianData.length; i++){
      if (librarianData [i]['name'] == name && librarianData [i]['password'] == password)
      {
        print("Welcome admin ${librarianData [i]['name']}");
        found  = true;
        librarian.showAdminMenu();        
        break;
      }
    }
    if (!found) {
      for (int i =0 ; i < userData.length; i++)
    {
      
      if (userData [i]['name'] == name && userData [i]['password'] == password)
      {
        print("Welcome ${userData [i]['name']}");
        found  = true;
        break;
      }
      else if (userData [i]['name'] != name || userData [i]['password'] != password)
      {
        found  = false;
      }     
    }
    if (!found)
    print("wrong user name or password");
  }
    }


    void register(name, password , email, phoneNumber)
  {
    bool isExist = false;

    for (int i = 0; i < userData.length; i++)
    {
      if (userData[i]['email'] == email)
      {
        print("This email is already exist");
        isExist = true;
      }
    }

    if (!isExist)
      {
        userData.add({'name': name, 'email': email, 'phoneNumber': phoneNumber, 'password': password});
        print("Your account has been created successfully");
      }
      
  }
}

class Librarian extends Member {

  int? mumberID;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? role;

  Librarian({this.mumberID, this.name, this.email, this.phoneNumber, this.password, this.role});
  bool adminLogin() {
  print("Enter  username:");
  String username = stdin.readLineSync()!;
  print("Enter  password:");
  String password = stdin.readLineSync()!;

  for (var admin in librarianData) {
    if (admin['name'] == username && admin['password'] == password) {
      print("Logged in as admin: $username");
      showAdminMenu();
      return true;
    }
  }

  print("Login failed. Please check username or password.");
  return false;
}
void showAdminMenu() {

  print("╔═════════════════════════════════════╗");
  print("║              Admin Menu             ║");
  print("╠═════════════════════════════════════╣");
  print("║ 1. Add book (coming soon)           ║");
  print("║ 2. Remove book (coming soon)        ║");
  print("║ 3. Search book                      ║");
  print("║ 4. View borrowed books (coming soon)║");
  print("║ 0. Exit                             ║");
  print("╚═════════════════════════════════════╝");

  print("Enter your choice: ");

    int choice;
    choice = int.parse(stdin.readLineSync()!);
    switch (choice) {

    case 1:
      print("Adding a book...");
      // addBook();
      break;

    case 2:
      print("Removing a book...");
      // removeBook();
      break;

    case 3:
      print("Searching for a book...");
      searchAdmin();

          print("Are you done? (yes/no)");
    String done = stdin.readLineSync()!;
    done.toLowerCase();

    while ( done == "yes") {
    print("Goodbye from sherch book");
    showAdminMenu();
    break;
    }
    while ( done == "no") {
    print("Enter the name of the book you want to search for:");
    showAdminMenu();
    break;
    }
      break;

    case 4:
      print("Viewing borrowed books...");
      // viewBorrowedBooks();
      break;
    
    case 0:
      print("Exiting...");
      showMenu();
      break;

    default:
      print("Please enter a valid number (1-5).");
  }
    }
}