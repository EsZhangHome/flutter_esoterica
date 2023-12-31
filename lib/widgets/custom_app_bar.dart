import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, this.title = '',
      this.centerTitle = true,
      this.rightDMActions,
      this.backgroundColor,
      this.mainColor = const Color(0xFF17262A),
      this.titleW,
      this.bottom,
      this.leadingImg = '',
      this.leadingW,
      this.systemOverlayStyle = const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, //全局设置透明
          statusBarIconBrightness: Brightness.dark //light:黑色图标 dark：白色图标
      ),
      this.automaticallyImplyLeading = true,
      this.elevation = 4.0});

  final String title;
  final bool centerTitle; //标题是否居中，默认居中
  final List<Widget>? rightDMActions;
  final Color? backgroundColor;
  final Color mainColor;
  final Widget? titleW;
  final Widget? leadingW;
  final PreferredSizeWidget? bottom;
  final String leadingImg;
  final double elevation;
  final SystemUiOverlayStyle systemOverlayStyle; //状态栏颜色 默认为白色文字
  final bool automaticallyImplyLeading; //配合leading 使用，如果左侧不需要图标 ，设置false

  /// appbar 的高度  默认高度是：56  kToolbarHeight
  @override
  Size get preferredSize =>
      Size.fromHeight(48.0 + (bottom?.preferredSize.height ?? 0.0));

  Widget leading(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context)!;
    final bool canPop = parentRoute.canPop;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    return canPop
        ? useCloseButton
            ? CloseButton(color: mainColor)
            : BackButton(color: mainColor)
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleW ?? Text(title,
              style: TextStyle(
                  color: mainColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500)),
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      elevation: elevation,
      leading:
          leadingW ?? (automaticallyImplyLeading ? leading(context) : null),
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle,
      actions: rightDMActions ?? [const Center()],
      bottom: bottom,
      systemOverlayStyle: systemOverlayStyle,
    );
  }
}
