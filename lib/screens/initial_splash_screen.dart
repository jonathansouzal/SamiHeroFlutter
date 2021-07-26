import 'package:flutter/material.dart';
import 'package:samihero/models/hero_model.dart';
import '../api.dart';
import 'home/home_screen.dart';
import '../constanst.dart';
import 'hero/super_hero.dart';

class InitialSplash extends StatefulWidget {
  @override
  _InitialSplashState createState() => _InitialSplashState();
}

class _InitialSplashState extends State<InitialSplash> {
  late List<SuperheroModel> superheros;

  void fetchData() async {
    superheros = await getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: superheros == null
          ? Center(child: Text("Carregando..."))
          : InitialSplashContainer(superheros: superheros),
    );
  }
}

class InitialSplashContainer extends StatelessWidget {
  const InitialSplashContainer({
    Key? key,
    required this.superheros,
  }) : super(key: key);

  final List<SuperheroModel> superheros;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: InitialSplashColumn(superheros: superheros));
  }
}

class InitialSplashColumn extends StatelessWidget {
  const InitialSplashColumn({
    Key? key,
    required this.superheros,
  }) : super(key: key);

  final List<SuperheroModel> superheros;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Sami Test Flutter',
          style: titleH1.copyWith(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        Text('Espero que encontrem um herói para embarcar na jornada Sami App.',
            style: text),
        SizedBox(height: 20.0),
        Container(
          height: 200.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SuperHeroScreen(superhero: superheros[index])));
                  },
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.orange[400],
                    radius: 60,
                    child: CircleAvatar(
                      radius: 50.0,
                      foregroundImage:
                          NetworkImage(superheros[index].image_url),
                    ),
                  ),
                );
              }),
        ),
        SizedBox(height: 20.0),
        MaterialButton(
            padding: EdgeInsets.all(20.0),
            color: Colors.orange,
            shape: StadiumBorder(),
            child: Text(
              'Lista de heróis',
              style: titleH1,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            superhero: superheros,
                          )));
            }),
      ],
    );
  }
}
