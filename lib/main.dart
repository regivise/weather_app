import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:weather_app/views/additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  // Initial Selected Value

  Weather? data;
// Step 1.
  String dropdownValue = 'Nairobi';

  Future<void> getData() async {
    data = await client.getCurrentWeather(dropdownValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 182, 216, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(171, 148, 148, 245),
        elevation: 0.0,
        title: const Text(
          'Kenyan Cities Weather',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //custom widget
                currentWeather(
                    Icons.thermostat, "${data!.temp}", "${data!.cityName}"),
                const SizedBox(
                  height: 60.0,
                ),
                const Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xdd212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 20.0,
                ),
                //additional info widget
                additionalInformation("${data!.wind}", "${data!.humidity}",
                    "${data!.pressure}", "${data!.feels_like}"),
                const Divider(),
                const Text(
                  "Choose Kenyan City",
                ),

                //dropdown button
                DropdownButton<String>(
                  value: dropdownValue,

                  items: <String>[
                    'Nairobi',
                    'Kisumu',
                    'Mombasa',
                    'Nakuru',
                    'Eldoret',
                    'Malindi'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
