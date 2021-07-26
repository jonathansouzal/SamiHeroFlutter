import 'package:flutter/material.dart';
import '../../models/hero_model.dart';
import '../hero/super_hero.dart';
import '../../constanst.dart';

class HeroList extends StatelessWidget {
  const HeroList({
    Key? key,
    required this.superheros,
  }) : super(key: key);

  final List<SuperheroModel> superheros;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: superheros.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SuperHeroScreen(
                            superhero: superheros[index],
                          )));
            },
            child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Row(
                  children: [
                    Hero(
                      tag: superheros[index].name,
                      child: CircleAvatar(
                          radius: 40.0,
                          foregroundImage: NetworkImage(
                            superheros[index].image_url,
                          )),
                    ),
                    SizedBox(width: 20.0),
                    Flexible(
                      child: Text(
                        superheros[index].name,
                        style: titleH1.copyWith(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
