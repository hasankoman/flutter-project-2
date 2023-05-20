import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Flutter Boys',
              style: TextStyle(fontSize: 30),
            ),
          ),
          ProfileCard(
            name: 'Hasan Koman',
            skills: [
              'Firebase Authentication Entegration',
              'Flutter Login Screen',
              'Flutter Register Screen',
              'Flutter Splash Screen',
              'Flutter Profile Screen'
            ],
          ),
          ProfileCard(
            name: 'Ömer Aksaray',
            skills: [
              'Firebase Firestore Database Entegration',
              'Flutter Home Screen',
              'Flutter Product Detail Screen',
              'Flutter Cart Screen'
            ],
          ),
          SizedBox(height: 10),
          ProfileCard(
            name: 'Erol Nebioğlu',
            skills: [
              'Firebase Authentication Entegration',
              'Flutter Login Screen',
              'Flutter Register Screen',
              'Flutter Splash Screen',
              'Flutter Profile Screen'
            ],
          ),
          SizedBox(height: 10),
          ProfileCard(
            name: 'Emir Özbek',
            skills: [
              'Firebase Firestore Database Entegration',
              'Flutter Home Screen',
              'Flutter Product Detail Screen',
              'Flutter Cart Screen'
            ],
          ),
          SizedBox(height: 10),
          ProfileCard(
            name: 'Ataberk Kubilay Kızlıer',
            skills: [
              'Firebase Firestore Database Entegration',
              'Flutter Home Screen',
              'Flutter Product Detail Screen',
              'Flutter Cart Screen'
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final List<String> skills;

  ProfileCard({required this.name, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Skills:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Wrap(
              spacing: 5,
              runSpacing: 10,
              children: skills.map((skill) => SkillChip(skill: skill)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;

  SkillChip({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        skill,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
