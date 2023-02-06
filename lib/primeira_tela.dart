import 'package:app_pokedex/pokemon.dart';
import 'package:app_pokedex/pokemon_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({super.key});

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  List<Pokemon> pokemonList = [];

  bool carregando = true;

  @override
  void initState() {
    _getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Pokedex'),
            Image.asset(
              'assets/imagens/pokebola.png',
              fit: BoxFit.contain,
              height: 30,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              return PokemonWidget(pokemon: pokemonList[index]);
            },
          ),
          if (carregando) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  void _getPokemons() async {
    try {
      var response =
          await Dio().get('http://104.131.18.84/pokemon/?limit=50&page=0');
      if (response.statusCode == 200) {
        setState(() {
          pokemonList = (response.data['data'] as List).map(
            (json) {
              return Pokemon.fromJson(json);
            },
          ).toList();
          carregando = false;
        });

        //response.data['data'];
      } else {
        print('Erro no servidor');
      }
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
