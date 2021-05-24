import 'package:flutter/cupertino.dart';

import 'screens/university_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'LV 8',
      home: UniversityScreen(),
    );
  }
}
