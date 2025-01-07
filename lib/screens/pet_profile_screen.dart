import 'package:flutter/material.dart';
import 'package:petagram/models/pet.dart';
import 'package:provider/provider.dart';
import '../providers/pet_profile_provider.dart';
import '../services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PetProfileScreen extends StatefulWidget {
  @override
  _PetProfileScreenState createState() => _PetProfileScreenState();
}

class _PetProfileScreenState extends State<PetProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _medicalHistoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PetProfileProvider>(context);

    // Load pet profile data if it exists
    if (provider.pet != null) {
      _nameController.text = provider.pet!.name;
      _breedController.text = provider.pet!.breed;
      _ageController.text = provider.pet!.age.toString();
      _medicalHistoryController.text = provider.pet!.medicalHistory;
    }

    // Get the current user ID from Firebase
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Pet Profile"),
          backgroundColor: Colors.teal[400],
        ),
        body: Center(
          child: Text("Please log in to create or edit a pet profile."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(provider.pet == null ? "Create Pet Profile" : "Edit Pet Profile"),
        backgroundColor: Colors.teal[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Pet Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Pet Name"),
                validator: (value) => value!.isEmpty ? "Name is required" : null,
              ),
              // Pet Breed Field
              TextFormField(
                controller: _breedController,
                decoration: InputDecoration(labelText: "Breed"),
                validator: (value) => value!.isEmpty ? "Breed is required" : null,
              ),
              // Pet Age Field
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? "Age is required" : null,
              ),
              // Medical History Field
              TextFormField(
                controller: _medicalHistoryController,
                decoration: InputDecoration(labelText: "Medical History"),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              // Save Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Pet pet = Pet(
                      id: provider.pet?.id ?? '',  // Use existing ID if editing, else new ID
                      name: _nameController.text,
                      breed: _breedController.text,
                      age: int.parse(_ageController.text),
                      medicalHistory: _medicalHistoryController.text,
                    );

                    // Save or update pet profile in Firestore
                    if (provider.pet == null) {
                      // Create new pet profile
                      FirebaseService().savePetProfile(userId, pet);
                    } else {
                      // Update existing pet profile
                      FirebaseService().updatePetProfile(userId, pet);
                    }

                    provider.setPetProfile(pet); // Update provider state
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Pet Profile Saved!")),
                    );
                  }
                },
                child: Text("Save Profile"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[400]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
