import 'package:flutter/material.dart';

class DisplayWeather extends StatefulWidget {
  DisplayWeather({this.weatherLocation});
  final weatherLocation;
  @override
  State<DisplayWeather> createState() => _DisplayWeatherState();
}

class _DisplayWeatherState extends State<DisplayWeather> {
  double temp = 0;
  String desc = '';
  String cityName = '';

  @override
  void initState() {
    super.initState();
    setData(widget.weatherLocation);
  }

  void setData(dynamic weatherData) {
    setState(() {
      temp = weatherData['main']['temp'];
      desc = weatherData['weather'][0]['description'];
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue, // Set the app bar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.location_city,
                size: 64,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                'City: $cityName',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Description: $desc',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Temperature: $temp °C',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
