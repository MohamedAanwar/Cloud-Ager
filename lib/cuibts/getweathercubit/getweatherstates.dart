import 'package:weatherapp/models/WeatherModel.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weathermodel;
  WeatherLoadedState(this.weathermodel);
}

class WeatherFailureState extends WeatherState {}
