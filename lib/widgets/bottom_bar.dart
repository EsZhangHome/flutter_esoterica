import 'package:flutter/material.dart';

class SalomonBottomBar extends StatelessWidget {
  const SalomonBottomBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedColorOpacity,
    this.itemShape = const StadiumBorder(),
    this.margin = const EdgeInsets.all(8),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutQuint,
  }) : super(key: key);

  /// item 集合
  final List<SalomonBottomBarItem> items;

  /// 当前展示 item 的 index
  final int currentIndex;

  /// 点击方法
  final Function(int)? onTap;

  /// 选中的颜色
  final Color? selectedItemColor;

  /// 未选中颜色
  final Color? unselectedItemColor;

  /// 选中颜色的透明度
  final double? selectedColorOpacity;

  /// item 的 形状
  final ShapeBorder itemShape;

  /// 外间距
  final EdgeInsets margin;

  /// 内间距
  final EdgeInsets itemPadding;

  /// 切换的动画时间
  final Duration duration;

  /// 切换的动画线性
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final item in items)
            TweenAnimationBuilder<double>(
              tween: Tween(
                end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
              ),
              curve: curve,
              duration: duration,
              builder: (context, t, _) {
                final selectedColor = item.selectedColor ??
                    selectedItemColor ??
                    theme.primaryColor;

                final unselectedColor = item.unselectedColor ??
                    unselectedItemColor ??
                    theme.iconTheme.color;

                return Material(
                  color: Color.lerp(
                      selectedColor.withOpacity(0.0),
                      selectedColor.withOpacity(selectedColorOpacity ?? 0.1),
                      t),
                  shape: itemShape,
                  child: InkWell(
                    onTap: () => onTap?.call(items.indexOf(item)),
                    customBorder: itemShape,
                    focusColor: selectedColor.withOpacity(0.1),
                    highlightColor: selectedColor.withOpacity(0.1),
                    splashColor: selectedColor.withOpacity(0.1),
                    hoverColor: selectedColor.withOpacity(0.1),
                    child: Padding(
                      padding: itemPadding -
                          EdgeInsets.only(right: itemPadding.right * t),
                      child: Row(
                        children: [
                          IconTheme(
                            data: IconThemeData(
                              color: Color.lerp(
                                  unselectedColor, selectedColor, t),
                              size: 24,
                            ),
                            child: items.indexOf(item) == currentIndex
                                ? item.activeIcon ?? item.icon
                                : item.icon,
                          ),
                          ClipRect(
                            child: SizedBox(
                              height: 20,
                              child: Align(
                                alignment: const Alignment(-0.2, 0.0),
                                widthFactor: t,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: itemPadding.right / 2,
                                      right: itemPadding.right),
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                      color: Color.lerp(
                                          selectedColor.withOpacity(0.0),
                                          selectedColor,
                                          t),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    child: item.title,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class SalomonBottomBarItem {
  /// icon 图标
  final Widget icon;

  /// 选中 icon 图标
  final Widget? activeIcon;

  /// 展示 文本
  final Widget title;

  /// 针对当前 item 的选中颜色
  final Color? selectedColor;

  ///  针对当前 item 的未选中颜色
  final Color? unselectedColor;

  SalomonBottomBarItem({
    required this.icon,
    required this.title,
    this.selectedColor,
    this.unselectedColor,
    this.activeIcon,
  });
}
