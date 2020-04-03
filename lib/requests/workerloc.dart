import 'package:link_ui/%20temps/workerloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 

Future<int> createPost(String url, Worker w) async {
  //Map userHeader = {"Content-type": "application/json"};
  print(w);
   var response = await http.post(url, body: {'name':w.name,'avatar':w.avatar,'lattitude':w.lat,'longitude':w.lng,'location':w.loc,'uid':w.uid});
   print('Response status: ${response.statusCode}');
   int id = jsonDecode(response.body)['id'];
   return id;
}

deletePost(final id) async{
  print('Hello');
  var response=await http.delete('http://172.105.48.196:8000/workerlookup/list/'+id.toString()+'/');
  print('Broadcasting Stopped!');
  print(response.statusCode);
  
}