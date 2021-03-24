part of 'blog_entry_bloc.dart';

@immutable
abstract class BlogEntryEvent {}

class FetchBlogEntry extends BlogEntryEvent {
  final String id;

  FetchBlogEntry(this.id);
}
