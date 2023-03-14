import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'TvShowScreen.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

List<Show> favorites = [];

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Favorites')),
          backgroundColor: Colors.purple,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.purple,
          child: Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TvShow()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.tv),
                      SizedBox(width: 10),
                      Text("TV Show's"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () {
                    // acción del segundo botón
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.favorite),
                      SizedBox(width: 10),
                      Text("Favoritos"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            return Slidable(
              key: Key(favorites[index].toString()),
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (BuildContext context) {
                      deleteTVshow(context, favorites[index]);
                    },
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              // endActionPane: const ActionPane(
              //   motion: ScrollMotion(),
              //   children: [
              //     SlidableAction(
              //       onPressed: doNothing,
              //       backgroundColor: Colors.yellow,
              //       foregroundColor: Colors.black,
              //       icon: Icons.save,
              //       label: 'Añadir a Favoritos',
              //     ),
              //   ],
              // ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        return FullScreenDialog(favorites[index].synopsis);
                      },
                    ),
                  );
                },
                leading: Image(
                  image: NetworkImage(favorites[index].image),
                ),
                title: Text(favorites[index].name),
                // subtitle: Text(favorites[index].imdb),
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.grey),
                // trailing:
                //     // const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
                //     Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     const Icon(Icons.star, color: Colors.yellow),
                //     const SizedBox(width: 5),
                //     Text(favorites[index].rating.toString()),
                //   ],
                // ),
              ),
            );
          },
        ),
      ),
    );
  }

  void deleteTVshow(BuildContext context, TVshow) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Remove to Favorites"),
          content: Text("Are you sure you want to remove " +
              TVshow.name +
              ' from favorites?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
              ),
            ),
            TextButton(
              onPressed: () {
                if (mounted) {
                  setState(() {
                    favorites.remove(TVshow);
                  });
                }
                Navigator.pop(context);
              },
              child: Text(
                'Remove',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
