part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final ApiResponse<MoviesModel> apiResponse;

  final bool hasMore ;

  final int currentPage;

  const MoviesState({required this.apiResponse, this.currentPage = 1, this.hasMore = true});

  @override
  List<Object> get props => [apiResponse, currentPage, hasMore];

  MoviesState copyWith({ApiResponse<MoviesModel>? apiResponse, int? currentPage, bool? hasMore}) {
    return MoviesState(apiResponse: apiResponse ?? this.apiResponse, currentPage: currentPage ?? this.currentPage, hasMore: hasMore ?? this.hasMore);
  }
}
