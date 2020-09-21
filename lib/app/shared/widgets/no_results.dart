import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:radix_challenge/app/shared/util/colors.dart';

class NoResults extends StatelessWidget {
  const NoResults({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Image.asset("assets/images/noresults.png"),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            width: MediaQuery.of(context).size.height * 0.3,
            child: Text(
              "Que pena! Não conseguimos localizar os dados...",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          RaisedButton(
            color: color_1,
            child: Container(
              width: MediaQuery.of(context).size.height * 0.25,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Center(
                child: Text(
                  "Voltar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            onPressed: () {
              //passa o texto para a proxima pagina
              Modular.to.pop();
            },
            splashColor: color_2,
          ),
        ],
      ),
    );
  }
}
