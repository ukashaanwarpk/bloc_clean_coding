part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final ApiResponse<MoviesModel> apiResponse;

  const MoviesState({required this.apiResponse});

  @override
  List<Object> get props => [apiResponse];

  MoviesState copyWith({ApiResponse<MoviesModel>? apiResponse}) {
    return MoviesState(apiResponse: apiResponse ?? this.apiResponse);
  }
}
