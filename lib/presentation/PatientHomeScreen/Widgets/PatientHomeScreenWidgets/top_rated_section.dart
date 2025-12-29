import '../../../../../imports.dart';

class TopRatedSection extends StatelessWidget {
  const TopRatedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الأعلى تقييما',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(15),
            trailing: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(' 3 ', style: TextStyle(fontSize: 15)),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                ],
              ),
            ),
            leading: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(AppImages.splashLogo),
              backgroundColor: Colors.white,
            ),
            title: Text(
              'علي  بن خالد ',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              'جراحة عامة',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
