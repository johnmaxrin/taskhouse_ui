import 'package:flutter/material.dart';

class searchbox extends StatefulWidget {
  searchbox({Key key}) : super(key: key);

  _searchboxState createState() => _searchboxState();
}

class _searchboxState extends State<searchbox> {
  @override
  Widget build(BuildContext context) {
    return searchboxreturn();
  }
}




Widget searchboxreturn()
         {
           return new Container(
             padding: EdgeInsets.fromLTRB(40.0,10.0,40.0,10.0),
             
             margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
             
             child: new Material(
               color: Colors.white,
               elevation: 10.0,
               shadowColor: Colors.black,
               child: TextField(
                onChanged: (value) {
                  
                },
                // controller: editingController,
                decoration: InputDecoration(
                    
                    labelText: "Search",
                    hintText: "Eg Painter",
                    prefixIcon: Icon(Icons.search),
                     
                    // focusColor: Colors.white,
                    // fillColor: Colors.white,
                    // hoverColor: Colors.white,
                  
                   
                        
           ),
             )));
             
             
             
         }
   