import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import '../ temps/userloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './loading.dart';








class map extends StatefulWidget {
  map({Key key}) : super(key: key);

            
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  
 Position currentLocation;


  List<Userloc> list=[];

  List<Marker> _markers=[];



  void _setmarker() async
  {
    LatLng point ;
    final currentLocation2 = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    
    final response =
        await http.get('http://172.105.48.196:8000/workerlookup/list/');
    List<Userloc> list=jsonDecode(response.body).map<Userloc>((json) => Userloc.fromJson(json)).toList();

  List<Marker> markers = list.map((n) {

    try{
       
        point = LatLng(double.parse(n.lat), double.parse(n.lng));
       

    } catch(e)
    {
      print(e);
    }
    
    
    return Marker(
      width: 80.0,
      height: 80.0,
      point: point,
      builder: (ctx) => Container(
            child: Icon(
              Icons.location_on,
              color: Colors.green[700],
              size: 30.0,
            ),
          ),
    );
  }).toList();
  

  Marker marker2=new Marker(
    width: 80.0,
      height: 80.0,
      point: LatLng(currentLocation2.latitude,currentLocation2.longitude),
      builder: (ctx) => Container(
            child: Image.network('https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png')
          ),
  );

  setState(() {
    currentLocation=currentLocation2;
    _markers.clear();
    _markers = markers;
    _markers.add(marker2);
  });
    }

   
         
        



         
         
        
         
         
           @override
           void initState() {
             
                   _setmarker();
                   super.initState();
                            }
         
         
         
           @override
           Widget build(BuildContext context) {
             return 
             
             
            mapbuild(context,currentLocation,_markers);
             
             
           }
         }


         


 



  Widget mapbuild(BuildContext context,Position currentLocation,List<Marker> 
            _markers) {

               
                          if(currentLocation==null)
                          {
                            return loading();
                          }
              else{

              
                    return new FlutterMap(
                              options: new MapOptions(
        
                              center: new LatLng(currentLocation.latitude,currentLocation.longitude),
                              minZoom: 18.0,
                                                    ),
                      layers: [
                          new TileLayerOptions(
                          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a','b','c'],
         
                                              ),
                              new MarkerLayerOptions(

          
        
                                  markers:
                                  _markers, 
        ),
      ],

      
    );
                  }}
                  

              
   

    
    

  



