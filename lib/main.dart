import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import './screens/onboarding_screen.dart';
import './screens/login_screen.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/login_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'ReadexPre',
          primarySwatch: Colors.blue,
        ),
        home: LogiPage(),
      ),
    );
  }
}
