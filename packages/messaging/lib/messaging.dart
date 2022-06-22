library messaging;

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

part 'src/messaging.dart';

void showMessage(Widget child) {
  showToastWidget(child);
}

void showInfo(String message) {
  showMessage(_AppNotification(
    color: const Color(0xFF00C851),
    icon: const Icon(Icons.check_circle_outline_rounded),
    message: message,
  ));
}

void showError(String message) {
  showMessage(_AppNotification(
    color: const Color(0xFFF44336),
    icon: const Icon(Icons.error_outline_rounded),
    message: message,
  ));
}

void showWarning(String message) {
  showMessage(_AppNotification(
    color: const Color(0xFFFFBB33),
    icon: const Icon(Icons.warning_amber_rounded),
    message: message,
  ));
}

class _AppNotification extends StatelessWidget {
  const _AppNotification({
    Key? key,
    required this.message,
    required this.icon,
    required this.color,
  })  : action = null,
        actionLabel = null,
        super(key: key);

  final String message;
  final Widget icon;
  final void Function()? action;
  final String? actionLabel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        constraints: const BoxConstraints(
          minHeight: 60,
          maxHeight: 60,
          maxWidth: 414,
        ),
        child: Material(
          elevation: 4,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(10),
          ),
          clipBehavior: Clip.hardEdge,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: color,
                  child: Center(
                    child: IconTheme(
                      data: const IconThemeData(color: Colors.white, size: 36),
                      child: icon,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const SizedBox(width: 10),
              if (action != null) ...[
                Material(
                  child: TextButton(
                    onPressed: action!,
                    child: Text(actionLabel!),
                  ),
                ),
                const SizedBox(width: 10),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
