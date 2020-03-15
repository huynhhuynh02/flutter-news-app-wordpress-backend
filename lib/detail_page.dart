import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
class DetailPage extends StatelessWidget{
  wp.Post post;
  DetailPage(this.post);
  _getImagePost(){
    if(post.featuredMedia==null){
      return SizedBox(height: 5.0,);
    }
    else{
      return Image.network(post.featuredMedia.sourceUrl);
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail post")
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Text(
                post.title.rendered.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              _getImagePost(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(post.author.name),
                  Text(post.date.toString())
                ],
              ),
              Html(
                data: post.content.rendered.toString(),
              )
            ],
          ),
        ),
      ),
    );
  }
}