import '../../../../data/models/user.dart';
import '../../../../imports.dart';

class SearchLoadedView extends StatelessWidget {
  final List<UserModel> doctors;

  const SearchLoadedView({super.key, required this.doctors, required this.onTap});

  final void Function(UserModel doctor) onTap; // ناخد الـ doctor
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: GestureDetector(
            onTap: () => onTap(doctor), // استخدمي closure
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(15),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      ' 3 ',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Icon(Icons.star, color: Colors.orange, size: 20),
                  ],
                ),
                leading: CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      doctor.imageUrl != null
                          ? NetworkImage(doctor.imageUrl!)
                          : AssetImage(AppImages.splashLogo) as ImageProvider,
                  backgroundColor: Colors.white,
                ),
                title: Text(
                  doctor.name ?? 'غير معروف',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  doctor.specialization ?? 'لا يوجد تخصص',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
