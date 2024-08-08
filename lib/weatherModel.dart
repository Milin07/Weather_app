class weather {
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var Pressure;
  var Precipitation;
  var Wind_dir;
  var UV;
  var humidity;

  weather(
      {required this.cityName,
      required this.icon,
      required this.condition,
      required this.temp,
      required this.wind,
      required this.Pressure,
      required this.Precipitation,
      required this.humidity,
      required this.UV,
      required this.Wind_dir});

      weather.fromJson(Map<String,dynamic> json){
        cityName=json['location']['name'];
        icon=json['current']['condition']['icon'];
        condition=json['current']['condition']['text'];
        temp=json['current']['temp_c'];
        wind=json['current']['wind_kph'];
        Pressure=json['current']['pressure_mb'];
        Precipitation=json['current']['precip_mm'];
        humidity=json['current']['humidity'];
        UV=json['current']['uv'];
        Wind_dir=json['current']['wind_dir'];

      }

}
