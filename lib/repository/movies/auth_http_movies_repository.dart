import 'package:bloc_clean_coding/config/app_url.dart';
import 'package:bloc_clean_coding/data/network/network_api_service.dart';
import 'package:bloc_clean_coding/model/movies/movies_model.dart';
import 'package:bloc_clean_coding/repository/movies/movies_repository.dart';

class AuthHttpMoviesRepository extends MoviesRepository {
  final _api = NetworkApiService();

  @override
  Future<MoviesModel> fetchMoviesList() async {
    final response = await _api.getApi(AppUrl.popularMoviesListEndPoint);

    return MoviesModel.fromJson(response);
  }
}
