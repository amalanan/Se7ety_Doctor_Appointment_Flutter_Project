import '../../../../imports.dart';

class BookAppointmentButton extends StatelessWidget {
  const BookAppointmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicAppButton(
      horizontalSymmetric: 130,
      buttonText: 'احجز موعد الان',
      circularBorder: 12,
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const BookAnAppointmentScreen(),
          ),
              (route) => false,
        );
      },
    );
  }
}
