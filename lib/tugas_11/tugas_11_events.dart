import 'package:belajar_flutter_ppkd/database/event_controller.dart';
import 'package:belajar_flutter_ppkd/models/event_model.dart';
import 'package:belajar_flutter_ppkd/tugas_11/tugas_11_screen.dart';
import 'package:flutter/material.dart';

class Tugas11Events extends StatefulWidget {
  const Tugas11Events({super.key});

  @override
  State<Tugas11Events> createState() => _Tugas11EventsState();
}

class _Tugas11EventsState extends State<Tugas11Events> {
  late List<EventModel> dataEvent = [];

  @override
  void initState() {
    super.initState();
    getDataEvent();
  }

  Future<void> showEditDialog(BuildContext context, EventModel items) async {
    final namaEventController = TextEditingController(text: items.namaEvent);
    final lokasiController = TextEditingController(text: items.lokasi);
    String selectedSpot = items.spot;
    final List<String> spotList = ["Outdoor", "Indoor"];
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Event"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(controller: namaEventController),
              TextFormField(controller: lokasiController),
              DropdownButtonFormField(
                hint: Text(items.spot),
                items: spotList
                    .map(
                      (spot) =>
                          DropdownMenuItem(value: spot, child: Text(spot)),
                    )
                    .toList(),
                onChanged: (value) {
                  selectedSpot = value!;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (items.id == null) {
                  return;
                }
                await EventController.updateEvent(
                  EventModel(
                    id: items.id,
                    namaEvent: namaEventController.text,
                    lokasi: lokasiController.text,
                    spot: selectedSpot,
                  ),
                );
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Event berhasil diupdate")),
                );
                dataEvent = await EventController.getAllEvent();
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

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
                dataEvent.isEmpty || dataEvent == []
                    ? Center(child: CircularProgressIndicator())
                    : FutureBuilder(
                        future: EventController.getAllEvent(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          }
                          final List<EventModel>? data = snapshot.data;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              final items = data?[index];
                              return Container(
                                margin: EdgeInsets.all(16),
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
                                        Expanded(
                                          flex: 4,
                                          child: Text(items!.namaEvent),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Icon(Icons.location_on),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Text(items.lokasi),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Icon(Icons.beach_access),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Text(items.spot),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Icon(Icons.numbers)),
                                        Expanded(
                                          flex: 4,
                                          child: Text(items.id.toString()),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () async {
                                            await showEditDialog(
                                              context,
                                              items,
                                            );
                                            setState(() {});
                                            dataEvent =
                                                await EventController.getAllEvent();
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () async {
                                            await showDeleteDialog(
                                              context,
                                              items.id!,
                                            );
                                            setState(() {});
                                            dataEvent =
                                                await EventController.getAllEvent();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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

  Future<void> showDeleteDialog(BuildContext context, int id) async {
    final confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah anda yakin ingin menghapus event ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              },
              child: Text("Hapus"),
            ),
          ],
        );
      },
    );
    if (confirm == true) {
      await EventController.deleteEvent(id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Event berhasil dihapus")));
      dataEvent = await EventController.getAllEvent();
      setState(() {});
    }
  }

  Future<void> getDataEvent() async {
    await Future.delayed(Duration(seconds: 3));
    dataEvent = await EventController.getAllEvent();
    setState(() {});
  }
}
