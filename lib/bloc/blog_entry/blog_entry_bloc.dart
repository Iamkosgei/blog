import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog/models/models.dart';
import 'package:blog/repositories/repos.dart';
import 'package:meta/meta.dart';

part 'blog_entry_event.dart';
part 'blog_entry_state.dart';

class BlogEntryBloc extends Bloc<BlogEntryEvent, BlogEntryState> {
  final BlogRepo blogRepo;
  BlogEntryBloc(this.blogRepo) : super(BlogEntryInitial());

  @override
  Stream<BlogEntryState> mapEventToState(
    BlogEntryEvent event,
  ) async* {
    if (event is FetchBlogEntry) {
      try {
        var _res = await blogRepo.getBlogEntry(event.id);
        yield BlogEntryLoaded(_res);
      } catch (e) {
        yield BlogEntryError(e);
      }
    }
  }
}
