import 'dart:io';
import 'menu_functions.dart';

void main(List<String> args) {
  double balance = 0.0;
  while (true) {
    print(
      "Welcome to Mini ATM \nPlease select an option:\n1. Deposit\n2. Withdraw\n3. Check Balance\n4. Exit",
    );

    String? userSelectedMenu = stdin.readLineSync();
    if (userSelectedMenu == null) {
      print("No input provided");
      return;
    }
    int number = int.parse(userSelectedMenu);
    switch (number) {
      case 1:
        print("You selected Deposit option");
        balance = deposit(balance);
        break;
      case 2:
        print("You selected Withdraw option");
        balance = withdraw(balance);
        break;
      case 3:
        print("You selected check Balance option");
        balanceInquiry(balance);
        break;
      case 4:
        print("You selected Exit option");
        exit(0);
      default:
        print("Invalid option selected");
    }
  }
}
