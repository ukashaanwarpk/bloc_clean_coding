part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final ApiResponse<MoviesModel> apiResponse;

  final bool hasMore;

  final int currentPage;

  final bool isFetchingMore;

  const MoviesState({
    required this.apiResponse,
    this.currentPage = 1,
    this.hasMore = true,
    this.isFetchingMore = false,
  });

  @override
  List<Object> get props => [apiResponse, currentPage, hasMore, isFetchingMore];

  MoviesState copyWith({
    ApiResponse<MoviesModel>? apiResponse,
    int? currentPage,
    bool? hasMore,
    bool? isFetchingMore,
  }) {
    return MoviesState(
      apiResponse: apiResponse ?? this.apiResponse,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
    );
  }
}
