class MyHelper {
  static String mapStringToImage(String input) {
    var name = "";
    switch (input) {
      case "sn":
        name = "snow";
        break;

      case "lr":
        name = "lightrain";
        break;

      case "lc":
        name = "cloudy";
        break;

      case "hc":
        name = "heavycloud";
        break;

      case "c":
        name = "clear";
        break;
      case "hr":
        name = "rainy";
        break;
      case "t":
        name = "thunderstorm";
        break;
      default:
        name = "clear";
    }
    return name;
  }
}
