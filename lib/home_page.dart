import 'package:cats_dogs/view/cats/logic/cats_cubit.dart';
import 'package:cats_dogs/view/dogs/logic/dogs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/data/cata_data.dart';
import 'core/network/data/dogs_data.dart';
import 'display.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF6B73FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.pets,
                  color: Color(0xFF6B73FF),
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Dog and Cats',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TabBar(
                padding: const EdgeInsets.all(4),
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3182CE).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.pets,
                            color: Color(0xFF3182CE),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Dogs",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE53E3E).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.pets, // Heart icon representing love for cats
                            color: Color(0xFFE53E3E),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Cats",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF7FAFC), Color(0xFFEDF2F7)],
            ),
          ),
          child: TabBarView(
            children: [
              BlocProvider(
                create: (context) =>
                    DogImageCubit(context.read<DogImageService>())
                      ..fetchDogImage(),
                child: const PetDisplayPage(petType: 'Dog'),
              ),
              BlocProvider(
                create: (context) =>
                    CatImageCubit(context.read<CatImageService>())
                      ..fetchCatImage(),
                child: const PetDisplayPage(petType: 'Cat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
