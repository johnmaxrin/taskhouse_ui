 

class Userloc
{
 final String name;
  final String uid;
  final String lat;
  final String lng;
  final String loc;
  final String avatar;
 
  Userloc({this.name, this.uid, this.lat, this.lng,this.loc,this.avatar});
 
  factory Userloc.fromJson(Map<String, dynamic> json) {
    return Userloc(
      name: json['name`'],
      uid: json['uid'],
      lat: json['lattitude'],
      lng: json['longitude'],
      loc:json['location'],
      avatar:json['avatar']
    );
  }

}

       /* "id": 4,
        "uid": "IUFI889",
        "lattitude": "12.93502",
        "longitude": "77.6140217",
        "avatar": "http://google.com",
        "name": "Robin",
        "location": "SRID=4326;POINT (77.6140217 12.93502)"*/