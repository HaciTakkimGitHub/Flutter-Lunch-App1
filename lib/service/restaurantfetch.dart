import '../model/restaurant.dart';
import '../infra/page.dart';

const catalogLength = 200;
final List<Restaurant> restaurantList = [
  Restaurant(
    restaurantName: "Burger King",
    lunchType: 'BURGER',
    assetName: "restaurant3",
    time: '12:30 - 13:00',
    rate: 9.8,
  ),
  Restaurant(
    restaurantName: "Limoncella",
    lunchType: 'LUNCH - SANDWICHES',
    assetName: "restaurant1",
    time: '12:30 - 13:00',
    rate: 9.7,
  ),
  Restaurant(
    restaurantName: "Connie\'s House",
    lunchType: 'HOMEMADE',
    assetName: "restaurant2",
    time: '12:30 - 13:00',
    rate: 9.6,
  ),
  Restaurant(
    restaurantName: "Eatery Boss",
    lunchType: 'STEAK',
    assetName: "restaurant4",
    time: '12:30 - 13:00',
    rate: 9.2,
  )
];

/// This function emulates a REST API call. You can imagine replacing its
/// contents with an actual network call, keeping the signature the same.
///
/// It will fetch a page of items from [startingIndex].
Future<ItemPage<Restaurant>> fetchPage(int startingIndex) async {
  // We're emulating the delay inherent to making a network call.
  await Future<void>.delayed(const Duration(milliseconds: 1500));

  // If the [startingIndex] is beyond the bounds of the catalog, an
  // empty page will be returned.
  if (startingIndex > catalogLength) {
    return ItemPage(
      items: [],
      startingIndex: startingIndex,
      hasNext: false,
    );
  }

  // The page of items is generated here.
  return ItemPage<Restaurant>(
    items: List.generate(itemsPerPage, (index) => restaurantList[index % 4]),
    startingIndex: startingIndex,
    hasNext: startingIndex + itemsPerPage < catalogLength,
  );
}
