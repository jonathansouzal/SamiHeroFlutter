import 'package:flutter/material.dart';
import '../../api.dart';
import '../../models/hero_model.dart';
import 'hero_list.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  List<SuperheroModel> superhero;
  HomeScreen({required this.superhero});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(10, 80, 10, 0),
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                    suffix: Icon(
                      Icons.search,
                      size: 18.0,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Pesquise um herói ou um poder',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(25),
                    )),
                onChanged: (value) async {
                  widget.superhero = await searchResults(value);
                  setState(() {});
                  // _provider.searchResult(value);
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Voltar a lista de heróis'),
              ),
              Expanded(
                child: widget.superhero == null
                    ? Center(child: CircularProgressIndicator())
                    : HeroList(superheros: widget.superhero),
              ),
            ],
          )),
    );
  }
}
