import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pet_database_provider.dart';

class PetDatabaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the PetDatabaseProvider to get and load pet breeds
    final provider = Provider.of<PetDatabaseProvider>(context);

    // Load pet breeds if they are not already loaded
    if (provider.petBreeds.isEmpty) {
      provider.loadPetBreeds();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Pet Database"),
        backgroundColor: Colors.teal[400],
      ),
      body: provider.petBreeds.isEmpty
      // If no pet breeds are loaded, show loading indicator
          ? Center(child: CircularProgressIndicator())
      // Display the list of pet breeds once the data is loaded
          : ListView.builder(
        itemCount: provider.petBreeds.length,
        itemBuilder: (context, index) {
          final breed = provider.petBreeds[index];
          return ListTile(
            title: Text(breed['breed'] ?? "Unknown Breed"),
            subtitle: breed['description'] != null
                ? Text(breed['description'])
                : null,
          );
        },
      ),
    );
  }
}
