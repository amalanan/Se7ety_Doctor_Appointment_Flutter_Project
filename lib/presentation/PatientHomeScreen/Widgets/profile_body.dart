import '../../../imports.dart';

class ProfileBody extends StatelessWidget {
  final PatientProfileLoaded state;

  const ProfileBody(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundImage:
                        state.imageUrl.isNotEmpty
                            ? NetworkImage(state.imageUrl)
                            : const AssetImage(AppImages.splashLogo)
                                as ImageProvider,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.name,
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(state.city, style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'نبذة تعريفية',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                state.bio.isEmpty ? 'لم تضاف' : state.bio,
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 330,
                  // عرض الخط (مش من الحفة للحفة)
                  child: Divider(thickness: 1.5, color: Colors.grey),
                ),
              ),
              const Text(
                'معلومات التواصل',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.email, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.phone, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.email,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          SizedBox(height: 40),
                          Text(
                            state.phone,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3),
              Center(
                child: SizedBox(
                  width: 330,
                  // عرض الخط (مش من الحفة للحفة)
                  child: Divider(thickness: 1.5, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'حجوزاتي',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'لا يوجد حجوزات سابقة',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
