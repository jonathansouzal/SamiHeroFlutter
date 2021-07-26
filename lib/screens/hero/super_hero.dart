import 'package:flutter/material.dart';
import 'package:samihero/screens/hero/image_container.dart';
import 'package:samihero/screens/hero/info_container.dart';
import '../../models/hero_model.dart';

class SuperHeroScreen extends StatelessWidget {
  final SuperheroModel superhero;
  SuperHeroScreen({required this.superhero});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
          ImageContainer(superhero: superhero),
          InfoContainer(superhero: superhero),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Voltar a lista de heróis'),
          ),
        ])));
  }
}
