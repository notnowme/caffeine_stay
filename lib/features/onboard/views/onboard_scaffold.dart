part of 'onboard_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.icon,
    required this.text,
    required this.button,
  });

  final Widget icon;
  final Widget text;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        // TODO
        print('온보딩에선 뒤로 갈 수 없음.');
      },
      child: DefaultScaffold(
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            // 커스텀 스크롤 뷰 내 보이는 화면 꽉 차게 하기
            // Spacer 쓰기 위
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  context.verticalSpace(127),
                  icon,
                  context.verticalSpace(35),
                  text,
                  const Spacer(),
                  button,
                  context.verticalSpace(40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
