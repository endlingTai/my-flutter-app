import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons/favoriteButton.dart'
    show FavoriteButton;
import 'package:flutter_application_1/main.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    /*     IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    } */
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: FavoriteList(),
        /*         (
          children: [
            
            //for ( var i in appState.favorites ) FavoriteCard(i.toString())
            //for ( var i in appState.favorites ) TextCard(i.toString())
          ],
        ), */
      ),
    );
  }
}

class FavoriteList extends StatefulWidget {
  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(child: Text('No favorites yet.'));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: appState.favorites.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: Center(
            child: FavoriteCard('${appState.favorites[index]}', index),
          ),
        );
      },
      separatorBuilder:
          (context, index) =>
              const Divider(height: 20, color: Colors.black87, thickness: 1),
    );
  }
}

class FavoriteCard extends StatefulWidget {
  final String text;
  final int index;

  const FavoriteCard(this.text, this.index, {super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.secondary,
    );

    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Card(
      color: theme.colorScheme.onPrimary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.text,
              style: style,
              selectionColor: Color.fromARGB(255, 205, 205, 55),
            ),
          ),
          FavoriteButton(appState: appState, icon: icon),
        ],
      ),
    );
  }
}
