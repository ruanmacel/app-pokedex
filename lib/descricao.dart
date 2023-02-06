import 'package:app_pokedex/pokemon.dart';
import 'package:flutter/material.dart';

class Descricao extends StatelessWidget {
  final Pokemon pokemon;
  const Descricao({super.key, required this.pokemon});

  get text => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name ?? ''),
      ),
      body: Card(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.maxFinite,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Image.network(
                      pokemon.thumbnailImage ?? '',
                      height: 150,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '#${pokemon.number}',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.description ?? '',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 2,
                    ),
                  ),
                  const Text(
                    'Tipo:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_arrayToString(pokemon.type)),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 2,
                    ),
                  ),
                  const Text(
                    'Fraquezas:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _arrayToString(pokemon.weakness),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _arrayToString(List<String>? type) {
    String name = '';
    type?.forEach((element) {
      name += '$element, ';
    });
    return name;
  }
}
