import 'package:flutter/material.dart';
import 'dart:io';
import 'check_in_screen.dart';
import '../models/check_in_data.dart';
import '../services/storage_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StorageService _storageService = StorageService();
  List<CheckInData> _checkInData = [];
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _loadCheckInData();
  }

  Future<void> _loadCheckInData() async {
    final data = await _storageService.getCheckInData();
    setState(() {
      _checkInData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diyosinfotech'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body:
          _checkInData.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to Check-In App',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Tap the camera button to check in',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              )
              : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _checkInData.length,
                itemBuilder: (context, index) {
                  final data = _checkInData[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = _selectedIndex == index ? null : index;
                      });
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: _selectedIndex == index ? 8 : 2,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Image
                          Image.file(File(data.imagePath), fit: BoxFit.cover),

                          // Details Overlay
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(
                                    _selectedIndex == index ? 0.7 : 0.0,
                                  ),
                                  Colors.black.withOpacity(
                                    _selectedIndex == index ? 0.9 : 0.5,
                                  ),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Date & Time Tag
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    data.timestamp,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Location
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 200),
                                  opacity: _selectedIndex == index ? 1.0 : 0.0,
                                  child: Text(
                                    data.address,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CheckInScreen()),
          );
          _loadCheckInData();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
    );
  }
}
