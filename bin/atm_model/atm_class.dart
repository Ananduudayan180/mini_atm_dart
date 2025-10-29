import 'dart:io';

class ATM {
  double _balance = 0.0;

  void balanceInquiry() {
    print("Your current balance is: RS.${_balance.toStringAsFixed(2)}");
  }

  void deposit() {
    print("Enter amount to deposit:");
    double amount = inputValidation();
    _balance += amount;
    print('successfully deposited RS.${amount.toStringAsFixed(2)}');
  }

  void withdraw() {
    print("Enter amount to withdraw:");
    double amount = inputValidation();
    if (amount > _balance) {
      print("Insufficient balance");
    } else {
      _balance -= amount;
      print('successfully withdrawn RS.${amount.toStringAsFixed(2)}');
    }
  }

  double inputValidation() {
    while (true) {
      String? stringAmount = stdin.readLineSync();
      if (stringAmount == null) {
        print("No input provided");
        return 0.0;
      } else {
        try {
          double ammount = double.parse(stringAmount);
          if (ammount <= 0) {
            print(
              "Amount cannot be zero or negative. Please enter a valid number.",
            );
            continue;
          }
          return ammount;
        } catch (e) {
          print("Invalid amount entered. Please enter a valid number.");
          continue;
        }
      }
    }
  }
}
