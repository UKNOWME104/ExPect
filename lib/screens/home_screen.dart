import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Petagram"),
        backgroundColor: Colors.teal[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  HomeCard(
                    title: "Your Pet Profiles",
                    subtitle: "Manage your pets' information",
                    icon: Icons.pets,
                    onTap: () => Navigator.pushNamed(context, '/petProfile'),
                  ),
                  HomeCard(
                    title: "Meal Planner",
                    subtitle: "Set up feeding schedules",
                    icon: Icons.food_bank,
                    onTap: () => Navigator.pushNamed(context, '/mealPlanner'),
                  ),
                  HomeCard(
                    title: "Upcoming Reminders",
                    subtitle: "View medication and vet appointments",
                    icon: Icons.notifications,
                    onTap: () => Navigator.pushNamed(context, '/reminders'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const HomeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal[400], size: 30),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}
