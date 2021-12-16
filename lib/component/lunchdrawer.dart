import 'package:beyanappmobile/theme/lunchapptheme.dart';
import 'package:flutter/material.dart';

class LunchDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('(555) 555 55 55'),
            accountName: Text('hacitakkim@hotmail.com'),
            currentAccountPicture: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('images/avatarprofile.png'),
            ),
            decoration: BoxDecoration(
              color: LunchApp.mainColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu_outlined),
            title: Text('Orders'),
          ),
          ListTile(
            leading: Icon(Icons.map_outlined),
            title: Text('Addresses'),
          ),
          ListTile(
            leading: Icon(Icons.credit_card_outlined),
            title: Text('Payment Method'),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Help'),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
