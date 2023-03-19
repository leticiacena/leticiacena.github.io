import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatefulWidget {
  ResponsiveLayout({required this.desktop, required this.mobile, super.key});

  Widget desktop;
  Widget mobile;

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 700) {
        return widget.desktop;
      } else {
        return widget.mobile;
      }
    });
  }
}
