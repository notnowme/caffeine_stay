part of '../myinfo_screen.dart';

class _InfoTextField extends StatefulWidget {
  const _InfoTextField({
    this.onChanged,
    required this.nums,
  });

  final ValueChanged<String>? onChanged;
  final String nums;

  @override
  State<_InfoTextField> createState() => __InfoTextFieldState();
}

class __InfoTextFieldState extends State<_InfoTextField> {
  late TextEditingController _controller;
  late FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = widget.nums;
    _focus = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      focusNode: _focus,
      style: PretendardText.body2.copyWith(color: AppColor.primaryColor),
      cursorColor: AppColor.primaryColor,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primaryColor.withAlpha(120),
            width: 1.0,
            strokeAlign: BorderSide.strokeAlignOutside,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(context.r(24)),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.secondaryColor,
            width: 2.0,
            strokeAlign: BorderSide.strokeAlignOutside,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(context.r(24)),
          ),
        ),
        border: InputBorder.none,
      ),
      controller: _controller,
    );
  }
}
