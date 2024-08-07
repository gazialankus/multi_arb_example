part of 'settings_screen.dart';

final class _ItemWidget extends StatelessWidget {
  final Locale item;
  final bool isSelected;
  final VoidCallback onTap;

  const _ItemWidget({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.primary;
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
          elevation: WidgetStateProperty.all(1.0),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          iconColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return textColor.withOpacity(0.5);
              } else if (states.contains(WidgetState.pressed)) {
                return textColor.withOpacity(0.5);
              }
              return textColor;
            },
          ),
          shape: WidgetStateProperty.all(const BeveledRectangleBorder())),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: 50.0,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  item.name(context),
                ),
              ),
              Visibility(
                visible: isSelected,
                child: const Icon(Icons.check),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
