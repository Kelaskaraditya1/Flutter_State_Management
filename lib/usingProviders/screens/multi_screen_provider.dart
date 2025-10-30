import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/usingProviders/providers/Counter1Provider.dart';

import '../providers/Counter2Provider.dart';
import '../providers/Counter3Provider.dart';

class MultiScreenProvider extends StatelessWidget {
  const MultiScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Screen Provider"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Consumer<Counter1Provider>(builder: (context,provider,child){
              return Text(provider.counter.toString(),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              );
              }
            ),
            ElevatedButton(onPressed: (){
              Provider.of<Counter1Provider>(context,listen: false).incrementCounter();
              }, child: Text("Counter 1")
            ),

            SizedBox(height: 20),

            Consumer<Counter2Provider>(builder: (context,provider,child){
              return Text(provider.counter.toString(),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              );
            }
            ),
            ElevatedButton(onPressed: (){
              Provider.of<Counter2Provider>(context,listen: false).incrementCounter();
            }, child: Text("Counter 1")
            ),

            SizedBox(height: 20),

            Consumer<Counter3Provider>(builder: (context,provider,child){
              return Text(provider.counter.toString(),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              );
            }
            ),
            ElevatedButton(onPressed: (){
              Provider.of<Counter3Provider>(context,listen: false).incrementCounter();
            }, child: Text("Counter 1")
            ),

          ],
        ),
      ),
    );
  }
}
