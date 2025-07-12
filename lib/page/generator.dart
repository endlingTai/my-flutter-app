import 'package:english_words/english_words.dart' show WordPair;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons/favoriteButton.dart'
    show FavoriteButton;
import 'package:flutter_application_1/main.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GeneratedText(),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FavoriteButton(appState: appState, icon: icon),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GeneratedText extends StatelessWidget {
  const GeneratedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('A random idea now:');
  }
}

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          semanticsLabel: "${pair.first} ${pair.second}",
          "${pair.first} ${pair.second}",
          style: style,
        ),
      ),
    );
  }
}
