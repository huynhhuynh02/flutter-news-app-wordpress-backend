import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'album.dart';
import 'landing_page.dart';

void main() => runApp(LandingPage());

//Future<Album> fetchAlbum() async{
//  final response =await http.get('https://jsonplaceholder.typicode.com/albums/1');
//  if(response.statusCode==200){
//    return Album.fromJson(json.decode(response.body));
//  }
//}
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//class _MyAppState extends State<MyApp>{
//  Future<Album> futureAlbum;
//  @override
//  void initState() {
//
//    // TODO: implement initState
//    super.initState();
//    futureAlbum = fetchAlbum();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      title: 'Sample app fech Api',
//      theme: ThemeData(
//        primaryColor: Colors.green
//      ),
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Sample app')
//        ),
//        body: Center(
//          child: FutureBuilder<Album>(
//            future: futureAlbum,
//            builder: (context, snapshot){
//              if(snapshot.hasData){
//                return Text(snapshot.data.title);
//              }else if(snapshot.hasError){
//                return Text("${snapshot.error}");
//              }
//              return CircularProgressIndicator();
//            },
//          ),
//        ),
//      ),
//    );
//  }
//}


