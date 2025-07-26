// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:remittance/app/config/extensions/them_extention.dart';
// import 'package:remittance/app/thems/colors.dart';
// import 'package:remittance/app/thems/size_config.dart';
// import 'package:remittance/app/utils/enums.dart';
// import 'package:remittance/app/utils/helper_methods.dart';
// import 'package:remittance/domain/dto/user/register_request.dart';
// import 'package:remittance/domain/dto/user/transaction.dart';
// import 'package:remittance/presentation/riverpod/user/authState.dart';
// import 'package:remittance/presentation/riverpod/user/userProvider.dart';
// import 'package:remittance/presentation/widgets/text_widget.dart';
// import 'package:intl/intl.dart';
//
// class TransactionWidget extends ConsumerWidget {
//   const TransactionWidget({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final notifier = ref.read(authNotifierProvider.notifier);
//     final currentUserId = ref.watch(authNotifierProvider).user?.id ?? "";
//
//     // Combine sent and received transactions and preload user info
//     final futureData = Future.wait<List<TransactionModel>>([
//       notifier.sendTransactions(currentUserId).then((value) => value ?? []),
//       notifier.receivedTransactions(currentUserId).then((value) => value ?? []),
//     ]).then((result) async {
//       final sent = result[0];
//       final received = result[1];
//
//       for (var rec in received) {
//         rec.status =enumToString( TransactionStatus.debited);
//       }
//       for (var s in sent) {
//         s.status = enumToString(TransactionStatus.sent);
//       }
//       final all = [...sent, ...received];
//
//       // Get all unique user IDs (excluding current user)
//       final userIds = all.map((tx) => tx.senderId == currentUserId ? tx.receiverId : tx.senderId).toSet().whereType<String>();
//
//       // Fetch all involved users
//       final users = await Future.wait(userIds.map((id) => notifier.getUserById(id)));
//       final userMap = {
//         for (var user in users)
//           if (user?.id != null && user != null) user.id!: user
//       };
//
//       return {
//         "sent": sent,
//         "received": received,
//         "users": userMap,
//       };
//     });
//
//     return FutureBuilder<Map<String, dynamic>>(
//       future: futureData,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         if (!snapshot.hasData || snapshot.data == null) {
//           return const Text("No transactions found.");
//         }
//
//         final sent = snapshot.data!["sent"] as List<TransactionModel>;
//         final received = snapshot.data!["received"] as List<TransactionModel>;
//         final userMap = snapshot.data!["users"] as Map<String, RegisterUser>;
//
//         final allTransactions = [...sent, ...received];
//         allTransactions.sort((a, b) => b.timestamp!.compareTo(a.timestamp!));
//
//         return Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: MySize.size14 ?? 14,
//             vertical: MySize.size5 ?? 5,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Flexible(
//                     child: TextWidgetText.textWidget(
//                       text: "Transaction",
//                       themeData: context.themeData.textTheme.displaySmall!,
//                       fontSize: MySize.size14,
//                       fontWeight: 400,
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                   Flexible(
//                     child: TextWidgetText.textWidget(
//                       text: "View All",
//                       themeData: context.themeData.textTheme.displaySmall!,
//                       fontSize: MySize.size14,
//                       fontWeight: 400,
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//
//               ...allTransactions.map((tx) {
//                 final isReceived = tx.receiverId == currentUserId;
//                 final otherUserId = isReceived ? tx.senderId : tx.receiverId;
//                 final userInfo = userMap[otherUserId ?? ""];
//
//                 final amountPrefix = isReceived ? '+' : '-';
//                 final amountColor = isReceived ? AppColors.greenColor : AppColors.lightPink;
//                 final iconPath = isReceived ? "assets/images/convert.png" : "assets/images/send_money.png";
//
//                 final title = isReceived
//                     ? "Received from ${userInfo?.name ?? 'User'}"
//                     : "Sent to ${userInfo?.name ?? 'User'}";
//
//                 return Padding(
//                   padding: EdgeInsets.only(bottom: MySize.size5 ?? 5),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: AppColors.lightBlack,
//                       borderRadius: BorderRadius.circular(MySize.size14 ?? 14),
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       vertical: MySize.size8 ?? 8,
//                       horizontal: MySize.size10 ?? 10,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Expanded(
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: AppColors.lightGrey,
//                                   borderRadius: BorderRadius.circular(MySize.size30 ?? 30),
//                                 ),
//                                 padding: EdgeInsets.all(MySize.size8 ?? 8),
//                                 child: Image.asset(iconPath, width: MySize.size20, height: MySize.size20),
//                               ),
//                               SizedBox(width: MySize.size10 ?? 10),
//                               Flexible(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     TextWidgetText.textWidget(
//                                       text: title,
//                                       themeData: context.themeData.textTheme.displaySmall!,
//                                       fontSize: MySize.size14,
//                                       fontWeight: 400,
//                                       textAlign: TextAlign.start,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     TextWidgetText.textWidget(
//                                       text: DateFormat('hh:mm a, MMM d').format(tx.timestamp!),
//                                       themeData: context.themeData.textTheme.displaySmall!,
//                                       fontSize: MySize.size8,
//                                       fontWeight: 400,
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         TextWidgetText.textWidget(
//                           text: "$amountPrefix \$${tx.amount?.toStringAsFixed(2) ?? '0.00'}",
//                           themeData: context.themeData.textTheme.displaySmall!,
//                           fontSize: MySize.size10,
//                           fontWeight: 500,
//                           color: amountColor,
//                           textAlign: TextAlign.end,
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/domain/dto/user/register_request.dart';
import 'package:remittance/domain/dto/user/transaction.dart';
import 'package:remittance/presentation/riverpod/transaction/transaction_provider.dart';
import 'package:remittance/presentation/riverpod/user/userProvider.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends ConsumerWidget {
  const TransactionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionSnapshot = ref.watch(transactionDataProvider);
    return transactionSnapshot.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text("Error: $e")),
      data: (data) {
        final sent = List<TransactionModel>.from(data["sent"] ?? []);
        final received = List<TransactionModel>.from(data["received"] ?? []);

        final dynamic rawUserMapDynamic = data["users"];
        final Map<String, RegisterUser> userMap = {};

        if (rawUserMapDynamic is Map) {
          rawUserMapDynamic.forEach((key, value) {
            if (key is String && value is RegisterUser) {
              userMap[key] = value;
            }
          });
        }
        final currentUserId = ref.watch(authNotifierProvider).user?.id ?? "";

        final allTransactions = [...sent, ...received]
          ..removeWhere((tx) => tx.timestamp == null);

        // Sort by date
        allTransactions.sort((a, b) => b.timestamp!.compareTo(a.timestamp!));

        // Show fallback if no transactions
        if (allTransactions.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Container(
              ),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MySize.size14 ?? 14,
            vertical: MySize.size5 ?? 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TextWidgetText.textWidget(
                      text: "Transaction",
                      themeData: context.themeData.textTheme.displaySmall!,
                      fontSize: MySize.size14,
                      fontWeight: 400,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Flexible(
                    child: TextWidgetText.textWidget(
                      text: "View All",
                      themeData: context.themeData.textTheme.displaySmall!,
                      fontSize: MySize.size14,
                      fontWeight: 400,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Transactions
              ...allTransactions.map((tx) {
                final isReceived = tx.receiverId == currentUserId;
                final otherUserId = isReceived ? tx.senderId : tx.receiverId;
                final userInfo = userMap[otherUserId ?? ""];

                final amountPrefix = isReceived ? '+' : '-';
                final amountColor =
                isReceived ? AppColors.greenColor : AppColors.lightPink;
                final iconPath = isReceived
                    ? "assets/images/convert.png"
                    : "assets/images/send_money.png";

                final title = isReceived
                    ? "Received from ${userInfo?.name ?? 'User'}"
                    : "Sent to ${userInfo?.name ?? 'User'}";

                return Padding(
                  padding: EdgeInsets.only(bottom: MySize.size5 ?? 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightBlack,
                      borderRadius: BorderRadius.circular(MySize.size14 ?? 14),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: MySize.size8 ?? 8,
                      horizontal: MySize.size10 ?? 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.lightGrey,
                                  borderRadius:
                                  BorderRadius.circular(MySize.size30 ?? 30),
                                ),
                                padding: EdgeInsets.all(MySize.size8 ?? 8),
                                child: Image.asset(
                                  iconPath,
                                  width: MySize.size20,
                                  height: MySize.size20,
                                ),
                              ),
                              SizedBox(width: MySize.size10 ?? 10),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextWidgetText.textWidget(
                                      text: title,
                                      themeData: context.themeData.textTheme
                                          .displaySmall!,
                                      fontSize: MySize.size14,
                                      fontWeight: 400,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    TextWidgetText.textWidget(
                                      text: DateFormat('hh:mm a, MMM d')
                                          .format(tx.timestamp!),
                                      themeData: context.themeData.textTheme
                                          .displaySmall!,
                                      fontSize: MySize.size8,
                                      fontWeight: 400,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextWidgetText.textWidget(
                          text:
                          "$amountPrefix \$${tx.amount?.toStringAsFixed(2) ?? '0.00'}",
                          themeData:
                          context.themeData.textTheme.displaySmall!,
                          fontSize: MySize.size10,
                          fontWeight: 500,
                          color: amountColor,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

