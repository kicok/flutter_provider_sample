import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/model/movie.dart';
import 'package:flutter_provider_sample/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MovieListWidget extends StatelessWidget {
  MovieListWidget({Key? key}) : super(key: key);

  late MovieProvider _movieProvider;

  Widget _makeMovieOne(Movie movie) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          child: Image.network(movie.postUrl),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Text(
                    movie.overview,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
    //Text(movies[index].title),
  }

  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 0),
                    )
                  ]),
              child: _makeMovieOne(movies[index]),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: movies.length);
  }

  @override
  Widget build(BuildContext context) {
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.loadMovies();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Provider'),
      ),
      body: Consumer<MovieProvider>(builder: (context, provider, widget) {
        if (provider.movies.isNotEmpty) {
          return _makeListView(provider.movies);
        }
        print(provider.movies);
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
