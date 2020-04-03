
import 'package:link_ui/helpers/notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../requests/workerloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';



class notifyme extends StatefulWidget with WidgetsBindingObserver{
  final id;
   
  notifyme({Key key,@required this.id}) : super(key: key);
  
  _notifymeState createState() => _notifymeState();
}


class _notifymeState extends State<notifyme> {

  String _message = '';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

    _register() {
    _firebaseMessaging.getToken().then((token) => print(token));
  }

    void getMessage(){
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
      setState(() => _message = message["notification"]["title"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["title"]);
    });
  }

  @override
  void dispose() {
    backbtn();
    //deletePost(widget.id);
    super.dispose();
  }



  @override
  void initState() { 
    _register();
    getMessage();
    super.initState();

    
  }
Future<bool> backbtn()
{
  return showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      title: Text('Do you Really want to stop broadcasting?'),
      actions: <Widget>[
        FlatButton(
          child: Text('No'),
          onPressed: ()=>Navigator.pop(context,false),
        ),

        FlatButton(
          child: Text('Yes'),
          onPressed: ()=>{
            deletePost(widget.id),
          //Notification Delete!! 
          Navigator.of(context).popUntil((route) => route.isFirst)
          },
        )
      ],
    )
  );
}


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: backbtn,
          child: Material(
        color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[


            Container(
              margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
child: Text('Broadcasting',style: TextStyle(
  color:Colors.white,
  fontSize: 50.0,
  fontFamily: 'Raleway',
),),
            ),
            
            Container(
               child: SpinKitChasingDots(
                 
  color: Colors.white,
  size: 150.0,
)
            ),


            Container(
              margin: EdgeInsets.all(50),
              height: 50,
              child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          return showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      title: Text('Do you Really want to stop broadcasting?'),
      actions: <Widget>[
        FlatButton(
          child: Text('No'),
          onPressed: ()=>Navigator.pop(context,false),
        ),

        FlatButton(
          child: Text('Yes'),
          onPressed: ()=>{
            deletePost(widget.id),
          //Delete Notification Here!! 
          Navigator.of(context).popUntil((route) => route.isFirst)
          },
        )
      ],
    )
  );
        },
        textColor: Colors.white,
        child: Center(
          child: Text('Stop Broadcasting',style: TextStyle(color: Colors.black,fontFamily: 'raleway',fontWeight: FontWeight.w700,fontSize: 17),),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
            )

          ],

          
        ),
      ),
    );
  }
}