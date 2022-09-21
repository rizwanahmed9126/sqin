import 'package:flutter/material.dart';

class DetailsTile extends StatelessWidget {
  final String title;
  final String name;
  const DetailsTile({Key? key,required this.name,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$title: ",style: const TextStyle(fontWeight: FontWeight.bold),),
        Text(name,),
      ],
    );
  }
}
