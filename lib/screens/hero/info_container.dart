import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../models/hero_model.dart';
import '../../constanst.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    Key? key,
    required this.superhero,
  }) : super(key: key);

  final SuperheroModel superhero;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: InfoList(superhero: superhero),
      ),
    );
  }
}

class InfoList extends StatelessWidget {
  const InfoList({
    Key? key,
    required this.superhero,
  }) : super(key: key);

  final SuperheroModel superhero;

  @override
  Widget build(BuildContext context) {
    return superhero.powerStats['power'] == "null"
        ? Center(
            child: Text(
            'Carregando...',
            style: titleH1,
          ))
        : ListView(children: [
            CustomRow(
              widgetOne: CustomIndicator(
                percentage: superhero.powerStats["durability"],
                parameter: 'durability',
              ),
              widgetTwo: CustomIndicator(
                percentage: superhero.powerStats["strength"],
                parameter: 'strength',
              ),
            ),
            SizedBox(height: 20.0),
            CustomRow(
              widgetOne: CustomIndicator(
                percentage: superhero.powerStats["intelligence"],
                parameter: 'intelligence',
              ),
              widgetTwo: CustomIndicator(
                percentage: superhero.powerStats["speed"],
                parameter: 'speed',
              ),
            ),
            SizedBox(height: 20.0),
            CustomRow(
              widgetOne: CustomIndicator(
                percentage: superhero.powerStats["power"],
                parameter: 'power',
              ),
              widgetTwo: CustomIndicator(
                percentage: superhero.powerStats["combat"],
                parameter: 'combat',
              ),
            ),
            SizedBox(height: 20.0),
          ]);
  }
}

class CustomRow extends StatelessWidget {
  final Widget widgetOne;
  final Widget widgetTwo;
  CustomRow({required this.widgetOne, required this.widgetTwo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widgetOne,
        widgetTwo,
      ],
    );
  }
}

class CustomIndicator extends StatelessWidget {
  final String percentage;
  final String parameter;
  CustomIndicator({required this.percentage, required this.parameter});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircularPercentIndicator(
            animationDuration: 1000,
            progressColor: Colors.orange[400],
            radius: 90.0,
            lineWidth: 10.0,
            animation: true,
            percent: double.parse("0.$percentage"),
            center: new Text(
              "$percentage",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0),
            ),
          ),
          Text(
            parameter,
            style:
                titleH1.copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
