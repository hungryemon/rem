import 'package:flutter/material.dart';

import '../../../helpers/app_export.dart';

class RemSwitch extends StatefulWidget {
  /// Creates a material design switch.
  ///
  /// The following arguments are required:
  ///
  /// * [value] determines whether this switch is on or off.
  /// * [onToggle] is called when the user toggles the switch on or off.
  ///
  const RemSwitch({
    Key? key,
    required this.value,
    required this.onToggle,
    this.activeColor = ColorConstants.remYellow,
    this.inactiveColor = ColorConstants.remYellowOpac,
    this.activeTextColor = ColorConstants.white,
    this.inactiveTextColor = ColorConstants.remYellow,
    this.toggleColor = ColorConstants.white,
    this.activeToggleColor = ColorConstants.white,
    this.inactiveToggleColor = ColorConstants.remYellow,
    this.borderRadius = 20.0,
    this.showOnOff = false,
    this.activeText,
    this.inactiveText,
    this.switchBorder,
    this.activeSwitchBorder,
    this.inactiveSwitchBorder,
    this.toggleBorder,
    this.activeToggleBorder,
    this.inactiveToggleBorder,
    this.activeIcon,
    this.inactiveIcon,
    this.duration = const Duration(milliseconds: 200),
    this.disabled = false,
    this.switchSize = RemSwitchSize.MEDIUM,
  })  : assert(
            (switchBorder == null || activeSwitchBorder == null) &&
                (switchBorder == null || inactiveSwitchBorder == null),
            'Cannot provide switchBorder when an activeSwitchBorder or inactiveSwitchBorder was given\n'
            'To give the switch a border, use "activeSwitchBorder: border" or "inactiveSwitchBorder: border".'),
        assert(
            (toggleBorder == null || activeToggleBorder == null) &&
                (toggleBorder == null || inactiveToggleBorder == null),
            'Cannot provide toggleBorder when an activeToggleBorder or inactiveToggleBorder was given\n'
            'To give the toggle a border, use "activeToggleBorder: color" or "inactiveToggleBorder: color".'),
        super(key: key);

  /// Determines if the switch is on or off.
  ///
  /// This property is required.
  final bool value;

  /// Called when the user toggles the switch.
  ///
  /// This property is required.
  ///
  /// [onToggle] should update the state of the parent [StatefulWidget]
  /// using the [setState] method, so that the parent gets rebuilt; for example:
  ///
  /// ```dart
  /// FlutterSwitch(
  ///   value: _status,
  ///   width: 110,
  ///   borderRadius: 30.0,
  ///   onToggle: (val) {
  ///     setState(() {
  ///        _status = val;
  ///     });
  ///   },
  /// ),
  /// ```
  final ValueChanged<bool> onToggle;

  /// Displays an on or off text.
  ///
  /// Text value can be override by the [activeText] and
  /// [inactiveText] properties.
  ///
  /// Defaults to 'false' if no value was given.
  final bool showOnOff;

  /// The text to display when the switch is on.
  /// This parameter is only necessary when [showOnOff] property is true.
  ///
  /// Defaults to 'On' if no value was given.
  ///
  /// To change value style, the following properties are available
  ///
  /// [activeTextColor] - The color to use on the text value when the switch is on.
  final String? activeText;

  /// The text to display when the switch is off.
  /// This parameter is only necessary when [showOnOff] property is true.
  ///
  /// Defaults to 'Off' if no value was given.
  ///
  /// To change value style, the following properties are available
  ///
  /// [inactiveTextColor] - The color to use on the text value when the switch is off.
  final String? inactiveText;

  /// The color to use on the switch when the switch is on.

  final Color activeColor;

  /// The color to use on the switch when the switch is off.

  final Color inactiveColor;

  /// The color to use on the text value when the switch is on.
  /// This parameter is only necessary when [showOnOff] property is true.

  final Color activeTextColor;

  /// The color to use on the text value when the switch is off.
  /// This parameter is only necessary when [showOnOff] property is true.

  final Color inactiveTextColor;

  /// The color to use on the toggle of the switch.

  ///
  /// If the [activeSwitchBorder] or [inactiveSwitchBorder] is used, this property must be null.
  final Color toggleColor;

  /// The color to use on the toggle of the switch when the given value is true.
  ///
  /// If [inactiveToggleColor] is used and this property is null. the value of

  final Color? activeToggleColor;

  /// The color to use on the toggle of the switch when the given value is false.
  ///
  /// If [activeToggleColor] is used and this property is null. the value of

  final Color? inactiveToggleColor;

  /// The border radius of the switch.
  ///
  /// Defaults to the value of 20.0.
  final double borderRadius;

  /// The Size of the switch.
  ///
  /// Defaults to the value of [RemSwitchSize.MEDIUM].
  final RemSwitchSize switchSize;

  /// The border of the switch.
  ///
  /// This property will give a uniform border to both states of the toggle
  ///
  /// If the [activeSwitchBorder] or [inactiveSwitchBorder] is used, this property must be null.
  final BoxBorder? switchBorder;

  /// The border of the switch when the given value is true.
  ///
  /// This property is optional.
  final BoxBorder? activeSwitchBorder;

  /// The border of the switch when the given value is false.
  ///
  /// This property is optional.
  final BoxBorder? inactiveSwitchBorder;

