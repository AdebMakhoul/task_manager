import 'package:flutter/material.dart';

Widget chartRow(BuildContext context, String label, int pct,int total) {
  return Row(
    children: [
      Text(label, style: TextStyle(fontSize: 10)),
      SizedBox(width: 8),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Stack(children: [
          Container(
            width: (MediaQuery.of(context).size.width * 0.7) / 2,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            child: Text(''),
          ),
          Container(
            width: pct!=0?( (MediaQuery.of(context).size.width * (pct / total) * 0.7) / 2): 0,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(20)),
            child: Text(''),
          ),
        ]),
      ),
    ],
  );
}
