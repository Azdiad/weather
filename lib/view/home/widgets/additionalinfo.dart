import 'package:flutter/material.dart';

TextStyle titlefont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
TextStyle infofont =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget additionalinfos(
    String wind, String humidity, String pressure, String feel_like) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Wind :', style: titlefont),
                  SizedBox(
                    height: 18.0,
                  ),
                  Text('Humidity :', style: titlefont),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$wind', style: infofont),
                  SizedBox(
                    height: 18.0,
                  ),
                  Text('$humidity', style: infofont),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pressure :',
                    style: titlefont,
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Text(
                    'Feels Like :',
                    style: titlefont,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$pressure',
                    style: infofont,
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Text(
                    '$feel_like',
                    style: infofont,
                  )
                ],
              ),
            ],
          )
        ]),
  );
}
