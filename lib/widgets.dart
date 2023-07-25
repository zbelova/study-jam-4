import 'package:flutter/material.dart';

class LoadingErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const LoadingErrorWidget({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Нет связи с астралом. Попробуйте позже',
          ),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Повторить'),
          ),
        ],
      ),
    );
  }
}
