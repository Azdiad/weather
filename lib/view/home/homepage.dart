import 'package:flutter/material.dart';
import 'package:weatherapp/controls/getlocation.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/services/weather_api_client.dart';
import 'package:weatherapp/view/home/widgets/additionalinfo.dart';
import 'package:weatherapp/view/home/widgets/current_weather.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  WeatherApiclient client = WeatherApiclient();

  Weather? data;
  TextEditingController searching = TextEditingController();

  Future<void> getData(String place) async {
    data = await client.currentweather(place);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData('Malappuram');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 222, 203, 240),
        elevation: 15.0,
        title: const Text(
          'SkyScan',
          style: TextStyle(
            fontSize: 28,
            letterSpacing: 3,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFF8EC5FC),
              Color(0xFFE0C3FC),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                onFieldSubmitted: (String place) {
                  getData(place);
                },
                controller: searching,
                cursorColor: Colors.black,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 18),
                    isDense: true,
                    hintText: "Search for...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.location_searching_sharp,
                        size: 30,
                      ),
                    ),
                    suffixIcon: searching.text.length > 0
                        ? IconButton(
                            onPressed: () {
                              searching.clear();
                            },
                            icon: Icon(Icons.cancel, color: Colors.red))
                        : null),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if (data != null)
              currentweather(
                Icons.wb_sunny_rounded,
                '${data!.temp}',
                searching.text.isEmpty ? 'Malappuram' : searching.text,
              ),
            SizedBox(
              height: 60,
            ),
            Text(
              'Additional information',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black45,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            SizedBox(
              height: 10.0,
            ),
            if (data != null)
              additionalinfos(
                '${data!.wind}',
                '${data!.humidity}',
                '${data!.pressure}',
                '${data!.feels_like}',
              ),
          ],
        ),
      ),
    );
  }
}
