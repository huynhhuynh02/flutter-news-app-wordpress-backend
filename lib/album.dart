class Album{
  final int id;
  final int userID;
  final String title;
  Album({this.id,this.userID,this.title});
  factory Album.fromJson(Map<String, dynamic> json){
    return Album(
      userID: json['userID'],
      id: json['id'],
      title: json['title'],
    );
  }
}