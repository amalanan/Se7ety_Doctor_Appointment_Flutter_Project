import '../../../imports.dart';

class BookAnAppointmentScreen extends StatefulWidget {
  BookAnAppointmentScreen({super.key, required this.doctor});

  final UserModel doctor;

  @override
  State<BookAnAppointmentScreen> createState() =>
      _BookAnAppointmentScreenState();
}

class _BookAnAppointmentScreenState extends State<BookAnAppointmentScreen> {
  final TextEditingController dataController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController bookingDateController = TextEditingController();
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: BasicAppBar(
          appTitle: 'احجز مع دكتورك',
          icon: Icons.arrow_back_ios,
          onLeadingPressed: () => Navigator.of(context).pop(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DoctorHeaderSection(
                  doctor: widget.doctor,
                  containerColor: Colors.blue.withOpacity(0.09),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          ' -- أدخل بيانات الحجز --',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'اسم المريض',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      _buildTextField(dataController: dataController, hint: ''),
                      const SizedBox(height: 10),
                      Text(
                        'رقم الهاتف',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      _buildTextField(dataController: dataController, hint: ''),
                      const SizedBox(height: 10),
                      Text(
                        'وصف الحالة',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      _buildTextField(
                        dataController: bioController,
                        hint: '..',
                        radius: 30,
                        maxLines: 6,
                        minLines: 4,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'تاريخ الحجز',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      _buildTextField(
                        hint: '',
                        dataController: bookingDateController,
                        icon: Icons.calendar_month,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'وقت الحجز',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),

                      TimeSlotSelector(
                        onTimeSelected: (time) {
                          selectedTime = time;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController dataController,
    required String hint,
    int radius = 50,
    int? maxLines,
    int? minLines,
    IconData? icon,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: TextField(
          controller: dataController,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          textAlign: TextAlign.right,
          // مهم للنص العربي
          textAlignVertical: TextAlignVertical.top,
          keyboardType: TextInputType.text,
          // بدل emailAddress
          decoration: _buildDecoration(
            hint: hint,
            icon: icon,
            radius: radius.toDouble(),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildDecoration({
    required String hint,
    IconData? icon,
    double radius = 30,
  }) {
    return InputDecoration(
      hintText: hint,
      hintTextDirection: TextDirection.rtl,
      hintStyle: const TextStyle(color: Colors.grey),
      suffixIcon:
          icon != null
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(icon, color: Colors.white),
                  ),
                ),
              )
              : null,
      filled: true,
      fillColor: Colors.blue.withOpacity(0.09),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide.none,
      ),
    );
  }
}

class TimeSlotSelector extends StatefulWidget {
  final Function(String) onTimeSelected;

  const TimeSlotSelector({super.key, required this.onTimeSelected});

  @override
  State<TimeSlotSelector> createState() => _TimeSlotSelectorState();
}

class _TimeSlotSelectorState extends State<TimeSlotSelector> {
  String? selectedTime;

  final List<String> times = [
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 10,
          children:
              times.map((time) {
                final isSelected = selectedTime == time;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = time;
                    });
                    widget.onTimeSelected(time);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.primary : Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      time,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
