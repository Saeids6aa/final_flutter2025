class Car {
  final String name;
  final String details;
  final String imagePath;
  final String price;
  final List<String> features;

  Car({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.features,
    required this.details,
  });
}

final List<Car> carList = [
  Car(
    name: 'Renault Duster',
    details: 'هذه السيارة مثالية لرحلاتك اليومية والعملية، تتميز بتوفير الوقود وراحة '
        'القيادة مع مساحة داخلية مناسبة لجميع الأفراد.',
    imagePath: 'assets/images/img_cars/Renault.png',
    price: '180',
    features: [
      'مكيف هواء ',
      '1 حقيبة كبيرة ',
      '4 أبواب',
      'ناقل يدوي ',
      '4 مقاعد ',
    ],
  ),
  Car(
    name: 'Kia Picanto',
    details: 'هذه السيارة مثالية لرحلاتك اليومية والعملية، تتميز بتوفير الوقود وراحة '
        'القيادة مع مساحة داخلية مناسبة لجميع الأفراد.',
    imagePath: 'assets/images/img_cars/kia.png',
    price: '150',
    features: [
      'مكيف ',
      'ناقل أوتوماتيك',
      '3 أبواب',
      'اقتصادية ',
    ],
  ),
  Car(
    name: 'BMW 3 Series',
    details: 'هذه السيارة مثالية لرحلاتك اليومية والعملية، تتميز بتوفير الوقود وراحة '
        'القيادة مع مساحة داخلية مناسبة لجميع الأفراد.',
    imagePath: 'assets/images/img_cars/bmw.png',
    price: '300',
    features: [
      'ناقل أوتوماتيك',
      'فتحة سقف ️',
      'مقاعد جلد ',
      '5 أبواب ',
    ],
  ),
  Car(
    name: 'Kia Picanto',
    details: 'هذه السيارة مثالية لرحلاتك اليومية والعملية، تتميز بتوفير الوقود وراحة '
        'القيادة مع مساحة داخلية مناسبة لجميع الأفراد.',
    imagePath: 'assets/images/img_cars/kia.png',
    price: '150',
    features: [
      'مكيف ',
      'ناقل أوتوماتيك',
      '3 أبواب',
      'اقتصادية ',
    ],
  ),
  Car(
    name: 'Renault Duster',
    details: 'هذه السيارة مثالية لرحلاتك اليومية والعملية، تتميز بتوفير الوقود وراحة '
        'القيادة مع مساحة داخلية مناسبة لجميع الأفراد.',
    imagePath: 'assets/images/img_cars/Renault.png',
    price: '180',
    features: [
      'مكيف هواء ',
      '1 حقيبة كبيرة ',
      '4 أبواب',
      'ناقل يدوي ',
      '4 مقاعد ',
    ],
  ),
];
