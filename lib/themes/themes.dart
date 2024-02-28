import 'package:flutter/material.dart';


ThemeData amberLight = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26)
);

ThemeData lightModePink = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.pink.shade300,
      primary: Colors.pink.shade200,
      secondary: Colors.pink.shade400,
      inversePrimary: Colors.pink.shade800,
      onBackground: Colors.pink.shade500,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.pink[800],
      displayColor: Colors.purple,
    ));

ThemeData darkModePink = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.pink.shade900,
      primary: Colors.pink.shade800,
      secondary: Colors.pink.shade700,
      inversePrimary: Colors.pink.shade300,
      onBackground: Colors.pink.shade500,
    ),textTheme: ThemeData.light().textTheme.apply(
  bodyColor: Colors.pink[300],
  displayColor: Colors.pink.shade50,
));

ThemeData lightModeGreen = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.green.shade300,
      primary: Colors.green.shade200,
      secondary: Colors.green.shade400,
      inversePrimary: Colors.green.shade800,
      onBackground: Colors.green.shade500,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.green[800],
      displayColor: Colors.white,
    ));

ThemeData darkModeGreen = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.green.shade900,
      primary: Colors.green.shade800,
      secondary: Colors.green.shade700,
      inversePrimary: Colors.green.shade300,
      onBackground: Colors.green.shade500,
    ),textTheme: ThemeData.light().textTheme.apply(
  bodyColor: Colors.green[300],
  displayColor: Colors.green.shade50,
));
ThemeData lightModeAmber = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.amber.shade300,
      primary: Colors.amber.shade200,
      secondary: Colors.amber.shade400,
      inversePrimary: Colors.amber.shade800,
      onBackground: Colors.amber.shade500,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.amber[800],
      displayColor: Colors.amber[900],
    ));

ThemeData darkModeAmber = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.amber.shade900,
      primary: Colors.amber.shade800,
      secondary: Colors.amber.shade700,
      inversePrimary: Colors.amber.shade300,
      onBackground: Colors.amber.shade500,
    ),textTheme: ThemeData.light().textTheme.apply(
  bodyColor: Colors.amber[300],
  displayColor: Colors.amber.shade50,
));


ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade300,
      primary: Colors.grey.shade200,
      secondary: Colors.grey.shade400,
      inversePrimary: Colors.grey.shade800,
      onBackground: Colors.grey.shade500,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.grey[800],
      displayColor: Colors.black,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade300,
      onBackground: Colors.grey.shade500,
    ),textTheme: ThemeData.light().textTheme.apply(
  bodyColor: Colors.grey[300],
  displayColor: Colors.grey.shade50,
));







