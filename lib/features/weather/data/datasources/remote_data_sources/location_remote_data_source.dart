import 'dart:convert';

import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/features/weather/data/models/location_model/location_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/constants/api_utils.dart';

abstract class LocationRemoteDataSource {
  Future<List<LocationModel>>? getDataLocation(int param);
}

class LocationDataSourceImpl implements LocationRemoteDataSource {
  final http.Client client;

  LocationDataSourceImpl({required this.client});

  @override
  Future<List<LocationModel>>? getDataLocation(int locationId) {
    return _getLocationData(
      Uri.https(
        BASE_URL,
        '/geo/1.0/direct',
        {
          'q': 'Tabanan,Bali,ID',
          'appid': API_KEY,
        },
      ),
    );
  }

  Future<List<LocationModel>> _getLocationData(Uri uri) async {
    final response = await client.get(uri, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      final data = forecastsList(res);
      return data;
    } else {
      throw ServerException();
    }
  }

  List<LocationModel> forecastsList(dynamic jsonData) {
    return List<LocationModel>.from(
        jsonData.map((e) => LocationModel.fromJson(e)));
  }
}
