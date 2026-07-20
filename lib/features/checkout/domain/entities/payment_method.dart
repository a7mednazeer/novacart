import 'package:flutter/material.dart';

enum PaymentMethodType { cashOnDelivery, card, applePay, googlePay }

extension PaymentMethodTypeDisplay on PaymentMethodType {
  String get label => switch (this) {
        PaymentMethodType.cashOnDelivery => 'Cash on Delivery',
        PaymentMethodType.card => 'Credit / Debit Card',
        PaymentMethodType.applePay => 'Apple Pay',
        PaymentMethodType.googlePay => 'Google Pay',
      };

  String get subtitle => switch (this) {
        PaymentMethodType.cashOnDelivery => 'Pay when your order arrives',
        PaymentMethodType.card => 'Visa, Mastercard, and more',
        PaymentMethodType.applePay => 'Pay instantly with Face ID / Touch ID',
        PaymentMethodType.googlePay => 'Pay instantly with your Google account',
      };

  IconData get icon => switch (this) {
        PaymentMethodType.cashOnDelivery => Icons.payments_outlined,
        PaymentMethodType.card => Icons.credit_card_rounded,
        PaymentMethodType.applePay => Icons.apple,
        PaymentMethodType.googlePay => Icons.g_mobiledata,
      };
}
