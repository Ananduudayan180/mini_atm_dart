import 'dart:io';

class ATM {
  double _balance = 0.0;
  int _pin = 1234;
  final List<String> _transactionHistory = [];

  void balanceInquiry() {
    print("Your current balance is: ₹${_balance.toStringAsFixed(2)}");
  }

  void deposit() {
    print("Enter amount to deposit:");
    double amount = inputValidation();
    _balance += amount;
    _transactionHistory.add('Deposited: ₹$amount');
    print('successfully deposited ₹${amount.toStringAsFixed(2)}');
  }

  void withdraw() {
    print("Enter amount to withdraw:");
    double amount = inputValidation();
    if (amount > _balance) {
      print("Insufficient balance");
    } else {
      _balance -= amount;
      _transactionHistory.add('Withdrawn: ₹$amount');
      print('successfully withdrawn ₹${amount.toStringAsFixed(2)}');
    }
  }

  void showTransactionHistory() {
    if (_transactionHistory.isEmpty) {
      print("No transactions yet.");
    } else {
      print("Transaction History:");
      for (String transaction in _transactionHistory) {
        print(transaction);
      }
    }
  }

  double inputValidation() {
    while (true) {
      String? stringAmount = stdin.readLineSync();
      if (stringAmount == null) {
        print("No input provided");
        continue;
      } else {
        try {
          double amount = double.parse(stringAmount);
          if (amount <= 0) {
            print(
              "Amount cannot be zero or negative. Please enter a valid number.",
            );
            continue;
          }
          return amount;
        } catch (e) {
          print("Invalid amount entered. Please enter a valid number.");
          continue;
        }
      }
    }
  }

  bool verifyPin() {
    print('Enter your ATM pin:');
    String? pinInput = stdin.readLineSync();
    if (pinInput == null) {
      print("No input provided");
      exit(0);
    }
    if (pinInput == _pin.toString()) {
      print("PIN verified successfully.");
      return true;
    } else {
      print("Incorrect PIN. Access denied.");
      return false;
    }
  }
}
