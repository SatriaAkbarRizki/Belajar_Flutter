// ignore_for_file: file_names

import 'package:flutter/material.dart';

void main(List<String> args) {
  const FavoriteButton();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoriteButton();
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FavoriteButton();
  }
}

class _FavoriteButton extends State<FavoriteButton> {
  bool _isFavorited = true;
  int _favoriteCount = 10;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.orange[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
