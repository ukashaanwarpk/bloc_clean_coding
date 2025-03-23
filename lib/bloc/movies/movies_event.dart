part of 'movies_bloc.dart';

abstract class MoviesEvent {
  const MoviesEvent();
}

class FetchMovies extends MoviesEvent {}
