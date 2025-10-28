import 'dart:io';

void main(List<String> args) {
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
      break;
    case 2:
      print("You selected Withdraw option");
      break;
    case 3:
      print("You selected check Balance option");
      break;
    case 4:
      print("You selected Exit option");
      break;
    default:
      print("Invalid option selected");
  }
}
