import 'input_validation.dart';

class ATM {
  double _balance = 0.0;
  int _pin = 1234;
  final List<String> _transactionHistory = [];

  static final ATM _instance = ATM._internall();

  ATM._internall();
  factory ATM() {
    return _instance;
  }

  int get pin => _pin;

  set pin(int newPin) {
    _pin = newPin;
  }

  void balanceInquiry() {
    print("Your current balance is: ₹${_balance.toStringAsFixed(2)}");
  }

  void deposit() {
    print("Enter amount to deposit:");
    double amount = inputValidation();
    _balance += amount;
    _transactionHistory.add('Deposited: ₹${amount.toStringAsFixed(2)}');
    print('successfully deposited ₹${amount.toStringAsFixed(2)}');
  }

  void withdraw() {
    print("Enter amount to withdraw:");
    double amount = inputValidation();
    if (amount > _balance) {
      print("Insufficient balance");
    } else {
      _balance -= amount;
      _transactionHistory.add('Withdrawn: ₹${amount.toStringAsFixed(2)}');
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

  void changePin() {
    int newPin = changePinValidation();
    _pin = newPin;
    print("PIN changed successfully.");
  }
}
