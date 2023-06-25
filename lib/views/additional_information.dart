import 'package:flutter/widgets.dart';

//titleFont
TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
//info font
TextStyle infoFont =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);
Widget additionalInformation(
    String wind, String humidity, String pressure, String feel_like) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
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
                Text(
                  "Wind",
                  style: infoFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  "Pressure",
                  style: infoFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$wind",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  "$pressure",
                  style: titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Humidity",
                  style: infoFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  "Feels Like",
                  style: infoFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$humidity",
                  style: infoFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  "$feel_like",
                  style: infoFont,
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
