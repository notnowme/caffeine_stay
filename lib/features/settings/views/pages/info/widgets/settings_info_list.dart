part of '../settings_info_screen.dart';

class _List extends ConsumerStatefulWidget {
  const _List();

  @override
  ConsumerState<_List> createState() => _ListState();
}

class _ListState extends ConsumerState<_List> with MyInfoState, MyInfoEvent {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await getMyInfo(ref);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        Padding(
          padding: context.edgeInsets(
            horizontal: context.w(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Section(
                title: '신체 정보',
                list: [
                  Consumer(
                    builder: (consumerContext, ref, child) {
                      final weight = watchWeight(ref);
                      return _SectionItem(
                        icon: CupertinoIcons.person_fill,
                        label: '체중',
                        onTap: () async {
                          final value = await showModalBottomSheet(
                            useRootNavigator: true,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            enableDrag: true,
                            context: context,
                            builder: (bottomSheetContext) {
                              return _BottomSheet(
                                value: weight,
                              );
                            },
                          );
                          if (value != null) {
                            final modfiedWeight =
                                double.tryParse(value) ?? weight;
                            setWeight(ref, modfiedWeight);
                            read(ref);
                          }
                        },
                        amount: weight,
                        unit: 'kg',
                      );
                    },
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final age = watchAge(ref);
                      return _SectionItem(
                        icon: CupertinoIcons.calendar,
                        label: '나이',
                        onTap: () async {
                          final value = await showModalBottomSheet(
                            useRootNavigator: true,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            enableDrag: true,
                            context: context,
                            builder: (bottomSheetContext) {
                              return _BottomSheet(
                                value: age,
                              );
                            },
                          );
                          if (value != null) {
                            final modifedAge = int.tryParse(value) ?? age;
                            setAge(ref, modifedAge);
                            read(ref);
                          }
                        },
                        amount: age,
                        unit: '세',
                      );
                    },
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final gender = watchGender(ref);
                      return _SectionToggleItem(
                        icon: CupertinoIcons.person_2_fill,
                        label: '성별',
                        option1: '남성',
                        option2: '여성',
                        ontapFirst: () {
                          setGender(ref, Gender.male);
                          read(ref);
                        },
                        ontapSecond: () {
                          setGender(ref, Gender.female);
                          read(ref);
                        },
                        selectedIndex: Gender.male == gender ? 0 : 1,
                      );
                    },
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final smoking = watchSmoking(ref);
                      return _SectionToggleItem(
                        icon: Icons.smoking_rooms_rounded,
                        label: '흡연 여부',
                        option1: '흡연',
                        option2: '비흡연',
                        ontapFirst: () {
                          setSmoking(ref, true);
                          read(ref);
                        },
                        ontapSecond: () {
                          setSmoking(ref, false);
                          read(ref);
                        },
                        selectedIndex: smoking ? 0 : 1,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
