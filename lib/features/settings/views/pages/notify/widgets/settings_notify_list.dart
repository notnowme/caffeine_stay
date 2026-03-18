part of '../settings_notify_screen.dart';

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        Section(
          title: '일반 알림',
          list: [
            SettingsItem(
              icon: Icons.abc,
              label: '카페인 리바운드 경고',
              desc: '카페인 수치가 급격히 낮아질 때 알림을 받습니다.',
              onTap: () {},
              button: ToggleSwitch(
                isOn: true,
                onTap: () {},
              ),
            ),
            SettingsItem(
              icon: Icons.abc,
              label: '수분 섭취 리마인드',
              desc: '규칙적인 수분 섭취를 위한 알림을 보냅니다.',
              onTap: () {},
              button: ToggleSwitch(
                isOn: false,
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
