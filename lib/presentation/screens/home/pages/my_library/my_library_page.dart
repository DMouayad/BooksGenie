import 'package:books_genie/presentation/screens/home/pages/my_library/completed_reading_section.dart';
import 'package:books_genie/presentation/screens/home/pages/my_library/favorites_section.dart';
import 'package:books_genie/presentation/screens/home/pages/my_library/reading_now_section.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_genie/blocs/auth_bloc/auth_bloc.dart';
import 'package:books_genie/presentation/shared_widgets/custom_app_bar.dart';

import 'login_required_notice.dart';

class MyLibraryPage extends StatefulWidget {
  const MyLibraryPage({super.key});

  @override
  State<MyLibraryPage> createState() => _MyLibraryPageState();
}

class _MyLibraryPageState extends State<MyLibraryPage> {
  late final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, next) =>
          next is AuthHasLoggedInUser || next is AuthHasNoLoggedInUser,
      builder: (context, state) {
        return CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: scrollController,
          slivers: [
            CustomAppbar(
              expandedHeight: context.appBarExpandedHeight,
              // searchHint: "Search in your library",
              // searchEnabled: state is AuthHasLoggedInUser,
              titleText: "My collections",
              animateComponentsOnInit: false,
              scrollController: scrollController,
            ),
            () {
              if (state is AuthHasLoggedInUser) {
                final pageSections = [
                  ReadingNowSection(userId: state.currentUser.id!),
                  CompletedReadingSection(userId: state.currentUser.id!),
                  FavoriteBooksSection(userId: state.currentUser.id!),
                ];
                return SliverPadding(
                  padding: EdgeInsets.only(bottom: context.screenHeight * .1),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => pageSections[index],
                      childCount: pageSections.length,
                    ),
                  ),
                );
              } else {
                return const SliverFillRemaining(child: LoginRequiredNotice());
              }
            }()
          ],
        );
      },
    );
  }
}
