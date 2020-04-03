import 'dart:async';

import 'package:flutter/material.dart';
import './Screens/first.dart';
import 'package:connectivity/connectivity.dart';


 
 void main() async

{
  WidgetsFlutterBinding.ensureInitialized();
  var connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile) {
  print("Connected to Mobile Network");
  runApp(new Link());
} else if (connectivityResult == ConnectivityResult.wifi) {
  print("Connected to WiFi");
  runApp(new Link());
} else {
  print("Unable to connect. Please Check Internet Connection");
  runApp(new Nointernet());
}
  
}
 

class Link extends StatefulWidget {
  Link({Key key}) : super(key: key);

  _LinkState createState() => _LinkState();
}

class _LinkState extends State<Link> {

 @override
  Widget build(BuildContext context) {
    return  Container(
      
      child:  new MaterialApp(
        debugShowCheckedModeBanner: false,
      title: "Link",

      routes: <String,WidgetBuilder>
      {
        '/home': (BuildContext context) =>new first(),
      },
     

      home: 
        new Container(
          child: new Stack(
            children: <Widget>[

            first()
            ],
          ),
        )

        
      ),
    );
  }
}


class Nointernet extends StatefulWidget {
  Nointernet({Key key}) : super(key: key);

  _NointernetState createState() => _NointernetState();
}

class _NointernetState extends State<Nointernet> {
    var _connectionStatus = 'Unknown';
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

   @override
  void initState() {
 
    super.initState();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatus = result.toString();
      print(_connectionStatus);
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        print('Connected!!');
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => new Link()),
            );
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      
       child: Center(child: Text('No Internet!!',textDirection: TextDirection.ltr,)),
    );
  }
}