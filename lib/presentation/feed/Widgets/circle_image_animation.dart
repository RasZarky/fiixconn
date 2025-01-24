import 'package:flutter/material.dart';

class MusicImage extends StatefulWidget {
  MusicImage({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  _MusicImageState createState() => _MusicImageState();
}

class _MusicImageState extends State<MusicImage> {


  @override
  Widget build(BuildContext context) {
    return Container(child: widget.child);
  }
}
