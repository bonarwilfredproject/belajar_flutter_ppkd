import 'package:belajar_flutter_ppkd/models/event_model.dart';
import 'package:flutter/material.dart';

Container eventTile(EventModel? items) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: BoxBorder.all(),
      borderRadius: BorderRadius.circular(16),
    ),
    width: double.infinity,
    child: Column(
      children: [
        Row(
          children: [
            Expanded(child: Icon(Icons.event)),
            Expanded(flex: 4, child: Text(items!.namaEvent)),
          ],
        ),

        Row(
          children: [
            Expanded(child: Icon(Icons.location_on)),
            Expanded(flex: 4, child: Text(items.lokasi)),
          ],
        ),
        Row(
          children: [
            Expanded(child: Icon(Icons.numbers)),
            Expanded(flex: 4, child: Text(items.id.toString())),
          ],
        ),
      ],
    ),
  );
}
