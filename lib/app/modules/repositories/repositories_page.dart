import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:radix_challenge/app/modules/users/users_controller.dart';
import 'package:radix_challenge/app/shared/models/repository_model.dart';
import 'package:radix_challenge/app/shared/util/colors.dart';
import 'package:radix_challenge/app/shared/widgets/avatar_network.dart';
import 'package:radix_challenge/app/shared/widgets/circular_progress_center.dart';
import 'package:radix_challenge/app/shared/widgets/no_results.dart';
import 'package:toast/toast.dart';

import 'repositories_controller.dart';

class RepositoriesPage extends StatefulWidget {
  final String title;
  final String index;
  const RepositoriesPage({Key key, this.title = "Repositories", this.index})
      : super(key: key);

  @override
  _RepositoriesPageState createState() => _RepositoriesPageState();
}

class _RepositoriesPageState
    extends ModularState<RepositoriesPage, RepositoriesController> {
  //use 'controller' variable to access controller

  UsersController usersController = Modular.get();

  @override
  void initState() {
    controller.getRepoApiByName(usersController.actualUser.login);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.17;
    double width = MediaQuery.of(context).size.height * 0.17;

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        elevation: 0,
        backgroundColor: colorSubtitleListTile,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              controller.gravarReposLocal();
              showToast("Dados Gravados!", gravity: Toast.BOTTOM);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.27,
            width: double.infinity,
            color: colorSubtitleListTile,
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Hero(
                    tag: "imageHero${widget.index}",
                    child: AvatarNetwork(
                      url: usersController.actualUser.avatarUrl,
                      height: height,
                      width: width,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                    child: Text(
                      usersController.actualUser.login,
                      style: TextStyle(
                        fontSize: 20,
                        color: colorFontTextoAppBar,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Repositórios",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: colorTitleListTile,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Observer(
            builder: (_) {
              List<RepositoryModel> list = [];

              if (controller.repositories.value == null) {
                return CircularProgressCenter();
              } else if (controller.repositories.value != null) {
                list = controller.repositories.value;
                if (list.length == 0) {
                  return NoResults();
                } else {
                  list = controller.repositories.value;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            controller.actualRepository = list[index];
                            Modular.to.pushNamed('repository/$index');
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    list[index].name,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: colorTitleListTile,
                                    ),
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15,
                                    ),
                                    Text(
                                      list[index].stargazersCount.toString(),
                                      style: TextStyle(
                                        color: colorTitleListTile,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            subtitle: Text(
                              list[index].description == null
                                  ? "[sem descrição]"
                                  : list[index].description,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                color: colorSubtitleListTile,
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
          ),
        ],
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
