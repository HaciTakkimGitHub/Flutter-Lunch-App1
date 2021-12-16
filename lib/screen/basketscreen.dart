import 'package:beyanappmobile/component/lunchdrawer.dart';
import 'package:beyanappmobile/screen/ordercompletedscreen.dart';
import 'package:beyanappmobile/theme/lunchapptheme.dart';
import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  static const String screenName = "BasketScreen";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: LunchApp.appBarColor,
        leading: new Container(
          child: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          'Basket',
          style: LunchApp.appBarTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
              child: CircleAvatar(
                child: Icon(
                  Icons.account_circle_outlined,
                  color: LunchApp.bodyColor,
                  size: 30,
                ),
                backgroundColor: LunchApp.appBarColor,
              ),
            ),
          ),
        ],
      ),
      endDrawer: LunchDrawer(),
      body: Container(
        child: Column(
          children: [
            Text('Basket Page'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, OrderCompletedScreen.screenName);
                },
                child: Text('Approve'))
          ],
        ),
      ),
    );
  }
}
