import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/constant/color.dart';
import 'package:social_media_app/provider/connectivity_provider.dart';
import 'package:social_media_app/screens/home_screen.dart';
import 'package:social_media_app/screens/tabs_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => ConnectivityProvider(),
            child: TabsScreen()
          )
        ],
      child: MaterialApp(
         title: "Posts",
          debugShowCheckedModeBanner: false,
          home: TabsScreen(),
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: primary,
        ),
      )
    );
  }
}




