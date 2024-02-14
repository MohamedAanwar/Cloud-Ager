import 'package:dio/dio.dart';
import 'package:weatherapp/models/WeatherModel.dart';

class WeatherServices {
  final Dio dio;
  final String baseurl = 'https://api.weatherapi.com/v1';
  final String apikey = 'e914bbcb58ce42fd8c0211435240802';
  WeatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseurl/forecast.json?key=$apikey&q=$cityname&days=7');

      WeatherModel weathermodel = WeatherModel.fromJson(response.data);

      return weathermodel;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error']['message'] ??
          "oops there was an errr, try again later!");
    } catch (e) {
      throw Exception(e);
    }
  }
}
