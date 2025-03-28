import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/data/response/api_response.dart';
import 'package:bloc_clean_coding/repository/movies/movies_repository.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_clean_coding/model/movies/movies_model.dart';
part 'movies_state.dart';
part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository})
    : super(MoviesState(apiResponse: ApiResponse.loading())) {
    on<FetchMovies>(_fetchMovies);
    on<FetchMoreMovies>(_fetchMoreMovies);
  }

  void _fetchMovies(FetchMovies event, Emitter<MoviesState> emit) async {
    await moviesRepository
        .fetchMoviesList()
        .then((value) {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.completed(value),
              hasMore: value.tvShow.isNotEmpty,
            ),
          );
        })
        .onError((error, stackTrack) {
          emit(
            state.copyWith(apiResponse: ApiResponse.error(error.toString())),
          );
        });
  }

  void _fetchMoreMovies(
    FetchMoreMovies event,
    Emitter<MoviesState> emit,
  ) async {
    if (!state.hasMore || state.apiResponse.status == Status.loading) return;

    final nextPage = state.currentPage + 1;

    try {
      final movieModel = await moviesRepository.fetchMoviesList(page: nextPage);

      if (movieModel.tvShow.isEmpty) {
        emit(state.copyWith(hasMore: false));
      } else {
        final currentData = state.apiResponse.data;

        if (currentData != null) {
          final newData = [...currentData.tvShow, ...movieModel.tvShow];

          emit(
            state.copyWith(
              apiResponse: ApiResponse.completed(MoviesModel(tvShow: newData)),
              currentPage: nextPage,
              hasMore: true,
            ),
          );
        }
      }
    } catch (e) {
      emit(
        state.copyWith(
          apiResponse: ApiResponse.error(e.toString()),
          hasMore: false,
        ),
      );
    }
  }
}
