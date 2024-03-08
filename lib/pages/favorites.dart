import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../util/appstate.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    if(appState.favorites.isEmpty) {
      return Center(
        child: Text("No favorites yet.")
      );
    }

    return ListView(
      children: [
      
        for (var pair in appState.favorites)
          Dismissible(
            key: Key(pair.toString()),
            onDismissed: (direction) {
              appState.deleteFavorite(pair);
            },
            background: Container(color: Colors.red),
            child: ListTile(
              leading: Icon(Icons.swipe), // Swipe icon
              title: Text(pair.asLowerCase),
            ),
          )
      ]
    );
  }
}