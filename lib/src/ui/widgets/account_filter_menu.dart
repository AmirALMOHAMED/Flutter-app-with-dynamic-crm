import 'package:flutter/material.dart';

class AccountMenuItem{
  final String text;
  //final IconData icon;

  const AccountMenuItem({
    required this.text,
    //required this.icon,
  });
}

class AccountMenuItems {
  static const List<AccountMenuItem> firstItems = [stateCode, state];

  static const stateCode = AccountMenuItem(text: 'State code');
  static const state = AccountMenuItem(text: 'State');

  static Widget buildItem(AccountMenuItem item) {
    return Row(
      children: [
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, AccountMenuItem item) async {
    switch (item) {
      case AccountMenuItems.stateCode:
      //Do something
        break;
      case AccountMenuItems.state:
      //Do something
        break;
    }
  }


// Initial Selected Value
  String dropDownValue = 'State code';
// List of items in our dropdown menu
  static var items = [
    'State code',
    'StateOrProvince',
  ];

  static List<String>? selectedItems = [];

}