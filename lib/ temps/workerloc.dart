

class Worker {
  final int id;
  final String name;
  final String uid;
  final String lat;
  final String lng;
  final String loc;
  final String avatar;
 
  Worker({this.id,this.name, this.uid, this.lat, this.lng,this.loc,this.avatar});
 
  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      id:json['id'],
      name: json['name`'],
      uid: json['uid'],
      lat: json['lattitude'],
      lng: json['longitude'],
      loc:json['location'],
      avatar:json['avatar']
    );
  }
 
  Map toMap() {
    var map = new Map<String,dynamic>();
    map["name"] = name;
    map["uid"] = uid;
    map["lattitude"] = lat;
    map["longitude"] = lng;
    map["location"] =loc;
    map["avatar"]=avatar;
 
    return map;
  }
}

