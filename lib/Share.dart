import 'package:flutter/material.dart';


class share_card extends StatefulWidget {
  final String imgUrl;
  final String username;
  const share_card({super.key,required this.imgUrl,required this.username});

  @override
  State<share_card> createState() => _share_cardState();
}

class _share_cardState extends State<share_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(widget.imgUrl),
          Text(widget.username),
        ],
      ),
    );
  }
}
