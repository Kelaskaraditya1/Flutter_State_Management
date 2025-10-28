import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/usingProviders/providers/HomeScreenProvider.dart';
import 'package:state_management/usingProviders/providers/SettingsProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w500
          ),
        ),
        backgroundColor: Colors.red,
        actions: [

          Consumer<SettingsProvider>(builder: (context,provider,child){
            return IconButton(onPressed: (){
              Provider.of<SettingsProvider>(context,listen: false).changeTheme(
                provider.theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light
              );
            }, icon: provider.themeIcon);

          })

        ],
      ),
      body:  Container(
        height: double.infinity,
          width: double.infinity,
            child: Center(
              child: Consumer<HomeScreenProvider>(builder: (context,provider,child){
                return Text("${provider.counter}"
                  ,style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.black
                  ),
                );
              },
              ),
            ),
        ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Provider.of<HomeScreenProvider>(context,listen: false).incrementCounter();
      },
        backgroundColor: Colors.greenAccent,
      child: Icon(Icons.add,
      size: 30,
      color: Colors.black,
        ),
      ),
    );
  }
}
