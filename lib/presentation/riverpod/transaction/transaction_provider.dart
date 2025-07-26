import 'package:flutter_riverpod/flutter_riverpod.dart' show FutureProvider;
import 'package:remittance/app/utils/enums.dart';
import 'package:remittance/app/utils/helper_methods.dart';
import 'package:remittance/presentation/riverpod/user/userProvider.dart';

final transactionDataProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final notifier = ref.read(authNotifierProvider.notifier);
  final currentUserId = ref.watch(authNotifierProvider.select((auth) => auth.user?.id ?? ""));

  if (currentUserId.isEmpty) {
    return {
      "sent": [],
      "received": [],
      "users": {},
      "hasData": false,
    };
  }

  final sent = await notifier.sendTransactions(currentUserId) ?? [];
  final received = await notifier.receivedTransactions(currentUserId) ?? [];

  for (var rec in received) {
    rec.status = enumToString(TransactionStatus.debited);
  }
  for (var s in sent) {
    s.status = enumToString(TransactionStatus.sent);
  }

  final all = [...sent, ...received];

  final userIds = all
      .map((tx) => tx.senderId == currentUserId ? tx.receiverId : tx.senderId)
      .toSet()
      .whereType<String>();

  final users = await Future.wait(userIds.map((id) => notifier.getUserById(id)));
  final userMap = {
    for (var user in users)
      if (user?.id != null) user!.id!: user
  };

  return {
    "sent": sent,
    "received": received,
    "users": userMap,
  };
});
