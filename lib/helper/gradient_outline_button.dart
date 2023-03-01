import 'package:flutter/material.dart';

class GradientOutlineButton extends StatefulWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  EdgeInsets padding;
  EdgeInsets margin;

  GradientOutlineButton(
      {Key? key, double strokeWidth = 2,
        required Gradient gradient,
        required double radius,
        required Widget child,
        required VoidCallback onPressed,
        required this.padding,
        required this.margin})
      : _painter = _GradientPainter(
      strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        _child = child,
        _callback = onPressed,
        _radius = radius, super(key: key);

  @override
  State<GradientOutlineButton> createState() => _GradientOutlineButtonState();
}

class _GradientOutlineButtonState extends State<GradientOutlineButton> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: widget._painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget._callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(widget._radius),
          onTap: widget._callback,
          child: Container(
            padding: widget.padding != null
                ? widget.padding
                : EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            margin: widget.margin != null
                ? widget.margin
                : EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            constraints: BoxConstraints(minWidth: 88, minHeight: 40),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                widget._child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {required double strokeWidth,
        required double radius,
        required Gradient gradient})
      : strokeWidth = strokeWidth,
        radius = radius,
        gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    print("radius : $radius");
    print("strokeWidth : $strokeWidth");

    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
    RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}