import 'package:flutter/material.dart';

import 'package:link_ui/%20temps/workerloc.dart';
import '../requests/workerloc.dart';
import 'package:geolocator/geolocator.dart';
import '../Screens/loading.dart';
import '../Screens/notify.dart';
 
import 'package:flutter/cupertino.dart';

class worker extends StatefulWidget {
  worker({Key key}) : super(key: key);

  _workerState createState() => _workerState();
}

class _workerState extends State<worker> {

  final Future<Worker> worker=null;
  TextEditingController name=new TextEditingController();
  TextEditingController uid=new TextEditingController();
  Position loc;
  double lat,lng;

 
 

  @override
  void initState() {
    
     getloc();
     super.initState();

  }

  




  void getloc() async{
final loc2 = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    
   
      setState(() {
        loc=loc2;
         lat=loc.latitude;
     lng=loc.longitude;
      });
  }



  @override
  Widget build(BuildContext context) {

   

    if(loc==null)
    {
      return loading();
    }

    else{

    
    return Scaffold(
          body: Container(

        color: const Color(0xFF967BE2),
         child: Center(
           child: new Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[

                  new Material(
                  color: Colors.transparent,
                  child: new Container(
                    margin: EdgeInsets.all(30),
                    child: Text('Work through link and earn as much as you can! This is a beta version',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                            
                            color: Colors.white,
                            fontFamily: 'Raleway',
                            fontSize: 20.0,
                    ),),
                  ),
            ),


                Container(
                  padding: EdgeInsets.all(15),
                  child: new Material(
                    
                    color: Colors.white,
                    child: new Container(
                       
                      child: TextField(
                        controller: name,
                         decoration: InputDecoration(
                           
                           labelText: "Name",
                        hintText: "Eg John",
                        prefixIcon: Icon(Icons.account_box),
  ),
                      )
                    ),
                  ),
                ),




                 Container(
                  padding: EdgeInsets.all(15),
                  child: new Material(
                    
                    color: Colors.white,
                    child: new Container(
                       
                      child: TextField(
                         controller: uid,
                         
                         decoration: InputDecoration(
                           labelText: "UID",
                        hintText: "Eg WEIR7845",
                        prefixIcon: Icon(Icons.security),
  ),
                      )
                    ),
                  ),
                ),

                 Container(
                   padding: EdgeInsets.all(15),
                   child: new Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: <Widget>[
                       new Container(
                         
                         height: 45,
                         width: 90,
                         padding: EdgeInsets.all(4),
                         color: Colors.transparent,
                         child: Center(
                           child: new Material(
                             
                             child: Builder(
                                builder:(context)=> new RaisedButton(
                      onPressed: (){

                        if(uid.text!=''||name.text!='')
                          {
                            print('eer');
                            postns();
                            //shownotificaton();

                                // String loc='POINT('+lng.toString()+' '+lat.toString()+')';
                         
                          // Worker newworker=Worker(lat:lat.toString(),lng:lng.toString(),name:name.text,uid: uid.text ,loc:loc,avatar:"http://google.com" );
                          // Future<int> id= createPost('http://10.0.2.2:8000/workerlookup/list/',newworker);
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>notifyme(id:id)));
                          }

                          else{
                           Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('All Fields are Important'),
                        duration: Duration(seconds: 3),
                      ));

                          }
                          

                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      padding: const EdgeInsets.all(5),
                      child: new Text(
                        "Notify Me",
                      ),
                    ),
                             ),
                             
                           ),
                         )
                         
                       )
                     ],
                   ),
                 )

             ],
           )
         ),
      ),
    );
  }
}

postns() async

{                         String loc='POINT('+lng.toString()+' '+lat.toString()+')';
                          Worker newworker=Worker(lat:lat.toString(),lng:lng.toString(),name:name.text,uid: uid.text ,loc:loc,avatar:"http://google.com" );
                          final  id= await createPost('http://172.105.48.196:8000/workerlookup/list/',newworker);
                          print(id);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>notifyme(id:id)));
}

}