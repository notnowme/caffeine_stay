part of '../settings_info_screen.dart';

class _BottomSheet extends ConsumerStatefulWidget {
  const _BottomSheet({
    required this.value,
  });

  final num value;

  @override
  ConsumerState<_BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends ConsumerState<_BottomSheet> {
  dynamic result;
  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Container(
      padding: context.edgeInsets(
        horizontal: context.w(16),
        bottom: context.h(30),
      ),
      margin: EdgeInsets.only(
        bottom: isKeyboardVisible
            ? MediaQuery.of(context).viewInsets.bottom
            : 0,
      ),
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.r(16)),
          topRight: Radius.circular(context.r(16)),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, context.h(20)),
            blurRadius: 25,
            spreadRadius: -3,
            color: AppColor.primaryColor.withValues(alpha: 0.1),
          ),
          BoxShadow(
            offset: Offset(0, context.h(8)),
            blurRadius: 10,
            spreadRadius: -6,
            color: AppColor.primaryColor.withValues(alpha: 0.1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          context.verticalSpace(12),
          Center(
            child: Container(
              width: context.w(48),
              height: context.h(4),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withValues(
                  alpha: 0.2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(context.r(6)),
                ),
              ),
            ),
          ),
          context.verticalSpace(24),
          _SettingsTextField(
            nums: widget.value.toString(),
            onChanged: (value) {
              result = value;
            },
          ),
          context.verticalSpace(16),
          BounceTapper(
            child: BounceButton(
              buttonColor: AppColor.primaryColor,
              text: Text(
                '변경하기',
                style: PretendardText.title4.copyWith(
                  color: AppColor.backgroundColor,
                ),
              ),
              action: () {
                print(result);
                context.pop(result);
              },
            ),
          ),
        ],
      ),
    );
  }
}
