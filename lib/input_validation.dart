import 'dart:io';
import 'package:mini_atm/atm_class.dart';

ATM atm = ATM();
bool verifyPin() {
  bool isVerified = false;
  int attempts = 3;
  while (attempts > 0) {
    print('\nEnter your ATM pin:');
    String? pinInput = stdin.readLineSync();
    if (pinInput == null || pinInput.trim().isEmpty) {
      attempts--;
      print(
        "No input provided. Please enter your PIN. left attempts: $attempts",
      );
      continue;
    }
    if (pinInput == atm.pin.toString()) {
      print("✅ PIN verified successfully.");
      isVerified = true;
      break;
    } else if (pinInput.length != 4) {
      attempts--;
      print("⚠️ PIN must be a 4-digit number. left attempts: $attempts");
      continue;
    } else {
      attempts--;
      print("❌ Incorrect PIN. left attempts: $attempts");
      continue;
    }
  }
  if (!isVerified) {
    sleep(Duration(seconds: 2));
    print("⚠️ Maximum attempts reached. Exiting.");
    return false;
  } else {
    return true;
  }
}

double inputValidation() {
  while (true) {
    String? stringAmount = stdin.readLineSync();
    if (stringAmount == null || stringAmount.isEmpty) {
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
        sleep(Duration(seconds: 1));
        continue;
      }
    }
  }
}

int changePinValidation() {
  int newPin = atm.pin;
  bool changed = false;
  int attempts = 3;
  while (attempts > 0) {
    print("Enter current PIN:");
    String? currentPin = stdin.readLineSync();
    if (currentPin == null ||
        currentPin.isEmpty ||
        currentPin != atm.pin.toString()) {
      print(
        "Incorrect current PIN. Please try again.left attempts: ${--attempts}",
      );
      continue;
    }
    print("Enter new 4-digit PIN:");
    String? stringNewPin = stdin.readLineSync();
    if (stringNewPin == null || stringNewPin.isEmpty) {
      print("No input provided. left attempts: ${--attempts}");
      continue;
    }
    try {
      newPin = int.parse(stringNewPin);
      if (newPin.toString().length != 4) {
        print(
          "PIN must be a 4-digit number. PIN change failed.left attempts: ${--attempts}",
        );
        continue;
      }
      changed = true;
      break;
    } catch (e) {
      print(
        "Invalid PIN format. PIN change failed. left attempts: ${--attempts}",
      );
      continue;
    }
  }

  if (changed) {
    return newPin;
  } else {
    sleep(Duration(seconds: 2));
    print("⚠️ Maximum attempts reached. PIN change failed.");
    return atm.pin;
  }
}
