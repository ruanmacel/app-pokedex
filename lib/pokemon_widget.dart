import 'package:app_pokedex/descricao.dart';
import 'package:app_pokedex/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonWidget extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Descricao(
              pokemon: pokemon,
            );
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(
                pokemon.thumbnailImage ?? '',
                height: 80,
              ),
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Text(
                  pokemon.name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                '#${pokemon.number ?? ''}',
              )
            ],
          ),
        ),
      ),
    );
  }
}
