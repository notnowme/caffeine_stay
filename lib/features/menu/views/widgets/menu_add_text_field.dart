part of '../menu_screen.dart';

class _MenuAddTextField extends StatefulWidget {
  const _MenuAddTextField({
    required this.label,
    this.onChanged,
    this.isString = true,
  });

  final ValueChanged<String>? onChanged;
  final String label;
  final bool isString;

  @override
  State<_MenuAddTextField> createState() => __MenuAddTextFieldState();
}

class __MenuAddTextFieldState extends State<_MenuAddTextField> {
  late TextEditingController _controller;
  late FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: PretendardText.title6.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
        context.verticalSpace(4),
        TextField(
          keyboardType: widget.isString
              ? TextInputType.text
              : TextInputType.number,
          focusNode: _focus,
          style: PretendardText.body2.copyWith(color: AppColor.primaryColor),
          cursorColor: AppColor.primaryColor,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.descColor.withValues(alpha: 0.1),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.descColor.withValues(alpha: 0.5),
                width: 1.5,
                strokeAlign: BorderSide.strokeAlignOutside,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(context.r(16)),
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
                Radius.circular(context.r(16)),
              ),
            ),
            border: InputBorder.none,
          ),
          controller: _controller,
        ),
      ],
    );
  }
}
