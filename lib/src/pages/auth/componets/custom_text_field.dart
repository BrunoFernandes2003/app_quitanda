import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class customTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isScret;
  final List<TextInputFormatter>? inputFormatter;

  const customTextField({
    Key? key,
    required this.icon,
    required this.label,
    this.isScret = false,
    this.inputFormatter,
  }) : super(key: key);

  @override
  State<customTextField> createState() => _customTextFieldState();
}

class _customTextFieldState extends State<customTextField> {
  bool isObscure = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isObscure = widget.isScret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: widget.inputFormatter,
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isScret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
