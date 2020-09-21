import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:radix_challenge/app/shared/util/colors.dart';
import 'package:radix_challenge/app/shared/widgets/avatar_network.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  final consulta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.1;
    double width = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarNetwork(
                    url:
                        "https://image.flaticon.com/icons/png/512/25/25231.png",
                    height: height,
                    width: width,
                  ),
                  AvatarNetwork(
                    url:
                        "https://media.glassdoor.com/sqll/678982/radix-engenharia-e-software-squarelogo-1429884867121.png",
                    height: height,
                    width: width,
                  ),
                  AvatarNetwork(
                    url: "http://niltondiniz.com/images/spinner_2.jpg",
                    height: height,
                    width: width,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                "Busca de Usuários",
                style: TextStyle(
                  color: colorTitleListTile,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: consulta,
                      decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Informe o usuário do GitHub',
                          hintStyle: TextStyle(
                            color: colorTitleListTile,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              RaisedButton(
                color: colorTitleListTile,
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.2,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Center(
                    child: Text(
                      "Buscar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                onPressed: consulta.text.isEmpty
                    ? null
                    : () {
                        //passa o texto para a proxima pagina
                        Modular.to.pushNamed("users/${consulta.text}");
                      },
                splashColor: color_2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
