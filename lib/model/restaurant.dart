class Restaurant {
  String restaurantName = "";
  String assetName = "";
  String lunchType = "";
  String time = "";
  double rate = 0;

  Restaurant(
      {required this.restaurantName,
      required this.lunchType,
      required this.assetName,
      required this.time,
      required this.rate});

  Restaurant.loading()
      : this(
            restaurantName: '',
            lunchType: '',
            assetName: '',
            time: '',
            rate: 0);
}
