import 'package:flutter/material.dart';
import '../../models/hero_model.dart';
import '../../constanst.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.superhero,
  }) : super(key: key);

  final SuperheroModel superhero;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20.0),
          Hero(
            tag: superhero.name,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.orange,
                radius: 70.0,
                child: CircleAvatar(
                    radius: 60.0,
                    foregroundImage: NetworkImage(
                      superhero.image_url,
                    )),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Text(superhero.name,
              style: titleH1.copyWith(fontWeight: FontWeight.bold)),
          Text(superhero.biography["full-name"], style: text),
          Text('Nasceu em: ${superhero.biography["place-of-birth"]}',
              style: text),
          Text('1º aparição: ${superhero.biography["first-appearance"]}',
              style: text),
          Text('Editora: ${superhero.biography["publisher"]}', style: text),
          Text('Está do lado do: ${superhero.biography["alignment"]}',
              style: text),
        ],
      ),
    );
  }
}
