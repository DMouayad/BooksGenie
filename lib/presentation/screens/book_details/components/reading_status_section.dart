import 'package:books_genie/blocs/auth_bloc/auth_bloc.dart';
import 'package:books_genie/blocs/library_bloc/library_bloc.dart';
import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:books_genie/presentation/helpers/show_login_required_dialog.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadingStatusSection extends StatefulWidget {
  final BaseBook book;
  const ReadingStatusSection(this.book, {super.key});

  @override
  State<ReadingStatusSection> createState() => _ReadingStatusSectionState();
}

class _ReadingStatusSectionState extends State<ReadingStatusSection> {
  var sliderValue = 0.0;
  double? completedPercent;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      buildWhen: (prev, next) =>
          (next is LibraryBooksState &&
              prev is LibraryBooksState &&
              prev.readingNowBooksIds != next.readingNowBooksIds) ||
          next is LibraryBooksState,
      builder: (context, state) {
        completedPercent = state is LibraryBooksState
            ? state.getBookUserCollectionInfo(widget.book)?.completionPercent
            : null;

        bool isReadingNow = completedPercent != null;

        var count = widget.book.info.pageCount;
        return Container(
          // decoration: BoxDecoration(
          //   border: Border.all(
          //       width: .8,
          //       color: context.isDarkMode ? Colors.white12 : Colors.black12),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          alignment: Alignment.center,
          height: isReadingNow ? 84 : 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  final authState = context.read<AuthBloc>().state;
                  authState is AuthHasLoggedInUser
                      ? context
                          .read<LibraryBloc>()
                          .add(AddBookToUserCollectionRequested(
                            authState.currentUser.id!,
                            widget.book,
                            isFavorite: state is LibraryBooksState
                                ? state.getBookIsFavorite(widget.book)
                                : false,
                            completionPercent: isReadingNow ? null : 0.0,
                          ))
                      : showLoginRequiredDialog(
                          context,
                          'Please login to your account in order to add this book to the reading now list.',
                        );
                },
                icon: Icon(
                  CupertinoIcons.book,
                  color: isReadingNow ? null : context.colorScheme.onBackground,
                ),
                label: Text(
                  isReadingNow
                      ? 'remove from reading-now'
                      : 'add to reading-now',
                ),
              ),

              // Slider(
              //   min: 0,
              //   max: 1,
              //   value: sliderValue,
              //   onChanged: (value) {
              //     setState(() {
              //       completedPercent = (value * 100).roundToDouble();
              //       sliderValue =
              //           (count * (completedPercent! / 100)) / count;
              //     });
              //   },
              //   divisions: widget.book.info.pageCount,
              //   label: completedPercent?.toString(),
              // ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
