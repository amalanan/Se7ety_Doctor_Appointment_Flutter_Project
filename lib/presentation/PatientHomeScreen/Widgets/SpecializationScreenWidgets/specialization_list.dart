import '../../../../../imports.dart';
import 'specialization_card_item.dart';
import 'specialization_model.dart';

class SpecializationList extends StatelessWidget {
  const SpecializationList({super.key});

  static const List<SpecializationModel> _items = [
    SpecializationModel(title: 'جراحة عامة', color: Colors.blue),
    SpecializationModel(title: 'دكتور قلب', color: Colors.green),
    SpecializationModel(title: 'دكتور عظام', color: Colors.orange),
    SpecializationModel(title: 'دكتور جلدية', color: Colors.blueGrey),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          return SpecializationCardItem(item: _items[index]);
        },
      ),
    );
  }
}
