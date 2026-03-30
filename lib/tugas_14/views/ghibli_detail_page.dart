import 'package:belajar_flutter_ppkd/tugas_14/services/ghibli_film_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/ghibli_film_model.dart';

class GhibliDetailPage extends StatefulWidget {
  final GhibliFilm film;
  final String heroTag;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final List<GhibliFilm> allFilms;

  const GhibliDetailPage({
    super.key,
    required this.film,
    required this.heroTag,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.allFilms,
  });

  @override
  State<GhibliDetailPage> createState() => _GhibliDetailPageState();
}

class _GhibliDetailPageState extends State<GhibliDetailPage> {
  late bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = widget.isFavorite;
  }

  List<GhibliFilm> getSimilarFilms() {
    return widget.allFilms.where((f) {
      return f.id != widget.film.id && f.director == widget.film.director;
    }).toList();
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white70, fontSize: 12),
      ),
    );
  }

  Future<void> playTrailer() async {
    final query = "${widget.film.title} trailer";

    final url = Uri.parse(
      "https://www.youtube.com/results?search_query=${Uri.encodeComponent(query)}",
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.platformDefault);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 🎬 BACKGROUND IMAGE
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Hero(
              tag: widget.heroTag,
              child: Material(
                type: MaterialType.transparency,
                child: Image.network(widget.film.image, fit: BoxFit.cover),
              ),
            ),
          ),

          // 🌑 GRADIENT OVERLAY (BIAR KAYAK NETFLIX)
          Container(
            height: 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // 📄 CONTENT
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 300),
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🎬 TITLE
                  Text(
                    widget.film.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // 🎬 META INFO (NETFLIX STYLE)
                  Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: [
                      _buildTag(widget.film.releaseDate),
                      _buildTag("⭐ ${widget.film.rtScore}%"),
                      _buildTag("${widget.film.runningTime} min"),
                      _buildTag(widget.film.director),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ▶️ BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: playTrailer,
                          icon: const Icon(Icons.play_arrow),
                          label: const Text("Play"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFav = !isFav;
                          });
                          widget.onToggleFavorite();
                        },
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 📝 DESCRIPTION
                  const Text(
                    "Overview",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.film.description,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 25),

                  const Text(
                    "Cast",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  FutureBuilder(
                    future: GhibliFilmService.fetchPeople(widget.film.people),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text(
                          "No cast data",
                          style: TextStyle(color: Colors.white54),
                        );
                      }

                      final people = snapshot.data!;

                      return SizedBox(
                        height: 110,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: people.length,
                          itemBuilder: (context, index) {
                            final person = people[index];

                            return Container(
                              width: 90,
                              margin: const EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.grey[800],
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    person['name'] ?? 'Unknown',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "More Like This",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Builder(
                    builder: (context) {
                      final similar = getSimilarFilms();

                      if (similar.isEmpty) {
                        return const Text(
                          "No similar movies",
                          style: TextStyle(color: Colors.white54),
                        );
                      }

                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: similar.length,
                          itemBuilder: (context, index) {
                            final item = similar[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => GhibliDetailPage(
                                      film: item,
                                      heroTag: item.id,
                                      isFavorite: widget.isFavorite,
                                      onToggleFavorite: widget.onToggleFavorite,
                                      allFilms: widget.allFilms,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 120,
                                margin: const EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 🎬 POSTER
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        item.image,
                                        height: 140,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    // 📝 TITLE
                                    SizedBox(
                                      height: 34, // ⛔ FIX overflow text
                                      child: Text(
                                        item.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // 🔙 BACK BUTTON
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  splashRadius: 20,
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
