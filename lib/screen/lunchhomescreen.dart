import 'dart:ui';
import 'package:beyanappmobile/component/bestdealcontainer.dart';
import 'package:beyanappmobile/component/lunchdrawer.dart';
import 'package:beyanappmobile/component/restaurantcontainer.dart';
import 'package:beyanappmobile/screen/basketscreen.dart';
import 'package:beyanappmobile/service/restaurantfetch.dart';
import 'package:beyanappmobile/screen/restaurantlistscreen.dart';
import 'package:beyanappmobile/theme/lunchapptheme.dart';
import 'package:flutter/material.dart';

class LunchHomeScreen extends StatefulWidget {
  List<BestDealContainer> listBestDeal = [];
  List<Widget> listRestaurant = [];

  LunchHomeScreen() {
    listBestDeal.add(BestDealContainer('food4'));
    listBestDeal.add(BestDealContainer('food3'));
    listBestDeal.add(BestDealContainer('food2'));
    listBestDeal.add(BestDealContainer('food1'));

    listRestaurant.add(PopularRestaurantContainer(0));
    listRestaurant.add(PopularRestaurantContainer(1));
    listRestaurant.add(PopularRestaurantContainer(2));
    listRestaurant.add(PopularRestaurantContainer(3));
  }

  static const String screenName = "LaunchHomeScreen";

  @override
  _LunchHomeScreenState createState() => _LunchHomeScreenState();
}

class _LunchHomeScreenState extends State<LunchHomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
        //leading: new Container(),
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
        color: LunchApp.bodyColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: ListView(children: [
            Text(
              'What for lunch today?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
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
                          hintText: 'Search for restaurant',
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
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Today\'s best deals',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.listBestDeal,
              ),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Popular restaurants',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RestaurantListScreen.screenName);
                        },
                        child: Text(
                          'SHOW ALL',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: LunchApp.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.listRestaurant,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class PopularRestaurantContainer extends StatelessWidget {
  int index;
  PopularRestaurantContainer(this.index);

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width - 80;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
          width: containerWidth,
          child: RestaurantContainer(restaurant: restaurantList[index])),
    );
  }
}
