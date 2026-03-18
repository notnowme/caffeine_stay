part of '../menu_screen.dart';

class _CustomAddBottomSheet extends StatelessWidget {
  const _CustomAddBottomSheet();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: context.edgeInsets(
          // horizontal: context.w(16),
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: context.edgeInsets(horizontal: context.w(24)),
          decoration: BoxDecoration(
            color: Colors.white,
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
              context.verticalSpace(12),

              Text(
                '직접 음료 등록하기',
                style: PretendardText.title1.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
              context.verticalSpace(24),
              const _MenuAddTextFieldList(),
              const _MenuAddCategory(),
              BounceTapper(
                child: BounceButton(
                  buttonColor: AppColor.primaryColor,
                  text: Text(
                    '추가하기',
                    style: PretendardText.title4.copyWith(
                      color: AppColor.backgroundColor,
                    ),
                  ),
                  action: () {
                    context.pop();
                  },
                ),
              ),
              context.verticalSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuAddTextFieldList extends StatelessWidget {
  const _MenuAddTextFieldList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MenuAddTextField(
          label: '음료 이름',
          onChanged: (value) {
            print(value);
          },
        ),
        context.verticalSpace(20),
        _MenuAddTextField(
          label: '카페인 함량 (mg)',
          isString: false,
          onChanged: (value) {
            print(value);
          },
        ),
        context.verticalSpace(20),
      ],
    );
  }
}
