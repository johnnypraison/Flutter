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
      title: 'Responsive UI Lab',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Student Dashboard'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // ------------------------------------------
          // MOBILE LAYOUT (Screen width less than 600px)
          // ------------------------------------------
          if (constraints.maxWidth < 600) {
            return _buildMobileLayout(context);
          }

          // ------------------------------------------
          // DESKTOP / TABLET LAYOUT (Screen width >= 600px)
          // ------------------------------------------
          return _buildDesktopLayout(context);
        },
      ),
    );
  }

  // ==================================================
  // MOBILE LAYOUT
  // ==================================================
  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),
          _buildListTileCard(Icons.person, 'Student', 'Student Profile and Information'),
          const SizedBox(height: 12),
          _buildListTileCard(Icons.book, 'Courses', 'View Registered Courses'),
          const SizedBox(height: 12),
          _buildListTileCard(Icons.check_circle, 'Attendance', 'View Attendance Details'),
          const SizedBox(height: 12),
          _buildListTileCard(Icons.assessment, 'Results', 'View Academic Results'),
        ],
      ),
    );
  }

  // Helper builder for mobile items to reduce redundant code
  Widget _buildListTileCard(IconData icon, String title, String subtitle) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, size: 36, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }

  // ==================================================
  // DESKTOP / TABLET LAYOUT
  // ==================================================
  Widget _buildDesktopLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: _buildDashboardCard(
                  context,
                  icon: Icons.person,
                  title: 'Students',
                  subtitle: 'Student Profile and Information',
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildDashboardCard(
                  context,
                  icon: Icons.book,
                  title: 'Courses',
                  subtitle: 'View Registered Courses',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildDashboardCard(
                  context,
                  icon: Icons.check_circle,
                  title: 'Attendance',
                  subtitle: 'View Attendance Details',
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildDashboardCard(
                  context,
                  icon: Icons.assessment,
                  title: 'Results',
                  subtitle: 'View Academic Results',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Grid/Row Dashboard card component for desktop view
  Widget _buildDashboardCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  // ==================================================
  // COMPLETED HEADER WIDGET
  // ==================================================
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.school,
            size: 60,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          const SizedBox(height: 12),
          Text(
            'Student Dashboard',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Welcome back! Manage your academic progress.',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
