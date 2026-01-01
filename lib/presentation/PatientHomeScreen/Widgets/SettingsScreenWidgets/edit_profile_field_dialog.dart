import '../../../../imports.dart';

class EditProfileFieldDialog {
  static void show(
      BuildContext context, {
        required String title,
        required String field,
        required String initialValue,
        int maxLines = 1,
      }) {
    final controller = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder: (_) => Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'تعديل',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.09),
                    border: _inputBorder,
                    enabledBorder: _inputBorder,
                    focusedBorder: _inputBorder,
                  ),
                ),
                const SizedBox(height: 10),
                BasicAppButton(
                  verticalSymmetric: 10,
                  horizontalSymmetric: 120,
                  buttonText: 'حفظ',
                  circularBorder: 15,
                  onPressed: () {
                    context.read<PatientProfileCubit>().updateField(
                      field: field,
                      value: controller.text,
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static final _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide.none,
  );
}
