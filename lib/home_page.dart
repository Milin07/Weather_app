import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/getLocation.dart';
import "package:weather_app/utlis/images.dart";
import 'package:weather_app/weatherData.dart';

var dayinfo = DateTime.now();
var dateformat = DateFormat('EEEE,dd MMM,yyyy').format(dayinfo);

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var data;

  info() async {
    var position = await GetPosition();
    data = await WeatherData().getData(position.latitude,position.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
            future: info(),
            builder: ((context, snapshot) {
              return SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.black,
                  appBar: AppBar(
                    title: Text("Weather App",
                        style: TextStyle(color: Colors.white)),
                    centerTitle: true,
                    backgroundColor: Color.fromARGB(206, 15, 133, 196),
                  ),
                  body: Container(
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(10.0),
                            height: size.height * 0.65,
                            width: size.width,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: LinearGradient(
                                    colors: [Colors.blue, Color(0xff955cd1)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.2, 0.85])),
                            child: Column(
                              children: [
                                Text(
                                    data?.cityName != null
                                        ? '${data.cityName}'
                                        : "Ahmedabad",
                                    style: TextStyle(
                                        fontSize: 25.0, color: Colors.white)),
                                Text(dateformat,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white)),
                                SizedBox(height: 20.0),
                                Image.network(
                                  data?.icon != null
                                      ? 'https:${data?.icon}'
                                      : 'https://seeklogo.com/images/S/sunny-weather-symbol-logo-4E2A5E54AA-seeklogo.com.png',
                                  width: 100.0,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  data?.condition!= null?'${data?.condition}': "Sunny",
                                    style: TextStyle(
                                        fontSize: 35.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  data?.temp != null ? '${data.temp}°' : "30°",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 30.0),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(children: [
                                        Image.asset(
                                          AppImages.i2,
                                          width: size.width * 0.15,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          data?.wind!= null?'${data?.wind} km/h':"5.0km/h",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                                  .withOpacity(0.7)),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          "Wind",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                        )
                                      ]),
                                    ),
                                    Expanded(
                                      child: Column(children: [
                                        Image.asset(
                                          AppImages.i3,
                                          width: size.width * 0.15,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          data?.humidity!=null?'${data?.humidity}':"50",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                                  .withOpacity(0.7)),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          "Humidity",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                        )
                                      ]),
                                    ),
                                    Expanded(
                                      child: Column(children: [
                                        Image.asset(
                                          AppImages.i4,
                                          width: size.width * 0.15,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                         data?.wind !=null ?'${data?.Wind_dir}':"E",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                                  .withOpacity(0.7)),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          "Direction",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                        )
                                      ]),
                                    )
                                  ],
                                )
                              ],
                            )),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  "UV Index",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                                Text('${data?.UV}',
                                    style: TextStyle(color: Colors.white))
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: [
                                Text("Precipitation",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0)),
                                Text('${data?.Precipitation} mm',
                                    style: TextStyle(color: Colors.white))
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: [
                                Text("Pressure",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0)),
                                Text('${data?.Pressure} hpa',
                                    style: TextStyle(color: Colors.white))
                              ],
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}
