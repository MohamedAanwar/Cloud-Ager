import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cuibts/getweathercubit/getweatherstates.dart';
import 'package:weatherapp/models/WeatherModel.dart';
import 'package:weatherapp/services/weather_services.dart';

class GetWathearCubit extends Cubit<WeatherState> {
  GetWathearCubit() : super(WeatherInitialState());
  WeatherModel? weathermodel;

  getweather({required String cityname}) async {
    try {
      weathermodel =
          await WeatherServices(Dio()).getCurrentWeather(cityname: cityname);
      emit(WeatherLoadedState(weathermodel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
