import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  final List jsondata;
  const AppCard({ Key? key,  required this.jsondata }) : super(key: key);

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    print(widget.jsondata.length);
    return ListView.builder(
      shrinkWrap: true,
      itemCount:widget.jsondata.length ,
      itemBuilder: (context, index){
        return const  Text("Hello");

    });
  }
}