  /// The border of the toggle.
  ///
  /// This property will give a uniform border to both states of the toggle
  ///
  /// If the [activeToggleBorder] or [inactiveToggleBorder] is used, this property must be null.
  final BoxBorder? toggleBorder;

  /// The border of the toggle when the given value is true.
  ///
  /// This property is optional.
  final BoxBorder? activeToggleBorder;

  /// The border of the toggle when the given value is false.
  ///
  /// This property is optional.
  final BoxBorder? inactiveToggleBorder;

  /// The icon inside the toggle when the given value is true.
  /// activeIcon can be an Icon Widget, an Image or Fontawesome Icons.
  ///
  /// This property is optional.
  final Widget? activeIcon;

  /// The icon inside the toggle when the given value is false.
  /// inactiveIcon can be an Icon Widget, an Image or Fontawesome Icons.
  ///
  /// This property is optional.
  final Widget? inactiveIcon;

  /// The duration in milliseconds to change the state of the switch
  ///
  /// Defaults to the value of 200 milliseconds.
  final Duration duration;

  /// Determines whether the switch is disabled.
  ///
  /// Defaults to the value of false.
  final bool disabled;

  @override
  _RemSwitchState createState() => _RemSwitchState();
}

class _RemSwitchState extends State<RemSwitch>
    with SingleTickerProviderStateMixin {
  late final Animation _toggleAnimation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
      duration: widget.duration,
    );
    _toggleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(RemSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value == widget.value) return;

    if (widget.value)
      _animationController.forward();
    else
      _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    Color _toggleColor = Colors.white;
    Color _switchColor = Colors.white;
    Border? _switchBorder;
    Border? _toggleBorder;
    double _width;
    double _height;
    double _padding;
    double _toggleSize;

    if (widget.value) {
      _toggleColor = widget.disabled
          ? ColorConstants.remBlack20
          : widget.activeToggleColor ?? widget.toggleColor;
      _switchColor =
          widget.disabled ? ColorConstants.remBlackOpac : widget.activeColor;
      _switchBorder = widget.activeSwitchBorder as Border? ??
          widget.switchBorder as Border?;
      _toggleBorder = widget.activeToggleBorder as Border? ??
          widget.toggleBorder as Border?;
    } else {
      _toggleColor = widget.disabled
          ? ColorConstants.remBlack20
          : widget.inactiveToggleColor ?? widget.toggleColor;
      _switchColor =
          widget.disabled ? ColorConstants.remBlackOpac : widget.inactiveColor;
      _switchBorder = widget.inactiveSwitchBorder as Border? ??
          widget.switchBorder as Border?;
      _toggleBorder = widget.inactiveToggleBorder as Border? ??
          widget.toggleBorder as Border?;
    }

    if (widget.switchSize == RemSwitchSize.LARGE) {
      _width = 56;
      _height = 32;
      _padding = 4;
      _toggleSize = 24;
    } else if (widget.switchSize == RemSwitchSize.MEDIUM) {
      _width = 48;
      _height = 24;
      _padding = 3;
      _toggleSize = 18;
    } else {
      _width = 40;
      _height = 20;
      _padding = 2;
      _toggleSize = 16;
    }

    double _textSpace = _width - _toggleSize;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          width: _width,
          child: Align(
            child: MouseRegion(
              cursor: !widget.disabled
                  ? SystemMouseCursors.click
                  : MouseCursor.defer,
              child: GestureDetector(
                onTap: () {
                  if (!widget.disabled) {
                    if (widget.value)
                      _animationController.forward();
                    else
                      _animationController.reverse();

                    widget.onToggle(!widget.value);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    color: _switchColor,
                    border: _switchBorder,
                  ),
                  child: Container(
                    width: _width,
                    height: _height,
                    padding: EdgeInsets.all(_padding),
                    child: Stack(
                      children: <Widget>[
                        AnimatedOpacity(
                          opacity: widget.value ? 1.0 : 0.0,
                          duration: widget.duration,
                          child: Container(
                            width: _textSpace,
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            alignment: Alignment.centerLeft,
                            child: _activeText,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AnimatedOpacity(
                            opacity: !widget.value ? 1.0 : 0.0,
                            duration: widget.duration,
                            child: Container(
                              width: _textSpace,
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              alignment: Alignment.centerRight,
                              child: _inactiveText,
                            ),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: _toggleAnimation.value,
                            child: Container(
                              width: _toggleSize,
                              height: _toggleSize,
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _toggleColor,
                                border: _toggleBorder,
                              ),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: AnimatedOpacity(
                                          opacity: widget.value ? 1.0 : 0.0,
                                          duration: widget.duration,
                                          child: widget.activeIcon,
                                        ),
                                      ),
                                      Center(
                                        child: AnimatedOpacity(
                                          opacity: !widget.value ? 1.0 : 0.0,
                                          duration: widget.duration,
                                          child: widget.inactiveIcon,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget get _activeText {
    if (widget.showOnOff) {
      return Text(
        widget.activeText ?? "On",
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: widget.disabled
                ? ColorConstants.remBlack20
                : widget.activeTextColor),
      );
    }

    return Text("");
  }

  Widget get _inactiveText {
    if (widget.showOnOff) {
      return Text(
        widget.inactiveText ?? "Off",
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: widget.disabled
                ? ColorConstants.remBlack20
                : widget.inactiveTextColor),
        textAlign: TextAlign.right,
      );
    }

    return Text("");
  }
}

enum RemSwitchSize {
  LARGE,
  MEDIUM,
  SMALL,
}
