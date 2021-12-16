import 'package:beyanappmobile/component/lunchdrawer.dart';
import 'package:beyanappmobile/screen/ordercompletedscreen.dart';
import 'package:beyanappmobile/theme/lunchapptheme.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String screenName = "ProductDetailScreen";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: LunchApp.appBarColor,
        leading: new Container(
          child: TextButton(
            child: Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          'Product Detail',
          style: LunchApp.appBarTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          child: Column(
            children: [
              Container(
                color: LunchApp.bodyColor,
                height: 220,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  //fit: BoxFit.fill,
                  image: AssetImage('images/restaurant3.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 8),
                child: Text(
                  'Whopper Menu',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade300,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '9,99\$',
                          style: TextStyle(
                              fontSize: 15,
                              color: LunchApp.mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Icon(Icons.remove),
                            ),
                            Text('1 pc'),
                            TextButton(
                              onPressed: () {},
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade300,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, OrderCompletedScreen.screenName);
                        },
                        child: Text(
                          'Order Now',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: LunchApp.bodyColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade500,
                          padding: EdgeInsets.all(25),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Add to Basket',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: LunchApp.mainColor,
                          padding: EdgeInsets.all(25),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                        ),
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
