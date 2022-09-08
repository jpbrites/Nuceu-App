import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';

interestedDialog({
  required BuildContext context,
  required List<dynamic> emails,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          '${emails.length} pessoas interessadas',
          style: Themes.latoRegular(20),
        ),
        elevation: 0,
        //contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: emails.length,
              itemBuilder: (context, index) {
                return SizedBox(height: 30, child: Text(emails[index]));
              }),
        ),
      );
    },
  );
}
