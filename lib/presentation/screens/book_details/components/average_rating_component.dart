import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/material.dart';

class AverageRatingComponent extends StatelessWidget {
  final double averageRating;
  final int ratingsCount;
  const AverageRatingComponent({
    super.key,
    required this.averageRating,
    required this.ratingsCount,
  });

  @override
  Widget build(BuildContext context) {
    final ratingsFraction = averageRating - averageRating.round();
    const iconColor = Colors.orangeAccent;
    const iconSize = 20.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 6,
          children: [
            ...List.generate(averageRating.toInt(), (index) {
              return const Icon(Icons.star_rate_sharp,
                  color: iconColor, size: iconSize);
            }),
            if (ratingsFraction != 0)
              const Icon(Icons.star_half, color: iconColor, size: iconSize),
            ...List<Widget>.generate(
                5 - averageRating.ceil(),
                (index) => Icon(
                      Icons.star_rate_sharp,
                      size: iconSize,
                      color: iconColor.withOpacity(.5),
                    )),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                averageRating.toStringAsPrecision(2),
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.orangeAccent,
                ),
              ),
            ),
            Text(
              "($ratingsCount)",
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.onBackground.withOpacity(.6),
              ),
            )
          ],
        ),
      ),
    );
  }
}
