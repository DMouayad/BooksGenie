import 'package:books_genie/blocs/library_bloc/library_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:books_genie/presentation/screens/book_details/book_details_screen.dart';
import 'package:books_genie/presentation/screens/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes.dart';

class AppRouter {
  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: Routes.homeScreen,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'book-details/:bookId',
            name: Routes.bookDetailsScreen,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                transitionDuration: const Duration(milliseconds: 600),
                reverseTransitionDuration: const Duration(milliseconds: 600),
                child: BookDetailsScreen(
                  book: context
                      .read<LibraryBloc>()
                      .getBook(state.pathParameters['bookId']!),
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
        ],
      ),
    ],
  );
}
