part of '../settings_info_screen.dart';

class _Tips extends StatelessWidget {
  const _Tips();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: context.edgeInsets(
          horizontal: context.w(12),
        ),
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            padding: EdgeInsets.zero,
            strokeWidth: 2,
            dashPattern: [4, 4],
            color: AppColor.primaryColor,
            strokeCap: StrokeCap.round,
            radius: Radius.circular(
              context.r(12),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  context.r(12),
                ),
              ),
            ),
            padding: context.edgeInsets(
              horizontal: context.w(12),
              vertical: context.h(8),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '알고 계셨나요? ',
                    style: PretendardText.body6.copyWith(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text:
                        '흡연자는 비흡연자보다 카페인 분해 속도가 빠릅니다. 정확한 반감기 계산을 위해 현재 상태를 입력해 주세요.',
                    style: PretendardText.body7.copyWith(
                      color: AppColor.primaryColor.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
