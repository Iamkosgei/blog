import 'package:blog/models/blog.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BlogListItem extends StatelessWidget {
  final Blog blog;

  const BlogListItem({Key key, @required this.blog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: -12,
            offset: Offset(0, 10),
            color: Colors.green.withOpacity(0.2),
            blurRadius: 25,
          ),
        ],
      ),
      padding: EdgeInsets.all(4.0),
      child: GridTile(
        child: CachedNetworkImage(
          imageUrl: blog.imageUrl,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress)),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        footer: Container(
            padding: EdgeInsets.all(4.0),
            color: Colors.black.withOpacity(
              .5,
            ),
            child: Text(
              "${blog.title}",
              style: TextStyle(
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}
