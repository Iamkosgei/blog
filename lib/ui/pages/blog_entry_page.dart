import 'package:blog/bloc/blog_entry/blog_entry_bloc.dart';
import 'package:blog/repositories/repos.dart';
import 'package:blog/ui/widgets/widgets.dart';
import 'package:blog/utils/locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogEntryPage extends StatelessWidget {
  final String id;

  const BlogEntryPage({Key key, @required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Blog entry"),
        ),
        body: BlocProvider(
          create: (context) =>
              BlogEntryBloc(locator.get<BlogRepo>())..add(FetchBlogEntry(id)),
          child: BlocBuilder<BlogEntryBloc, BlogEntryState>(
              builder: (context, state) {
            if (state is BlogEntryLoaded) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * 1 / 3,
                      width: size.width,
                      child: CachedNetworkImage(
                        imageUrl: state.blog.imageUrl,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress)),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Text(
                      "${state.blog.title}",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is BlogEntryError) {
              return Center(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${state.error}"),
                      SizedBox(
                        height: 10,
                      ),
                      PrimaryButton(
                        txt: "Retry",
                        onPressed: () {
                          context.read<BlogEntryBloc>().add(FetchBlogEntry(id));
                        },
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ));
  }
}
