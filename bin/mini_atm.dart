import 'dart:io';
import 'atm_model/atm_class.dart';

void main(List<String> args) {
  ATM atm = ATM();
  print("Welcome to Mini ATM");
  while (true) {
    print(
      "Please select an option:\n1. Deposit\n2. Withdraw\n3. Check Balance\n4. Exit",
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
        atm.deposit();
        break;
      case 2:
        print("You selected Withdraw option");
        atm.withdraw();
        break;
      case 3:
        print("You selected check Balance option");
        atm.balanceInquiry();
        break;
      case 4:
        print("You selected Exit option");
        exit(0);
      default:
        print("Invalid option selected");
    }
  }
}
