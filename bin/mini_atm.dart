import 'dart:io';
import 'atm_model/atm_class.dart';

void main(List<String> args) {
  ATM atm = ATM();
  void showMenu() {
    int? number;
    print("Welcome to Mini ATM");
    while (true) {
      print(
        "Please select an option:\n1. Deposit\n2. Withdraw\n3. Check Balance\n4. Transaction History\n5. Exit",
      );

      String? userSelectedMenu = stdin.readLineSync();
      if (userSelectedMenu == null) {
        print("No input provided");
        return;
      }
      try {
        number = int.parse(userSelectedMenu);
      } catch (e) {
        print("Invalid number selected. please enter a valid number");
        continue;
      }
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
          print("You selected Transaction History option");
          atm.showTransactionHistory();
          break;
        case 5:
          print("You selected Exit option");
          exit(0);
        default:
          print("Invalid option selected");
      }
    }
  }

  if (atm.verifyPin()) {
    showMenu();
  } else {
    exit(0);
  }
}
