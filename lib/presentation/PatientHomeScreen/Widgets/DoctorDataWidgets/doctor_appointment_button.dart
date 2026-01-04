import 'package:se7ety_project/presentation/PatientHomeScreen/bloc/booking_appointments_bloc/booking_cubit.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => BlocProvider(
                  create: (_) => BookingCubit(),
                  child: BookAnAppointmentScreen(doctor: doctor),
                ),
          ),
        );
      },
    );
  }
}
