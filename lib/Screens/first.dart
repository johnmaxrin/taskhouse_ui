import 'package:flutter/material.dart';
import './map.dart' as map;
import '../Screens/work.dart';
import '../Screens/worker.dart';

class first extends StatefulWidget {
  first({Key key}) : super(key: key);

  _firstState createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return 

    new Container(
      
      color: const Color(0xFF967BE2),
      child: new Center(
      
      child: new Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
                  new Material( 
                    color: Colors.transparent,
                    child:
                       new Container(
              child: Text('link',
              style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      letterSpacing: 10.0,
                      fontSize: 80.0,
                      decoration: null
                  ),
                ),
              ),
          ),
          

          new Material(
                color: Colors.transparent,
                child: new Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text('Welcome to Link, you can work and get some money or can hire the best to get things done! All the best!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                          
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontSize: 20.0,
                  ),),
                ),
          ),
          
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
                
                new Container(
                margin: EdgeInsets.fromLTRB(30, 50, 0, 0),
                height: 150,
                width: 150,
                child:
                  FloatingActionButton(
                    heroTag: 'Work',
                    child: Text("Work",style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Raleway',
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal
                  ),),backgroundColor: Colors.white,onPressed: (){

                      Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => 
                                    worker())
                                  );

                  },),
          ),

                new Container(
                margin: EdgeInsets.fromLTRB(0, 50, 30, 0),
                height: 150,
                width: 150,
                child:
                  FloatingActionButton(
                    heroTag: 'Hire',
                    child: Text("Hire",style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Raleway',
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal
                  ),),backgroundColor: Colors.white,onPressed: (){

                    
                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => 
                                    work())
                                  );
                  }),
          ),
              ],
            ),

        new Material( 
                    color: Colors.transparent,
                    child:
                       new Container(
              padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: Text('Any Suggestion? Ping us here',
              style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      fontSize: 20.0,
                      decoration: null
                  ),
                ),
              ),
          ),

        ],
      )
    )
    );
    
   
      
  }


}