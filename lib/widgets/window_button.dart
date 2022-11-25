
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowButtons extends StatelessWidget {
  const WindowButtons({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: WindowButtonColors(
            iconNormal: Theme.of(context).iconTheme.color,
            mouseOver: Theme.of(context).hoverColor,
            mouseDown: Theme.of(context).highlightColor,
            iconMouseOver: Theme.of(context).iconTheme.color,
          ),
        ),
        MaximizeWindowButton(
          colors: WindowButtonColors(
            iconNormal: Theme.of(context).iconTheme.color,
            mouseOver: Theme.of(context).hoverColor,
            mouseDown: Theme.of(context).highlightColor,
            iconMouseOver: Theme.of(context).iconTheme.color,
          ),
        ),
        CloseWindowButton(
          colors: WindowButtonColors(
            mouseOver: const Color(0xFFD32F2F),
            mouseDown: const Color(0xFFB71C1C),
            iconNormal: Theme.of(context).iconTheme.color,
            iconMouseOver: Colors.white,
          ),
        ),
      ],
    );
  }
}
