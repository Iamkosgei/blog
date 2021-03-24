import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog/models/models.dart';
import '../../repositories/repos.dart';
import 'package:meta/meta.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepo blogRepo;
  BlogBloc({@required this.blogRepo}) : super(BlogInitial());

  @override
  Stream<BlogState> mapEventToState(
    BlogEvent event,
  ) async* {
    if (event is FetchBlogList) {
      yield BlogLoading();

      try {
        var _res = await blogRepo.getBlogList();

        yield BlogLoaded(_res);
      } catch (e) {
        yield BlogError('$e');
      }
    }
  }
}
