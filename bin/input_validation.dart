import 'dart:io';
import 'atm_class.dart';

ATM atm = ATM();
bool verifyPin() {
  while (true) {
    print('Enter your ATM pin:');
    String? pinInput = stdin.readLineSync();
    if (pinInput == null) {
      print("No input provided");
      exit(0);
    }
    if (pinInput == atm.pin.toString()) {
      print("PIN verified successfully.");
      return true;
    } else {
      print("Incorrect PIN. Access denied.");
      return false;
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

int changePinValidation() {
  while (true) {
    print("Enter current PIN:");
    String? currentPin = stdin.readLineSync();
    if (currentPin == null ||
        currentPin.isEmpty ||
        currentPin != atm.pin.toString()) {
      print("Incorrect current PIN. PIN change failed.");
      continue;
    }
    print("Enter new 4-digit PIN:");
    String? stringNewPin = stdin.readLineSync();
    if (stringNewPin == null) {
      print("No input provided");
      continue;
    }
    try {
      int newPin = int.parse(stringNewPin);
      if (newPin < 1000 || newPin > 9999) {
        print("PIN must be a 4-digit number. PIN change failed.");
        continue;
      }
      return newPin;
    } catch (e) {
      print("Invalid PIN format. PIN change failed.");
      continue;
    }
  }
}
