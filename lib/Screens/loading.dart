
import 'package:flutter/material.dart';

class loading extends StatefulWidget {
  loading({Key key}) : super(key: key);

  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
       child: Center(
         child: Container(
           
           child: new CircularProgressIndicator()),
       ),
    );
  }
}