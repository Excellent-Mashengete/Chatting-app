import 'package:flutter/material.dart';

class ProgressHUD extends StatelessWidget {
  const ProgressHUD({
    Key? key, 
      required this.child,
      required this.inAsyncCall,
      this.opacity = 0.2,
      this.color = Colors.grey,
  }) : super(key: key);

  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;

  
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = Stack(
        children: [
           Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
           const Center(
            child:  CircularProgressIndicator()
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}