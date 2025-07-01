import 'package:final_flutter2025/widgets/AppBottomNavBar.dart';
import 'package:flutter/material.dart';
import '../../models/car_model.dart';
import 'SuccessScreen.dart';

class CarDetailsScreen extends StatelessWidget {
  final Car car;

  const CarDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(car.name),
        backgroundColor: const Color(0xFF00C6FF),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    car.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Text(
                car.name,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.attach_money, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    car.price,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                car.details,
                style: const TextStyle(fontSize: 16, height: 1.5),
                textAlign: TextAlign.justify,
              ),


              const SizedBox(height: 28),

              const Row(
                children: [
                  Icon(Icons.directions_car, color: Color(0xFF00C6FF)),
                  SizedBox(width: 8),
                  Text(
                    "المواصفات",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: car.features.map((feature) {
                  return Chip(
                    avatar: const Icon(Icons.check_circle, size: 18, color: Color(0xFF007AFF)),
                    label: Text(feature),
                    backgroundColor: const Color(0xFFEAF6FF),
                  );
                }).toList(),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SuccessScreen()),
                    );
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("تأكيد الحجز", style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C6FF),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
      bottomNavigationBar: buildBottomNavBar(context, 0),

    );
  }
}
