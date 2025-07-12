import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.appState, required this.icon});

  final MyAppState appState;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        appState.toggleFavorite();
      },
      icon: Icon(icon),
      label: Text('Like'),
    );
  }
}
