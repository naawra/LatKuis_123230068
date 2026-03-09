import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // dinamis ngikutin judul film yang diklik
      appBar: AppBar(title: Text(movie.title)),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie.imgUrl,
              width: double.infinity, 
              height: 600,
              fit: BoxFit.cover, 
            ),
            

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title, // bagian judul fim
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  

                  Text(
                    "Tahun: ${movie.year}  |  ⭐ ${movie.rating}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Genre: ${movie.genre}",
                    style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 16),
                  
                  Text("Sutradara: ${movie.director}", style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("Pemeran: ${movie.casts.join(', ')}"), 
                  
                  const Divider(height: 32, thickness: 1), 
                  
                  const Text(
                    "Sinopsis",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.synopsis,
                    style: const TextStyle(fontSize: 16, height: 1.5), 
                  ),

                  SizedBox(
                    width: double.infinity, 
                    height: 50, 
                    child: ElevatedButton.icon(
                      label: const Text("Info Lengkap", style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), 
                        ),
                      ),
                      onPressed: () async {
                        final Uri url = Uri.parse(movie.movieUrl);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url, mode: LaunchMode.externalApplication); 
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Gagal membuka link: ${movie.movieUrl}")),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}