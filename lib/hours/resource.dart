import 'dart:convert';
import 'dart:io';

import "./models.dart";

/// Hours resources
class HoursResource {
  final Uri _uri = Uri.https(
      'gaia-gestion-backend-testing.herokuapp.com', '/api/working-hours/');
  final HttpClient _http = HttpClient();

  /// Fetch all dogs
  Future<List<Registry>> list() async {
    var request = await _http.getUrl(_uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();

    var registries = jsonDecode(responseBody);

    return registries.map(
      (registry) => Registry.fromJson(registry),
    );
  }
}
