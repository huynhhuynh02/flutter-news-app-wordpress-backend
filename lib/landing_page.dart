import 'package:demoapp/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

class LandingPage extends StatelessWidget{
  wp.WordPress wordpress = wp.WordPress(
    baseUrl: 'https://techtalk.vn/',
  );
  // fetch posts
  _fetchPost(){
    Future<List<wp.Post>> posts = wordpress.fetchPosts(
        postParams:wp.ParamsPostList(
          context: wp.WordPressContext.view,
          pageNum: 1,
          perPage: 10
        ),
        fetchAuthor: true,
        fetchFeaturedMedia: true,
        fetchComments: true
    );
    return posts;
  }
  //fetch Image post
  _getPostImage(wp.Post post){
    if(post.featuredMedia==null){
      return SizedBox();
    }else{
      return Image.network(
        post.featuredMedia.sourceUrl,
        fit: BoxFit.cover,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Test Wordpress Api',
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Wordpress API'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: Container(
          child: FutureBuilder(
            future:_fetchPost(),
            builder: (BuildContext context, AsyncSnapshot<List<wp.Post>> snapshot){
              if(snapshot.connectionState == ConnectionState.none){
                return Container();
              }
              else if(snapshot.connectionState==ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  wp.Post post = snapshot.data[index];
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => DetailPage(post)
                        )
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Card(

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: 110,
                              height: 90,
                              child: _getPostImage(post),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: MediaQuery.of(context).size.width-130,
                              child:Column(
                                children: <Widget>[
                                  Text(
                                    post.title.rendered.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor
                                    ),
                                  ),
                                  Html(
                                    data: post.excerpt.rendered.toString(),
                                  )
                                ],
                                ),
                            ),
                            SizedBox(height: 50,),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        )
      ),
    );
  }
}