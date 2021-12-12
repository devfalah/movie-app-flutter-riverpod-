//Package
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

//Models
import '../models/main_page_data.dart';
import '../models/movie.dart';

//Services
import '../search_category.dart';
import '../services/movie_service.dart';

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController([MainPageData? state])
      : super(state ?? MainPageData.initial()) {
    getMovies();
  }

  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<Movie>? _movies = [];

      if (state.searchText!.isEmpty) {
        if (state.searchCategory == SearchCategory.popular) {
          _movies = await (_movieService.getMovies(
              path: '/movie/popular', page: state.page));
        } else if (state.searchCategory == SearchCategory.latest) {
          _movies = await (_movieService.getMovies(
              path: '/movie/top_rated', page: state.page));
        } else if (state.searchCategory == SearchCategory.upcoming) {
          _movies = await (_movieService.getMovies(
              path: '/movie/upcoming', page: state.page));
        } else if (state.searchCategory == SearchCategory.nowPlaying) {
          _movies = await (_movieService.getMovies(
              path: '/movie/now_playing', page: state.page));
        }
      } else {
        _movies = await (_movieService.searchMovies(state.searchText));
      }
      state = state.copyWith(
          movies: [...state.movies!, ..._movies!], page: state.page! + 1);
    } catch (e) {
      rethrow;
    }
  }

  void updateSearchCategory(String? _category) {
    try {
      state = state.copyWith(
          movies: [], page: 1, searchCategory: _category, searchText: '');
      getMovies();
    } catch (e) {
      rethrow;
    }
  }

  void updateTextSearch(String _searchText) {
    try {
      state = state.copyWith(
          movies: [],
          page: 1,
          searchCategory: SearchCategory.none,
          searchText: _searchText);
      getMovies();
    } catch (e) {
      rethrow;
    }
  }
}
