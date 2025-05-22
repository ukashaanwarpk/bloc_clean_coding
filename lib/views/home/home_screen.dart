import 'package:bloc_clean_coding/bloc/movies/movies_bloc.dart';
import 'package:bloc_clean_coding/config/routes/route_name.dart';
import 'package:bloc_clean_coding/main.dart';
import 'package:bloc_clean_coding/services/storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/components/network_image.dart';
import '../../utils/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MoviesBloc moviesBloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          moviesBloc.state.hasMore &&
          !moviesBloc.state.isFetchingMore) {
        moviesBloc.add(FetchMoreMovies());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    moviesBloc.close();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LocalStorage localStorage = LocalStorage();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              localStorage.clearValue('token').then((value) {
                localStorage.clearValue('isLogin');
                if (context.mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.login,
                    (route) => false,
                  );
                }
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => moviesBloc..add(FetchMovies()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            switch (state.apiResponse.status) {
              case Status.loading:
                return const Center(child: CircularProgressIndicator());

              case Status.error:
                return Center(
                  child: Text(state.apiResponse.message.toString()),
                );

              case Status.completed:
                if (state.apiResponse.data == null) {
                  return const Text('No data found');
                }
                final movies = state.apiResponse.data!;
                return ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: movies.tvShow.length + 1, // extra item for loader
                  itemBuilder: (context, index) {
                    if (index < movies.tvShow.length) {
                      final tvShows = movies.tvShow[index];
                      return Card(
                        child: ListTile(
                          leading: NetworkImageWidget(
                            borderRadius: 5,
                            imageUrl: tvShows.imageThumbnailPath.toString(),
                          ), //
                          title: Text(tvShows.name.toString()),
                          trailing: Text(tvShows.status.toString()),
                          subtitle: Text(tvShows.network.toString()),
                        ),
                      );
                    } else {
                      return state.hasMore
                          ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: CircularProgressIndicator()),
                          )
                          : const SizedBox();
                    }
                  },
                );

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
