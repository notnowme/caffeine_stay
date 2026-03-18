part of '../menu_screen.dart';

class MenuSearchBar extends ConsumerStatefulWidget {
  const MenuSearchBar({
    super.key,
    required this.onSubmit,
  });

  final ValueChanged<String>? onSubmit;

  @override
  ConsumerState<MenuSearchBar> createState() => _MenuSearchBarState();
}

class _MenuSearchBarState extends ConsumerState<MenuSearchBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.text = ref.read(menuSearchTextProvider);
    });
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(menuSearchTextProvider, (prev, next) {
      if (_controller.text != next) {
        _controller.text = next;
      }
    });
    return Stack(
      children: [
        TextField(
          onSubmitted: widget.onSubmit,
          onChanged: (value) {
            ref.read(menuSearchTextProvider.notifier).change(value);
          },
          controller: _controller,
          focusNode: _focusNode,
          cursorColor: AppColor.descColor,
          style: PretendardText.body2.copyWith(
            color: AppColor.primaryColor,
            decorationThickness: 0,
          ),
          cursorWidth: 2,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            filled: true,
            fillColor: AppColor.primaryColor.withValues(alpha: 0.1),
            contentPadding: context.edgeInsets(
              left: context.w(36),
              right: context.w(12),
              top: context.h(12),
              bottom: context.h(12),
            ),
            hintText: '음료를 검색하세요.',
            hintStyle: PretendardText.body2.copyWith(
              color: AppColor.descColor.withValues(alpha: 0.5),
              decorationThickness: 0,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(context.r(24)),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(context.r(24)),
              ),
            ),
            border: InputBorder.none,
            prefixIconConstraints: BoxConstraints(
              minWidth: context.w(52),
            ),
          ),
        ),
        Positioned(
          top: context.h(14),
          left: context.w(12),
          child: Icon(
            Icons.search_rounded,
            size: context.h(24),
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
