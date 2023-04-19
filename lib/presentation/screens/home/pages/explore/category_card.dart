import 'package:flutter/material.dart';
import 'package:books_genie/support/utils/context_extensions.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.label, required this.onTap});
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
          gradient: LinearGradient(
            colors: [
              Color(0xFF6e9efe),
              Color(0xFF8098ff),
              Color(0xFF9490ff),
              Color(0xFFaa87ff),
              Color(
                0xFFc17cff,
              )
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
