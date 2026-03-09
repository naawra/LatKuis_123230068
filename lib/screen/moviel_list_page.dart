import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../screen/movie_detail_page.dart';

// stateless soalnya bkn yg dinamis bg
// kl stateful brrti yg dinamis kek login tadi
class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Tontonan By You Scope")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),

        // Langsung panggil panjang dari movieList yang ada di data
        itemCount: movieList.length,

        itemBuilder: (context, index) {
          final movie = movieList[index];

          return Card(
            elevation: 3, // card dikasi elev 3 biar kek ngambang
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      // topLeft: Radius.circular(12),
                      // bottomLeft: Radius.circular(12),
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
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            ),
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
                          Text(
                            "Tahun Rilis: ${movie.year}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Rating:  ${movie.rating}",
                            style: TextStyle(
                              color: Colors.orange[700],
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
