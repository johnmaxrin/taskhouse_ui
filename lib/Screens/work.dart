import 'package:flutter/material.dart';
import '../Screens/map.dart';
import '../Screens/searchbox.dart';
import '../Screens/buttons.dart';
import 'map.dart';

class work extends StatefulWidget {
  work({Key key}) : super(key: key);

  _workState createState() => _workState();
}

  // Container(
      
  //     child:  new MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //     title: "Link",
  //     home: 
  //       new Container(
  //         child: new Stack(
  //           children: <Widget>[
            
  //           //work(),
  //           first()
  //           ],
  //         ),
  //       )

        
  //     ),
  //   );

class _workState extends State<work> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
          child: new MaterialApp(
        title: 'Hire Linkers',    
        home: new Container(
        child: new Stack(
            children: <Widget>[
                    
                  map(),
                  searchbox(),
                  buttonsmain(),
            ],
                        
        ),
      ),
          ),
    );
  }

  
}

