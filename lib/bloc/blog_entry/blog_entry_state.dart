part of 'blog_entry_bloc.dart';

@immutable
abstract class BlogEntryState {}

class BlogEntryInitial extends BlogEntryState {}

class BlogEntryLoading extends BlogEntryState {}

class BlogEntryLoaded extends BlogEntryState {
  final Blog blog;

  BlogEntryLoaded(this.blog);
}

class BlogEntryError extends BlogEntryState {
  final String error;

  BlogEntryError(this.error);
}
