import 'package:flutter/material.dart';
import '../Screens/CarDetailsScreen.dart';
import '../models/car_model.dart';
import '../widgets/AppBottomNavBar.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("السيارات المتوفرة"),
        backgroundColor: const Color(0xFF00C6FF),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/filter');
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: carList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final car = carList[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(5),
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            car.imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              car.name,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(car.price, style: const TextStyle(color: Colors.grey)),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 4,
                              children: car.features.map((feature) {
                                return Chip(label: Text(feature));
                              }).toList(),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => CarDetailsScreen(car: car),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF00C6FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text("احجز الآن"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "أنواع أخرى",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                children: const [
                  CategoryCard(
                    title: 'سيارة رياضية',
                    imagePath: 'assets/images/Categories/sport.png',
                    count: 728,
                  ),
                  CategoryCard(
                    title: 'سيارة اقتصادية',
                    imagePath: 'assets/images/Categories/economic.png',
                    count: 38,
                  ),
                  CategoryCard(
                    title: 'سيارة عائلية',
                    imagePath: 'assets/images/Categories/family.png',
                    count: 728
                    ,

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavBar(context, 0),

    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final int count;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(imagePath)),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('$count ITEM', style: const TextStyle(color: Colors.grey)),

        ],


      ),
    );
  }
}
