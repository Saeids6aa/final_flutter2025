import 'package:final_flutter2025/Screens/CarDetailsScreen.dart';
import 'package:final_flutter2025/widgets/AppBottomNavBar.dart';
import 'package:flutter/material.dart';
import '../models/car_model.dart';

class SearchCarScreen extends StatefulWidget {
  const SearchCarScreen({super.key});

  @override
  State<SearchCarScreen> createState() => _SearchCarScreenState();
}

class _SearchCarScreenState extends State<SearchCarScreen> {
  String query = '';
  List<Car> filteredCars = carList;

  void updateSearch(String value) {
    setState(() {
      query = value.toLowerCase();
      filteredCars = carList.where((car) {
        return car.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("بحث عن سيارة"),
        backgroundColor: const Color(0xFF00C6FF),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: updateSearch,
              decoration: InputDecoration(
                hintText: 'ابحث باسم السيارة...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCars.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final car = filteredCars[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Image.asset(car.imagePath, width: 60, fit: BoxFit.contain),
                    title: Text(car.name),
                    subtitle: Text(car.price),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CarDetailsScreen(car: car),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavBar(context, 2),

    );
  }
}
