import 'package:flutter/material.dart';
import 'package:kreis/data/repositories/home_repository.dart';
import 'package:kreis/presentation/widgets/custom_widgets/custom_card.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late HomeRepository homeRepository;

  @override
  void initState() {
    super.initState();
    homeRepository = HomeRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
          future: homeRepository.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List categoryItems = snapshot.data!;

              return SizedBox(
                  width: 343,
                  height: 288,
                  child: Column(
                    children: [
                      CategoriesRows(start: 0, list: categoryItems),
                      CategoriesRows(start: 4, list: categoryItems),
                    ],
                  ));
            } else if (snapshot.hasError) {
              // Display an error message
              return Text('Error: ${snapshot.error}');
            } else {
              // Display a loading indicator
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}

// ignore: must_be_immutable
class CategoriesRows extends StatelessWidget {
  int start;
  dynamic list;
  CategoriesRows({super.key, required this.start, required this.list});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (subIndex) {
        final item = list[start + subIndex];
        return CustomCard(title: item.title, image: item.image);
      }),
    );
  }
}
