part of 'myinfo_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.gender,
    required this.weight,
    required this.age,
    required this.smoking,
    required this.button,
  });

  final Widget appBar;
  final Widget gender;
  final Widget weight;
  final Widget age;
  final Widget smoking;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          appBar,
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: context.edgeInsets(
                horizontal: context.w(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  context.verticalSpace(16),
                  Text(
                    '정확한 카페인 분석을 위해\n정보를 입력해주세요',
                    style: PretendardText.heading5.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                  context.verticalSpace(16),
                  gender,
                  context.verticalSpace(24),
                  weight,
                  context.verticalSpace(24),
                  age,
                  context.verticalSpace(24),
                  smoking,
                  const Spacer(),
                  button,
                  context.verticalSpace(40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
