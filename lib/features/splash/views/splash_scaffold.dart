part of 'splash_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.text,
    required this.loading,
  });

  final Widget text;
  final Widget loading;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          context.verticalSpace(242),
          text,
          const Spacer(),
          loading,
          context.verticalSpace(80),
        ],
      ),
    );
  }
}
