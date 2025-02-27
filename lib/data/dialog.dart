

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../pk.dart';

Future getDialog({
  String? title,
  Widget? content,
  String? cancelButton,
  String? acceptButton,
  Function()? cancelButtonFunc,
  Function()? acceptButtonFunc,
  Color? cancelButtonColor,
  Color? acceptButtonColor,
}) async {
  await Get.dialog(
    Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.green),
            padding: const EdgeInsets.all(10),
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: content,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(cancelButtonColor ?? Colors.red)),
                    onPressed: cancelButtonFunc ?? () => Get.back(),
                    child: Text(cancelButton ?? 'Back', style: const TextStyle(color: Colors.white)),
                  ),
                ),
                if (acceptButtonFunc != null) const SizedBox(width: 10),
                if (acceptButtonFunc != null)
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(acceptButtonColor ?? Colors.green)),
                      onPressed: acceptButtonFunc,
                      child: Text(acceptButton ?? '', style: const TextStyle(color: Colors.white)),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

/*
  void rejectAlertDialog(PromotionApplicationApprovalModel approval) async {
    await getDialog(
      title: 'Reject Approval Alert',
      content: const Text(
        'Are you sure to reject this file?',
        style: TextStyle(fontSize: 18),
      ),
      acceptButtonFunc: () async {
        Get.back();
   //     await rejectTransOfficeOrderItem(approval);
      },
      acceptButton: 'OK',
      cancelButton: 'Back',
    );
  }
 */