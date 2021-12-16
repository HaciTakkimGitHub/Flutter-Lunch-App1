import 'package:beyanappmobile/component/lunchdrawer.dart';
import 'package:beyanappmobile/screen/lunchhomescreen.dart';
import 'package:beyanappmobile/theme/lunchapptheme.dart';
import 'package:flutter/material.dart';

class OrderCompletedScreen extends StatefulWidget {
  static const String screenName = "OrderCompletedScreen";

  @override
  _OrderCompletedScreenState createState() => _OrderCompletedScreenState();
}

class _OrderCompletedScreenState extends State<OrderCompletedScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: LunchApp.appBarColor,
        leading: new Container(),
        title: Text(
          'Lunching',
          style: LunchApp.appBarTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
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
      drawer: LunchDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: CircleAvatar(
                        foregroundColor: LunchApp.mainColor,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.check,
                          size: 50,
                        ),
                      ),
                      width: 60.0,
                      height: 60.0,
                      padding: const EdgeInsets.all(3.0),
                      decoration: new BoxDecoration(
                        color: LunchApp.mainColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        'Order Complete',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      child: Text.rich(
                        TextSpan(
                            text:
                                'Your lunch from Gusto Restorante will be delivered to your office. Lock for the package with your name'),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Divider(
                              color: Colors.grey.shade200, thickness: 2),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.timer,
                                          color: Colors.grey.shade500,
                                          size: 14),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'DELIVERY TIME',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.apartment,
                                          color: Colors.grey.shade500,
                                          size: 14),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'OFFICE',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '13:00 - 13:30',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700),
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Boston office',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Divider(
                              color: Colors.grey.shade200, thickness: 2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, LunchHomeScreen.screenName);
                    },
                    child: Text(
                      'GOT IT',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: LunchApp.mainColor,
                      padding: EdgeInsets.all(25),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
