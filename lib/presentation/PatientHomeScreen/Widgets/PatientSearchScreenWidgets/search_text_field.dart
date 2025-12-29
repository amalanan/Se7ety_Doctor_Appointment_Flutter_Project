import '../../../../imports.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchController,
    required this.onPressed,
    required this.hintText,
    required this.iconColor,
    required this.searchColor,
    required this.onSubmitted,
  });

  final String hintText;
  final TextEditingController searchController;
  final VoidCallback onPressed;
  final Color searchColor;
  final Color iconColor;
  final void Function(dynamic) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: searchController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(

        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black),
        suffixIcon: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: searchColor,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            onPressed();
          },
          child: Icon(Icons.search, color: iconColor, size: 30),
        ),
        filled: true,
        fillColor: Colors.blue.withOpacity(0.09),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,

        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
      onSubmitted: (value) {
        onSubmitted(value);
      },
    );
  }
}
