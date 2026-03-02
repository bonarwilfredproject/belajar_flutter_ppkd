import 'package:belajar_flutter_ppkd/database/event_controller.dart';
import 'package:belajar_flutter_ppkd/models/event_model.dart';
import 'package:belajar_flutter_ppkd/tugas_11/tugas_11_screen.dart';
import 'package:belajar_flutter_ppkd/utils/event_tile.dart';
import 'package:flutter/material.dart';

class Tugas11Events extends StatefulWidget {
  const Tugas11Events({super.key});

  @override
  State<Tugas11Events> createState() => _Tugas11EventsState();
}

class _Tugas11EventsState extends State<Tugas11Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 164,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Tugas11Screen();
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(flex: 4, child: Text("Buat Event")),
                        Expanded(child: Icon(Icons.create)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                FutureBuilder(
                  future: EventController.getAllEvent(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    final List<EventModel>? data = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = data?[index];
                        return Column(
                          children: [eventTile(items), SizedBox(height: 16)],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
