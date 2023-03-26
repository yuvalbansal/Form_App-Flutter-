import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  final Name;
  final GitHub_ID;
  final Roll_No;
  final Hall;
  Profile({
    required this.Name, this.GitHub_ID, this.Roll_No, this.Hall
});
  @override
  Widget build(BuildContext context){
    return Container(
      width: 350,
      height: 170,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(500)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage('https://drive.google.com/uc?export=view&id=1Ghhvo6tpwC_lwdVk0wh5zOeHbSyKjgU7'),
                  fit: BoxFit.fill
              ),
            ),
            margin: const EdgeInsets.only(left: 0, top:0, right: 20, bottom:0),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Name: $Name\n'
                    'Roll no.: $Roll_No\n'
                    'Hall: Hall $Hall\n'
                    'Github ID: $GitHub_ID',
                style: TextStyle(
                  fontFamily: 'JosefinSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  height: 1.5,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 0.5
                    ..color = Colors.blue[700]!,
                ),
              ),
            ],
          )],
      ),
    );
  }
}