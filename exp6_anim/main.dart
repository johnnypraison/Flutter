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
      title: 'Animation App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const AnimationShowcasePage(),
    );
  }
}

class AnimationShowcasePage extends StatefulWidget {
  const AnimationShowcasePage({super.key});

  @override
  State<AnimationShowcasePage> createState() => _AnimationShowcasePageState();
}

class _AnimationShowcasePageState extends State<AnimationShowcasePage> {
  // Step 3 – Create state variable tracking target sizing profile
  bool isLarge = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation Lab'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Step 2 & 4 – Create AnimatedContainer driven by state parameters
            AnimatedContainer(
              duration: const Duration(seconds: 1), // Transition timescale
              curve: Curves.easeInOut,              // Smooth acceleration curves
              width: isLarge ? 300 : 150,           // Conditional sizing attributes
              height: isLarge ? 300 : 150,
              decoration: BoxDecoration(
                color: isLarge ? Colors.deepPurple : Colors.amber, 
                borderRadius: BorderRadius.circular(isLarge ? 40 : 20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(51),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: const Center(
                child: Text(
                  'Flutter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),

            // Step 5 – Add button to trigger structural change properties
            ElevatedButton(
              onPressed: () {
                // Re-render UI by toggling structural state criteria
                setState(() {
                  isLarge = !isLarge;
                });
              },
              child: const Text('Animate View'),
            ),
          ],
        ),
      ),
    );
  }
}
