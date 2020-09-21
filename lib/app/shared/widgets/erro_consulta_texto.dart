import 'package:flutter/material.dart';

class ErroConsultaTexto extends StatelessWidget {
  const ErroConsultaTexto({
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
          Icon(
            Icons.error,
            size: 70,
          ),
          Text("Ops! Tivemos um problema na requisição")
        ],
      ),
    );
  }
}
