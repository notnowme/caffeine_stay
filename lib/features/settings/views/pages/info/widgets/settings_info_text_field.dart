part of '../settings_info_screen.dart';

class _SettingsTextField extends StatefulWidget {
  const _SettingsTextField({
    this.onChanged,
    required this.nums,
  });

  final ValueChanged<String>? onChanged;
  final String nums;

  @override
  State<_SettingsTextField> createState() => __InfoTextFieldState();
}

class __InfoTextFieldState extends State<_SettingsTextField> {
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
      autofocus: true,
      keyboardType: TextInputType.number,
      focusNode: _focus,
      style: PretendardText.body2.copyWith(color: AppColor.primaryColor),
      cursorColor: AppColor.primaryColor,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.secondaryColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primaryColor.withValues(alpha: 0.2),
            width: 2.0,
            strokeAlign: BorderSide.strokeAlignOutside,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(context.r(12)),
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
            Radius.circular(context.r(12)),
          ),
        ),
        border: InputBorder.none,
      ),
      controller: _controller,
    );
  }
}
