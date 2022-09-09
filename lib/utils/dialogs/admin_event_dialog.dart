import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

editEventDialoig({
  required BuildContext context,
  required Function() onView,
  required Function() onEdit,
  required Function() onDelete,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 0,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: onView,
                    child: Container(
                      width: 240,
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 0),
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Color(0xFF535353),
                            size: 24,
                          ),
                        ),
                        Text(
                          'Visualizar',
                          style: Themes.latoRegular(20),
                        ),
                        ]
                      ),
                    ),
                  ),
                 ),

                  Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: onEdit,
                    child: Container(
                      width: 240,
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
                        color: Colors.white,
                        
                      ),
                      child: Row(
                        children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 0),
                          child: Icon(
                            Icons.edit,
                            color: Color(0xFF535353),
                            size: 24,
                          ),
                        ),
                        Text(
                          'Editar',
                          style: Themes.latoRegular(20),
                        ),
                        ]
                      ),
                    ),
                  ),
                  ),

                  Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: InkWell(
                    onTap: onDelete,
                    child: Container(
                      width: 240,
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
                        color: Colors.white,
                        
                      ),
                      child: Row(
                        children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 0),
                          child: Icon(
                            Icons.delete,
                            color: Color(0xFFFB383C),
                            size: 24,
                          ),
                        ),
                        Text(
                          'Excluir',
                          style: Themes.latoRegular(20).copyWith(color: Color(0xFFFB383C)),
                        ),
                        ]
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
