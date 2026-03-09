import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../screen/movie_detail_page.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final Set<int> _filmDiDaftar = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Tontonan By You Scope")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          
          bool isAdded = _filmDiDaftar.contains(index);

          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailPage(movie: movie),
                  ),
                );
              },

              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                        ),
                        child: Image.network(
                          movie.imgUrl,
                          width: 100,
                          height: 140,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const SizedBox(
                            width: 100,
                            height: 140,
                            child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text("Tahun Rilis: ${movie.year}"),
                              const SizedBox(height: 4),
                              Text(
                                "Rating:  ${movie.rating}",
                                style: TextStyle(
                                  color: Colors.orange[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: SizedBox(
                      width: double.infinity, 
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: isAdded ? Colors.blue : Colors.white,
                          side: BorderSide(
                            color: isAdded ? Colors.blue : Colors.black,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (isAdded) {
                              _filmDiDaftar.remove(index);
                            } else {
                              _filmDiDaftar.add(index);
                            }
                          });
                        },
                        child: Text(
                          isAdded ? "Ditambahkan" : "Tambahkan ke Daftar",
                          style: TextStyle(
                            color: isAdded ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}