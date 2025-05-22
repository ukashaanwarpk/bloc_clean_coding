import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/data/response/api_response.dart';
import 'package:bloc_clean_coding/repository/movies/movies_repository.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_clean_coding/model/movies/movies_model.dart';
import 'package:flutter/material.dart';
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
              currentPage: 1,
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
    if (!state.hasMore || state.isFetchingMore) return;

    final nextPage = state.currentPage + 1;

    emit(state.copyWith(isFetchingMore: true));

    try {
      final movieModel = await moviesRepository.fetchMoviesList(page: nextPage);

      debugPrint('The movieModel length ${movieModel.tvShow.length}');

      if (movieModel.tvShow.isEmpty) {
        emit(state.copyWith(hasMore: false, isFetchingMore: false));
      } else {
        final currentData = state.apiResponse.data;

        debugPrint('The currentData length ${currentData?.tvShow.length}');

        if (currentData != null) {
          final newData = [...currentData.tvShow, ...movieModel.tvShow];

          debugPrint('The newData length ${newData.length}');

          emit(
            state.copyWith(
              apiResponse: ApiResponse.completed(MoviesModel(tvShow: newData)),
              currentPage: nextPage,
              hasMore: true,
              isFetchingMore: false,
            ),
          );
        }
      }
    } catch (e) {
      emit(
        state.copyWith(
          apiResponse: ApiResponse.error(e.toString()),
          hasMore: false,

          isFetchingMore: false,
        ),
      );
    }
  }
}
