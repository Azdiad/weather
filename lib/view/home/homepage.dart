import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/hoemprovider.dart';
import 'package:weatherapp/view/home/widgets/additionalinfo.dart';
import 'package:weatherapp/view/home/widgets/current_weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  TextEditingController searching = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getData('Malappuram');
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
                  context.read<HomeProvider>().getData(place);
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
            if (context.watch<HomeProvider>().data != null)
              currentweather(
                Icons.wb_sunny_rounded,
                '${context.watch<HomeProvider>().data!.temp}',
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
            if (context.watch<HomeProvider>().data != null)
              additionalinfos(
                '${context.watch<HomeProvider>().data!.wind}',
                '${context.watch<HomeProvider>().data!.humidity}',
                '${context.watch<HomeProvider>().data!.pressure}',
                '${context.watch<HomeProvider>().data!.feels_like}',
              ),
          ],
        ),
      ),
    );
  }
}
