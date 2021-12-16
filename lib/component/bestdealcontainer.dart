import 'package:beyanappmobile/theme/lunchapptheme.dart';
import 'package:flutter/material.dart';

class BestDealContainer extends StatelessWidget {
  var assetName = "";

  BestDealContainer(this.assetName);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      Text('Deneme 1'),
                      Text('Deneme 1'),
                      Text('Deneme 1'),
                    ],
                  );
                });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: LunchApp.boxBorderColor),
            ),
            width: 250,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    child: Image(
                      image: AssetImage('images/$assetName.png'),
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Uramaki Set',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600),
                          ),
                          Text(
                            'Quick China'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade500),
                          ),
                        ],
                      )),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('15,80 \$'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
