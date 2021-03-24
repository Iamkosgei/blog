import 'package:blog/bloc/blog_bloc/blog_bloc.dart';
import 'package:blog/repositories/repos.dart';
import 'package:blog/services/services.dart';
import 'package:blog/ui/widgets/widgets.dart';
import 'package:blog/utils/locator.dart';
import 'package:blog/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/blog_list_item.dart';

class BlogListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app_outlined),
              onPressed: () {
                showAlertDialog(context);
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) =>
              BlogBloc(blogRepo: locator.get<BlogRepo>())..add(FetchBlogList()),
          child: BlocBuilder<BlogBloc, BlogState>(
            builder: (context, state) {
              if (state is BlogLoaded) {
                var _blogs = state.blogs;
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: _blogs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          locator.get<NavigationService>().navigateTo(
                              blogEntryPage,
                              args: _blogs[index].id);
                        },
                        child: BlogListItem(
                          blog: _blogs[index],
                        ),
                      );
                    });
              } else if (state is BlogError) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Text(state.error),
                        SizedBox(
                          height: 10,
                        ),
                        PrimaryButton(
                          txt: "Retry",
                          onPressed: () {
                            context.read<BlogBloc>().add(FetchBlogList());
                          },
                        )
                      ])),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Text(
        "Logout?",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      actions: [
        Container(
            height: 60,
            width: context.size.width,
            child: PrimaryButton(
              txt: "Yes",
              onPressed: () async {
                bool _clearData =
                    await locator.get<SharedPreferenceService>().clearData();
                if (_clearData) {
                  locator
                      .get<NavigationService>()
                      .navigateTo(loginPageRoute, clearBackStack: true);
                }
              },
            )),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
