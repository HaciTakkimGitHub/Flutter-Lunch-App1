import 'package:beyanappmobile/component/lunchdrawer.dart';
import 'package:beyanappmobile/component/restaurantcontainer.dart';
import 'package:beyanappmobile/service/restaurantservice.dart';
import 'package:beyanappmobile/theme/lunchapptheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantListScreen extends StatelessWidget {
  static const String screenName = "RestaurantListScreen";
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
          'Restaurants',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
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
                          hintText: 'Search for restaurant...',
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
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.filter_list_outlined,
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
              height: 15,
            ),
            Flexible(child: RestaurantListBuilder()),
          ],
        ),
      ),
    );
  }
}

class RestaurantListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<Catalog, int?>(
      // Selector is a widget from package:provider. It allows us to listen
      // to only one aspect of a provided value. In this case, we are only
      // listening to the catalog's `itemCount`, because that's all we need
      // at this level.
      selector: (context, catalog) => catalog.itemCount,
      builder: (context, itemCount, child) {
        return ListView.builder(
          // When `itemCount` is null, `ListView` assumes an infinite list.
          // Once we provide a value, it will stop the scrolling beyond
          // the last element.
          itemCount: itemCount,

          itemBuilder: (context, index) {
            var catalog = Provider.of<Catalog>(context);
            var item = catalog.getByIndex(index);

            //if (item.isLoading) {
            //  return const LoadingItemTile();
            //}

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: RestaurantContainer(
                restaurant: item,
              ),
            );
          },
        );
      },
    );
  }
}
