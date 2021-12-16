import 'package:beyanappmobile/screen/basketscreen.dart';
import 'package:beyanappmobile/screen/lunchhomescreen.dart';
import 'package:beyanappmobile/screen/ordercompletedscreen.dart';
import 'package:beyanappmobile/screen/productdetailscreen.dart';
import 'package:beyanappmobile/screen/restaurantlistscreen.dart';
import 'package:beyanappmobile/screen/restaurantmenuscreen.dart';
import 'package:beyanappmobile/service/restaurantservice.dart';
import 'package:beyanappmobile/theme/lunchapptheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Catalog>(
      create: (context) => Catalog(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.screenName,
        routes: {
          LoginScreen.screenName: (context) => LoginScreen(),
          OrderCompletedScreen.screenName: (context) => OrderCompletedScreen(),
          LunchHomeScreen.screenName: (context) => LunchHomeScreen(),
          RestaurantListScreen.screenName: (context) => RestaurantListScreen(),
          RestaurantMenuScreen.screenName: (context) => RestaurantMenuScreen(),
          BasketScreen.screenName: (context) => BasketScreen(),
          ProductDetailScreen.screenName: (context) => ProductDetailScreen(),
        },
        title: 'Flutter',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: LunchApp.mainColor,
          ),
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          fontFamily: "OpenSans",
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          fontFamily: "OpenSans",
        ),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
