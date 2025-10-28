import 'package:flutter/cupertino.dart';
import 'package:state_management/usingProviders/application/application.dart';

void main() {
  runApp(Application());
}

/*
* Providers: Used for State Mangement in Flutter applications.
*
* to add Provider package, use flutter pub add provider.
*
* now there are 3 main steps to use Provider package:
*
* 1) create a Provider class for a screen or the whole application and than add with ChangeNotifier
*  than add the values and function to update those values and call notifyListeners() after updating the values.
*
* for eg: class HomeScreenProvider with ChangeNotifier{
  int counter =0;

  void incrementCounter(){
    counter++;
    notifyListeners();
  }
}
*
* 2) when we have to use the provider to a certain screen while calling the Screen widget wrap it around ChangeNotifierProvider
*
* for eg: ChangeNotifierProvider(create: (context) => HomeScreenProvider(),  this joins the Provider to the screen.
             child: HomeScreen(), this calls the screen widget.
             ),
             *
             * 3) now to use the provider values and functions in the screen we have two ways:
             * for using the value we have to wrap the widget with Consumer<ProviderClassName>

             * for eg: Consumer<HomeScreenProvider>(builder: (context,provider,child){
                 return Text("${provider.counter}"  // we are using the counter value from the HomeScreenProvider
                   ,style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 22,
                       color: Colors.black
                   ),
                 );
               },
               ),
               *
               * for using/updating the functions of the provider we can use Provider.of<ProviderClassName>(context,listen: false).functionName()
               *
               * for eg: FloatingActionButton(onPressed: (){
               * Provider.of<HomeScreenProvider>(context,listen: false).incrementCounter(); // we are using the incrementCounter function from the HomeScreenProvider
               * },
               *
               * we can also combine ChangeNotifierProvider and Consumer by wrapping Consumer as a child in ChangeNotifierProvider.
               *
               * for eg: ChangeNotifierProvider(create: (context) => SettingsProvider() ,
               *      child: Consumer<SettingsProvider>(builder: (context,provider,child){
               *       return IconButton(onPressed: (){
               *         Provider.of<SettingsProvider>(context,listen: false).changeTheme(  // using the provider for updating the theme/data/value.
               *         provider.theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light
               *       );
               *     }, icon: provider.themeIcon); // using the provider value for icon/data/value.
               *   })
               *
*
* */