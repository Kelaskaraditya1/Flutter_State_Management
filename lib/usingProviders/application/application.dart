import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/usingProviders/providers/HomeScreenProvider.dart';
import 'package:state_management/usingProviders/providers/SettingsProvider.dart';
import 'package:state_management/usingProviders/screens/home_screen.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context) => SettingsProvider() ,
      child: Consumer<SettingsProvider>(builder: (context,provider,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: provider.theme,
          darkTheme: ThemeData.dark(),
          home: ChangeNotifierProvider(create: (context) => HomeScreenProvider(),
            child: HomeScreen(),
            ),
          );
        }
      ),
    );
  }
}
