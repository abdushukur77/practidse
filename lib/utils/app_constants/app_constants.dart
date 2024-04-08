class AppConstants {
  static const String apiKey =
      "e973P3u9RRVuFiva3vC4YdKiqprQfRUyBW2WTXbeSgpZTjUe2w";
  static const String baseUrl = "https://crudapi.co.uk";
  static const String endPoint = "/api/v1/cards";

  static RegExp cardNumberRegExp = RegExp(r'^\d{16}$');
}
