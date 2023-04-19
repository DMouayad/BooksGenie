import 'package:books_genie/domain/auth/base/base_auth_repository.dart';
import 'package:books_genie/domain/book/base/base_book_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'auth_bloc/auth_bloc.dart';
import 'library_bloc/library_bloc.dart';

class BlocsWrapper extends StatelessWidget {
  const BlocsWrapper({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          lazy: false,
          create: (BuildContext context) {
            return AuthBloc(GetIt.instance.get<BaseAuthRepository>())
              ..add(const AuthInitRequested());
          },
        ),
        BlocProvider(
          create: (BuildContext context) =>
              LibraryBloc(GetIt.instance.get<BaseBookRepository>())
                ..add(const FetchRecommendedBooksRequested())
                ..add(const FetchMostPopularBooksRequested()),
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (prev, next) {
          return next is AuthHasLoggedInUser || next is AuthHasNoLoggedInUser;
        },
        listener: (context, state) {
          if (state is AuthHasLoggedInUser) {
            final userId = state.currentUser.id!;
            context.read<LibraryBloc>()
              ..add(FetchReadingNowBooksRequested(userId))
              ..add(FetchCompletedReadingBooksRequested(userId))
              ..add(FetchFavoriteBooksRequested(userId));
          }
          if (state is AuthHasNoLoggedInUser) {
            context.read<LibraryBloc>().add(ResetUserBookCollections());
          }
        },
        child: child,
      ),
    );
  }
}
