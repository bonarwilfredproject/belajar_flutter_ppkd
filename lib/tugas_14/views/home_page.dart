import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/ghibli_film_model.dart';
import '../services/ghibli_film_service.dart';
import 'ghibli_detail_page.dart';

class GhibliHomePage extends StatefulWidget {
  const GhibliHomePage({super.key});

  @override
  State<GhibliHomePage> createState() => _GhibliHomePageState();
}

class _GhibliHomePageState extends State<GhibliHomePage> {
  List<GhibliFilm> films = [];
  List<GhibliFilm> filteredFilms = [];
  Set<String> favorites = {};
  bool isLoading = true;
  String query = "";
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchData();
    loadFavorites();
  }

  Future<void> fetchData() async {
    final data = await GhibliFilmService.fetchFilms();
    setState(() {
      films = data;
      filteredFilms = data;
      isLoading = false;
    });
  }

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      favorites = prefs.getStringList('favorites')?.toSet() ?? {};
    });
  }

  void toggleFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      if (favorites.contains(id)) {
        favorites.remove(id);
      } else {
        favorites.add(id);
      }
    });

    prefs.setStringList('favorites', favorites.toList());
  }

  void searchFilm(String value) {
    setState(() {
      query = value;
      filteredFilms = films
          .where(
            (film) => film.title.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "GhibliFlix",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              color: Colors.black,
              onRefresh: () async {
                await fetchData();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSearchBar(),
                    if (filteredFilms.isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "No movies found 😢",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                    if (filteredFilms.isNotEmpty)
                      _buildBanner(filteredFilms.first),
                    const SizedBox(height: 20),
                    _buildSection("🔥 Popular", filteredFilms.take(5).toList()),
                    const SizedBox(height: 20),
                    _buildSection("🎬 All Movies", filteredFilms),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: searchController,
        onChanged: searchFilm,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Search movies...",
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: const Icon(Icons.search, color: Colors.white),
          // ❌ CLEAR BUTTON
          suffixIcon: query.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    searchController.clear();
                    searchFilm("");
                  },
                )
              : null,
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildBanner(GhibliFilm film) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GhibliDetailPage(
              film: film,
              heroTag: "${film.id}-banner",
              isFavorite: favorites.contains(film.id),
              onToggleFavorite: () => toggleFavorite(film.id),
              allFilms: films,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Hero(
            tag: "${film.id}-banner",
            child: Image.network(
              film.image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Text(
              film.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<GhibliFilm> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final film = list[index];
              final isFav = favorites.contains(film.id);

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GhibliDetailPage(
                        film: film,
                        heroTag: "${film.id}-$title",
                        isFavorite: favorites.contains(film.id),
                        onToggleFavorite: () => toggleFavorite(film.id),
                        allFilms: films,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 120,
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Hero(
                            tag: "${film.id}-$title",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                film.image,
                                height: 140,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: GestureDetector(
                              onTap: () => toggleFavorite(film.id),
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        film.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
