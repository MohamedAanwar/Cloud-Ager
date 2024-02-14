class WeatherModel {
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String cityname;
  final String image;
  final String date;
  final String weatherStateName;
  final Map data;
  WeatherModel(
      {required this.date,
      required this.maxtemp,
      required this.mintemp,
      required this.temp,
      required this.weatherStateName,
      required this.cityname,
      required this.image,
      required this.data});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      date: json['current']['last_updated'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      temp: json['current']['temp_c'],
      weatherStateName: json['current']['condition']['text'],
      cityname: json['location']['name'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      data: json,
    );
  }
  List<Days> getdays() {
    List<Days> days = [];
    for (var element in data['forecast']['forecastday']) {
      days.add(Days(
          daydate: element['date'],
          maxtemp: element['day']['maxtemp_c'],
          mintemo: element['day']['mintemp_c'],
          daycondition: element['day']['condition']['text'],
          dayimage: element['day']['condition']['icon']));
    }
    return days;
  }

  List<Hours> gethous() {
    List<Hours> hours = [];
    for (var element in data['forecast']['forecastday'][0]['hour']) {
      hours.add(Hours(
          hourtime: element['time'],
          temphour: element['temp_c'],
          hourcondition: element['condition']['text'],
          hourimage: element['condition']['icon']));
    }
    return hours;
  }

  String getImage() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear ' ||
        weatherStateName == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStateName == 'Patchy rain nearby') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}

class Days {
  String daydate;
  double maxtemp;
  double mintemo;
  String daycondition;
  String dayimage;

  Days(
      {required this.daydate,
      required this.maxtemp,
      required this.mintemo,
      required this.daycondition,
      required this.dayimage});
}

class Hours {
  String hourtime;
  double temphour;
  String hourcondition;
  String hourimage;
  Hours(
      {required this.hourtime,
      required this.temphour,
      required this.hourcondition,
      required this.hourimage});
}
