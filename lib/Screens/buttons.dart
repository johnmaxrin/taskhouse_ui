import 'package:flutter/material.dart';
import 'package:link_ui/Screens/first.dart';

class buttonsmain extends StatefulWidget {
  buttonsmain({Key key}) : super(key: key);

  _buttonsmainState createState() => _buttonsmainState();
}

class _buttonsmainState extends State<buttonsmain> {
  @override
  Widget build(BuildContext context) {
    return new Align(
      alignment: Alignment.bottomCenter,
      
      
      child:new Material(
    
      color: Colors.transparent,
      child:new Container(
        padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 100.0),
        child:
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'home',
            child: new Icon(
              Icons.home,color: Colors.black,size: 30.0,
              
            ),
            backgroundColor: Colors.white,
            onPressed: (){
              Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => 
                                    first())
                                  );
            },
          ),
          FloatingActionButton(
            heroTag: 'explore',
            child: new Icon(
              Icons.explore,color: Colors.black,size: 30.0,
            ),
            backgroundColor: Colors.white,
            onPressed: ()=>{},
          ),

          FloatingActionButton(
            heroTag: 'setting',
            child: new Icon(
              Icons.settings,color: Colors.black,size: 30.0,
            ),
            backgroundColor: Colors.white,
            onPressed: ()=>{
              
            },
          )
        ],
      ),
      )
          
      ),
       
    ); 
  }
}

