import 'package:http/http.dart' as http;
import 'dart:convert';

class RideService {
  Future<String> calculateRideDetails({
    required double lon1,
    required double lat1,
    required double lon2,
    required double lat2,
    required String userName,
    required String email,
    required String contactNumber,
    required String pickupAddress,
    required String dropoffAddress,
    required String carName,
    required int carPrice,
  }) async {
    var url = Uri.parse(
        'https://router.project-osrm.org/route/v1/driving/$lon1,$lat1;$lon2,$lat2?overview=false');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var distanceMeters = jsonResponse['routes'][0]['distance'] as double;
      var distanceKm = distanceMeters / 1000.0;
      var cost = distanceKm * (carPrice /2);
      return '''
      Name: $userName
      Email: $email
      Phone: $contactNumber
      Pickup: $pickupAddress
      Dropoff: $dropoffAddress
      Car: $carName
      Total Distance: ${distanceKm.toStringAsFixed(2)} km
      Total Cost: Rs ${cost.toStringAsFixed(2)}
      ''';
    } else {
      return 'Failed to calculate distance. Please try again.';
    }
  }
}
