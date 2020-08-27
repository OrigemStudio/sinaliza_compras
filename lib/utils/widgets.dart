import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/utils/class.dart';

class CircleIndicator extends StatefulWidget {
  final double percent;
  final Nutrients nutrient;

  CircleIndicator({this.percent = 0.5,this.nutrient});
  @override
  _CircleIndicatorState createState() => _CircleIndicatorState();
}

class _CircleIndicatorState extends State<CircleIndicator>
    with SingleTickerProviderStateMixin {
  double fraction = 0.0;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    var controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);

    animation = Tween(begin: 0.0, end: widget.percent).animate(controller)
      ..addListener(() {
        setState(() {
          fraction = animation.value;
        });
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: ScreenUtil.instance.setHeight(185),
            width: ScreenUtil.instance.setWidth(185),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(widget.nutrient.name,style: TextStyle(color: Colors.purple),),
                Text(widget.nutrient.weight,style: TextStyle(color: Colors.purple),),
              ],
            ),
          ),
          Container(
            height: ScreenUtil.instance.setHeight(185),
            width: ScreenUtil.instance.setWidth(185),
            child: CustomPaint(
              foregroundPainter: CirclePainter(fraction),
            ),
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  Paint _paint;
  double _fraction;

  CirclePainter(this._fraction) {
    _paint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset(0.0, 0.0) & size;
    canvas.drawArc(rect, -pi / 2, pi * 2 * _fraction, false, _paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}
