import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Media Assets App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MediaGalleryPage(),
    );
  }
}

class MediaGalleryPage extends StatelessWidget {
  const MediaGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Assets Gallery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        key: const Key('media_body'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Step 6: Single Image Asset',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // Step 6 – Display image standalone
            Center(
              child: SizedBox(
                height: 150,
                child: Image.asset(
                  'assets/images/flutter.png',
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      'Missing image! Please place "flutter.png" inside "assets/images/"',
                      style: TextStyle(color: Colors.red),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            const Text(
              'Step 7: Image Gallery Grid',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // Step 7 – Create image gallery grid view
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  Image.asset('assets/images/flutter.png', fit: BoxFit.cover),
                  Image.asset('assets/images/flutter.png', fit: BoxFit.cover),
                  Image.asset('assets/images/flutter.png', fit: BoxFit.cover),
                  Image.asset('assets/images/flutter.png', fit: BoxFit.cover),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
