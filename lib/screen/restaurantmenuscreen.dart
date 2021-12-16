import 'package:beyanappmobile/component/lunchdrawer.dart';
import 'package:beyanappmobile/screen/basketscreen.dart';
import 'package:beyanappmobile/screen/productdetailscreen.dart';
import 'package:beyanappmobile/theme/lunchapptheme.dart';
import 'package:flutter/material.dart';

class RestaurantMenuScreen extends StatelessWidget {
  static const String screenName = "RestaurantMenuScreen";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, BasketScreen.screenName);
        },
        child: Icon(Icons.shopping_basket_outlined),
        backgroundColor: LunchApp.mainColor,
      ),
      appBar: AppBar(
        backgroundColor: LunchApp.appBarColor,
        leading: new Container(
          child: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          'Menu',
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
      body: Column(
        children: [
          Container(
            color: LunchApp.bodyColor,
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage('images/restaurant3.png'),
            ),
          ),
          Flexible(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal:
                            BorderSide(width: 1, color: Colors.grey.shade300)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListTile(
                      title: Text(
                        'Burger King',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text('Burger - Sandwiches'),
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: LunchApp.mainColor,
                        child: Text(
                          '9.8',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 13, right: 13, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: LunchApp.boxBorderColor),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search for lunch...',
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.search,
                          color: LunchApp.mainColor,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 20),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ProductDetailScreen.screenName);
                  },
                  child: ListTile(
                    leading: Image(
                      image: AssetImage('images/food4.png'),
                    ),
                    title: Text(
                      'Whopper Menu',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Whopper Sandwich, French fries, Drink',
                      style: TextStyle(fontSize: 12),
                    ),
                    trailing: Text(
                      '9,99\$',
                      style: TextStyle(
                          fontSize: 15,
                          color: LunchApp.mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                ListTile(
                  leading: Image(
                    image: AssetImage('images/food4.png'),
                  ),
                  title: Text(
                    'Whopper Menu',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Whopper Sandwich, French fries, Drink',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Text(
                    '9,99\$',
                    style: TextStyle(
                        fontSize: 15,
                        color: LunchApp.mainColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                ListTile(
                  leading: Image(
                    image: AssetImage('images/food4.png'),
                  ),
                  title: Text(
                    'Whopper Menu',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Whopper Sandwich, French fries, Drink',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Text(
                    '9,99\$',
                    style: TextStyle(
                        fontSize: 15,
                        color: LunchApp.mainColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
