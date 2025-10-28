import 'dart:io';

void balanceInquiry(double balance) {
  print("Your current balance is: RS.${balance.toStringAsFixed(2)}");
}

double deposit(double balance) {
  print("Enter amount to deposit:");
  double amount = enterAmount();
  balance += amount;
  return balance;
}

double withdraw(double balance) {
  print("Enter amount to withdraw:");
  double amount = enterAmount();
  if (amount > balance) {
    print("Insufficient balance");
  } else {
    balance -= amount;
  }
  return balance;
}

double enterAmount() {
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
