import 'package:beyanappmobile/model/restaurant.dart';
import 'package:beyanappmobile/screen/restaurantmenuscreen.dart';
import 'package:beyanappmobile/theme/lunchapptheme.dart';
import 'package:flutter/material.dart';

class RestaurantContainer extends StatelessWidget {
  late Restaurant restaurant;

  RestaurantContainer({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RestaurantMenuScreen.screenName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: LunchApp.boxBorderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 8),
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 24,
                backgroundImage: restaurant.assetName != ''
                    ? AssetImage('images/${restaurant.assetName}.png')
                    : AssetImage(''),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  restaurant.restaurantName,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.schedule_outlined,
                      color: Colors.grey.shade500,
                      size: 11,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      restaurant.time,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  restaurant.lunchType,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            trailing: CircleAvatar(
              backgroundColor: LunchApp.mainColor,
              child: Text(
                restaurant.rate.toString(),
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
    );
  }
}
