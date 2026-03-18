part of '../settings_screen.dart';

class _List extends StatelessWidget with ApiMixin {
  const _List();

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        Section(
          title: '계정 관리',
          list: [
            SettingsItem(
              icon: Icons.boy_rounded,
              label: '개인 정보',
              onTap: () {
                context.pushNamed(SettingsInfoScreen.routeName);
              },
            ),
            SettingsItem(
              icon: Icons.notifications_rounded,
              label: '알림 설정',
              onTap: () {
                context.pushNamed(SettingsNotifyScreen.routeName);
              },
            ),
          ],
        ),
        context.verticalSpace(36),
        Section(
          title: '데이터 및 서비스',
          list: [
            SettingsItem(
              icon: Icons.share_rounded,
              label: '데이터 내보내기',
              onTap: () {},
            ),
            SettingsItem(
              isWarn: true,
              icon: Icons.refresh_rounded,
              label: '데이터 초기화',
              onTap: () async {
                //
              },
            ),
          ],
        ),
        context.verticalSpace(36),
        Section(
          title: '기타',
          list: [
            SettingsItem(
              icon: Icons.info_outlined,
              label: '이용 약관',
              onTap: () {},
            ),
            SettingsItem(
              icon: Icons.people_alt_rounded,
              label: '개인정보 처리방침',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
