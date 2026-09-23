import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ButtonLike extends StatefulWidget {
  const ButtonLike({super.key});

  @override
  State<ButtonLike> createState() => _ButtonLikeState();
}

class _ButtonLikeState extends State<ButtonLike> {
  int x = 0;
  void ChangeLike(){
    setState(() {
      if(x==0){
        x=1;
      }else if (x==1){
        x=2;
      }else if (x==2){
        x=0;
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: ChangeLike,
      icon: Icon(
        x == 2 ? Icons.thumb_down : Icons.thumb_up,
        color: x == 1 ? Colors.blue : null,
      ),
    );
  }
}

