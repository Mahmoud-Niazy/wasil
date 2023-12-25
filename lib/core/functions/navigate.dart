import 'package:flutter/material.dart';

navigate({
  required BuildContext context,
  required Widget screen,
}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

navigateAndRemoveUntil({
  required BuildContext context,
  required Widget screen,
}) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => screen),
    (route) => false,
  );
}
