import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              // to make the image circular
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/user.png',
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Pronob Biswas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontFamily: 'ComforterBrush',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Graphics Designer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              infoContainer(Icons.call, '+8801721222324'),
              const SizedBox(
                height: 20,
              ),
              infoContainer(Icons.mail, 'pronobbs@gmail.com'),
              const SizedBox(
                height: 20,
              ),
              infoContainer(Icons.shop, 'Dept. of CSE'),
              const SizedBox(
                height: 20,
              ),
              infoContainer(Icons.home, 'Copy-Paste University'),
            ],
          ),
        ),
      ),
    );
  }

  Container infoContainer(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      height: 50,
      color: Colors.white54,
      child: Row(
        children: [
          const SizedBox(
            width: 25,
          ),
          Icon(
            icon,
            size: 30,
          ),
          const SizedBox(
            width: 40,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
