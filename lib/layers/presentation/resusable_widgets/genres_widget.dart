import 'package:flutter/material.dart';

class GenresInfoWidget extends StatelessWidget {
  final List<String> genres;
  const GenresInfoWidget({
    Key? key,
    required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) {
      return const SizedBox();
    }

    return Wrap(
        children: genres.map((item) => buildGenreItem(item)).toList());
  }

  Widget buildGenreItem(String name) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: Text(name),
    );
  }
}
