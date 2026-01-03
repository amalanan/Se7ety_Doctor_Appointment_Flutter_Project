import '../../../../imports.dart';

class BookAppointmentButton extends StatelessWidget {
  const BookAppointmentButton({super.key, required this.doctor});

  final UserModel doctor;

  @override
  Widget build(BuildContext context) {
    return BasicAppButton(
      horizontalSymmetric: 130,
      buttonText: 'احجز موعد الان',
      circularBorder: 12,
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BookAnAppointmentScreen(doctor: doctor),
          ),);
      },
    );
  }
}

