import 'package:bloc_clean_coding/model/movies/movies_model.dart';

abstract class MoviesRepository {
  Future<MoviesModel> fetchMoviesList();
}
