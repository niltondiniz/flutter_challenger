import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:radix_challenge/app/modules/repositories/repositories_controller.dart';
import 'package:radix_challenge/app/shared/models/repository_model.dart';
import 'package:radix_challenge/app/shared/util/colors.dart';
import 'package:radix_challenge/app/shared/widgets/circular_progress_center.dart';
import 'package:radix_challenge/app/shared/widgets/no_results.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryPage extends StatefulWidget {
  final String title;
  final String index;
  const RepositoryPage({Key key, this.title = "Repository", this.index})
      : super(key: key);

  @override
  _RepositoryPageState createState() => _RepositoryPageState();
}

class _RepositoryPageState extends State<RepositoryPage> {
  //use 'controller' variable to access controller

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  RepositoriesController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    final formatDate = new DateFormat('dd/MM/yyyy');

    controller.getRepoClosedIssues(controller.actualRepository.owner.login,
        controller.actualRepository.name);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorSubtitleListTile,
        title: Observer(
          builder: (_) {
            return Text(
              controller.actualRepository.name,
              style: TextStyle(color: colorFontTextoAppBar),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            List<RepositoryModel> list = [];

            if (controller.repositories.value == null) {
              return CircularProgressCenter();
            } else if (controller.repositories.value != null) {
              list = controller.repositories.value;

              if (list.length == 0) {
                return NoResults();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: double.infinity,
                      color: colorSubtitleListTile,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      controller
                                          .actualRepository.stargazersCount
                                          .toString(),
                                      style: TextStyle(
                                        color: colorFontTextoAppBar,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.yellow,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      controller.actualRepository.forksCount
                                          .toString(),
                                      style: TextStyle(
                                        color: colorFontTextoAppBar,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/fork.png",
                                      width: 12,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Issues: ${controller.actualRepository.openIssuesCount.toString()} abertas / ${controller.iClosedIssue.toString()} fechadas",
                                  style: TextStyle(
                                    color: colorFontTextoAppBar,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Descricao",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: colorTitleListTile,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.actualRepository.description != null
                                ? controller.actualRepository.description
                                : "[sem descrição]",
                            style: TextStyle(
                              color: colorSubtitleListTile,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Linguagem",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: colorTitleListTile,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.actualRepository.language != null
                                ? controller.actualRepository.language
                                : "[não informada]",
                            style: TextStyle(
                              color: colorSubtitleListTile,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Data Criação",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: colorTitleListTile,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            formatDate.format(DateTime.parse(
                                controller.actualRepository.createdAt)),
                            style: TextStyle(
                              color: colorSubtitleListTile,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                _launchInWebViewOrVC(
                                    controller.actualRepository.htmlUrl);
                              },
                              child: Image.asset(
                                "assets/images/github_h.png",
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
