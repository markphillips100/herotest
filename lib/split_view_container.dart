import 'package:flutter/material.dart';

class SplitViewContainer extends StatefulWidget {
  final Widget left;
  final Widget? right;
  final Widget? rightNoContext;

  const SplitViewContainer({
    Key? key,
    required this.left,
    this.right,
    this.rightNoContext,
  }) : super(key: key);

  @override
  _SplitViewContainerState createState() => _SplitViewContainerState();
}

class _SplitViewContainerState extends State<SplitViewContainer> {

  Widget _buildLayout() {
    return Row(
      children: [
        Expanded(
          child: widget.left,
        ),
        Container(width: 0.5, color: Colors.black),
        Expanded(
          flex: 1,
          child: widget.right ?? widget.rightNoContext ?? Container(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLayout();
  }
}