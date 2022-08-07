class Homemodel{
  current? Current;
  location? Location;

  Homemodel({
    this.Current,
    this.Location,
  });
  Homemodel.fromJson(Map<String,dynamic>json){
    Current=current.fromJson(json['current']);
    Location= location.fromJson(json['location']);
  }
}

class location{
  dynamic name;
  dynamic country;
  dynamic localtime;

  location({
    required this.name,
    required this.country,
    required this.localtime,
  });
location.fromJson(Map<String,dynamic>json){
  name=json['name'];
  country=json['country'];
  localtime=json['localtime'];
}

}
class current{
dynamic wind_kph;
dynamic humidity;
dynamic temp_c;
Condition? condition;

current({
    required this.wind_kph,
    required this.humidity,
    required this.temp_c,
    this.condition,});
current.fromJson(Map<String,dynamic>json){
  wind_kph=json['wind_kph'];
  humidity=json['humidity'];
  temp_c=json['temp_c'];
  condition=Condition.fromJson(json['condition']);
}

}
class Condition{
  dynamic icon;
  dynamic text;

  Condition({
    required this.icon,
    required this.text,
  });
  Condition.fromJson(Map<String,dynamic>json){
    icon=json['icon'];
    text=json['text'];

  }
}