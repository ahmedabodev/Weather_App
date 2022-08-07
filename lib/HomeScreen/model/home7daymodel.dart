class home7daymodel {
  current? Current;
  location? Location;
  forecast? Forecast;

  home7daymodel({
    this.Current,
    this.Location,
  });

  home7daymodel.fromJson(Map<String, dynamic> json) {
    Current = current.fromJson(json['current']);
    Location = location.fromJson(json['location']);
    Forecast = forecast.fromJson(json['forecast']);
  }
}

class location {
  dynamic name;
  dynamic country;
  dynamic localtime;

  location({
    required this.name,
    required this.country,
    required this.localtime,
  });

  location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    localtime = json['localtime'];
  }
}

class current {
  dynamic wind_kph;
  dynamic humidity;
  dynamic temp_c;
  Condition? condition;

  current({
    required this.wind_kph,
    required this.humidity,
    required this.temp_c,
    this.condition,
  });

  current.fromJson(Map<String, dynamic> json) {
    wind_kph = json['wind_kph'];
    humidity = json['humidity'];
    temp_c = json['temp_c'];
    condition = Condition.fromJson(json['condition']);
  }
}

class Condition {
  dynamic icon;
  dynamic text;

  Condition({
    required this.icon,
    required this.text,
  });

  Condition.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    text = json['text'];
  }
}

class forecast{
  List<forecastday>forecat=[];
  forecast({
    required this.forecat,
  });

  forecast.fromJson(Map<String,dynamic> json) {
    json['forecastday'].forEach((e) {
      forecat.add(forecastday.fromJson(e));
    });
  }
}

class forecastday {
  dynamic date;
  day? Day;


  forecastday({
    required this.date,
    this.Day,
  });

  forecastday.fromJson(Map<String,dynamic> json) {
    date = json['date'];
    Day=day.forJson(json['day']);

  }
}
class day{
  dynamic avgtemp_c;
  dynamic avghumidity;
  dynamic maxwind_kph;
  Condition? condition;

  day({
    required this.avgtemp_c,
    required this.avghumidity,
    required this.maxwind_kph,
    this.condition,
  });
  day.forJson(Map<String,dynamic>json){
    avgtemp_c = json['avgtemp_c'];
    avghumidity = json['avghumidity'];
    maxwind_kph=json['maxwind_kph'];
    condition = Condition.fromJson(json['condition']);
  }
}
