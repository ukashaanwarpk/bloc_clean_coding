import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/data/response/api_response.dart';
import 'package:bloc_clean_coding/repository/movies/movies_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_clean_coding/model/movies/movies_model.dart';
part 'movies_state.dart';
part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository})
    : super(MoviesState(apiResponse: ApiResponse.loading())) {
    on<FetchMovies>(_fetchMovies);
  }

  void _fetchMovies(FetchMovies event, Emitter<MoviesState> emit) async {
    await moviesRepository
        .fetchMoviesList()
        .then((value) {
          emit(state.copyWith(apiResponse: ApiResponse.completed(value)));
        })
        .onError((error, stackTrack) {
          emit(
            state.copyWith(apiResponse: ApiResponse.error(error.toString())),
          );
        });
  }
}
