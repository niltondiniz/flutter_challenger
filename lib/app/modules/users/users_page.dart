import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:radix_challenge/app/shared/models/user_model.dart';
import 'package:radix_challenge/app/shared/util/colors.dart';
import 'package:radix_challenge/app/shared/widgets/avatar_network.dart';
import 'package:radix_challenge/app/shared/widgets/circular_progress_center.dart';
import 'package:radix_challenge/app/shared/widgets/erro_consulta_texto.dart';
import 'package:radix_challenge/app/shared/widgets/no_results.dart';
import 'users_controller.dart';

class UsersPage extends StatefulWidget {
  final String title;
  final String consulta;
  const UsersPage({Key key, this.title = "Users", this.consulta = ""})
      : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends ModularState<UsersPage, UsersController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.getUsersApiByName(widget.consulta);
  }

  @override
  Widget build(BuildContext context) {
    List<UserModel> list = [];
    double height = MediaQuery.of(context).size.height * 0.2;
    double width = MediaQuery.of(context).size.height * 0.2;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.group),
            onPressed: () {
              controller.getUserLocalStorageByName('s');
            },
          ),
        ],
        title: Text(
          "Usuários GitHub",
          style: TextStyle(
            color: colorFontTextoAppBar,
          ),
        ),
        elevation: 0,
        backgroundColor: colorSubtitleListTile,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: double.infinity,
            color: colorSubtitleListTile,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Observer(
                    builder: (_) {
                      List<UserModel> listCount = [];
                      if (controller.users.value != null) {
                        listCount = controller.users.value;
                      }

                      return Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "${listCount.length} usuários encontrados",
                                    style:
                                        TextStyle(color: colorFontTextoAppBar),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Observer(
            builder: (_) {
              if (controller.users.value == null) {
                return CircularProgressCenter();
              } else if (controller.users.error != null) {
                return ErroConsultaTexto();
              } else if (controller.users.value != null) {
                list = controller.users.value;
                if (list.length == 0) {
                  return NoResults();
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            controller.actualUser = list[index];
                            Modular.to.pushNamed('repositories/$index');
                          },
                          child: ListTile(
                            title: Text(
                              list[index].login,
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: colorTitleListTile),
                            ),
                            subtitle: Text(
                              list[index].htmlUrl,
                              style: TextStyle(
                                color: colorSubtitleListTile,
                              ),
                            ),
                            leading: CircleAvatar(
                              child: Hero(
                                tag: "imageHero$index",
                                child: AvatarNetwork(
                                  url: list[index].avatarUrl,
                                  height: height,
                                  width: width,
                                ),
                              ),
                            ),
                            trailing: Wrap(
                              spacing: 12, // space between two icons
                              children: <Widget>[
                                Icon(Icons.chevron_right), // icon-2
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            },
          )
        ],
      ),
    );
  }
}
