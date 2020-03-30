class CardDataModel {
  final String backdropAssetPath;
  final String address;
  final int minHeightInFeet;
  final int maxHeightInFeet;
  final double tempInDegrees;
  final String weatherType;
  final double windSpeedInMph;
  final String cardinalDirection;

  CardDataModel(
      {this.backdropAssetPath,
      this.address,
      this.minHeightInFeet,
      this.maxHeightInFeet,
      this.tempInDegrees,
      this.weatherType,
      this.windSpeedInMph,
      this.cardinalDirection});
}

final List<CardDataModel> demoCards = [
  CardDataModel(
    backdropAssetPath: "assets/ocean-1.jpg",
    address: '10th street',
    minHeightInFeet: 2,
    maxHeightInFeet: 3,
    tempInDegrees: 65.1,
    weatherType: "Mostly Clouds",
    windSpeedInMph: 11.2,
    cardinalDirection: "ENE",
  ),
  CardDataModel(
    backdropAssetPath: "assets/ocean-2.jpg",
    address: '4/h/12 road',
    minHeightInFeet: 6,
    maxHeightInFeet: 7,
    tempInDegrees: 52.7,
    weatherType: "Rain",
    windSpeedInMph: 20.2,
    cardinalDirection: "E",
  ),
  CardDataModel(
    backdropAssetPath: "assets/ocean-3.jpg",
    address: '16 sasti tala',
    minHeightInFeet: 3,
    maxHeightInFeet: 4,
    tempInDegrees: 74.5,
    weatherType: "Snow",
    windSpeedInMph: 22.36,
    cardinalDirection: "EN",
  ),
];
