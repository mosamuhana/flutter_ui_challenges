import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/ui_constants.dart';

class PaymentSuccessDialog extends StatelessWidget {
  final _avatarImage = '$STORE_BASE_URL/img%2F3.jpg?alt=media';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 370,
        child: Dialog(
          child: Padding(
            padding: _insets16,
            child: Column(
              children: [
                Text("Thank You!", style: _greenStyle),
                Text("Your transaction was successful", style: _greyS14Style),
                _divider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("DATE", style: _greyS14Style),
                    Text("TIME", style: _greyS14Style),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("2, April 2019"),
                    Text("9:10 AM"),
                  ],
                ),
                hSizedBox20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("TO", style: _greyS14Style),
                        Text("Manny Moto"),
                        Text("manny.moto@gmail.com", style: _greyS12Style),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      //backgroundImage: AssetImage(_avatarImage),
                      backgroundImage: NetworkImage(_avatarImage),
                    )
                  ],
                ),
                hSizedBox20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("AMOUNT", style: _greyS14Style),
                        Text("\$ 15000"),
                      ],
                    ),
                    Text("COMPLETED", style: _greyS14Style)
                  ],
                ),
                hSizedBox20,
                Container(
                  padding: _insets10,
                  decoration: _cardDecoration,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        child: _accountBalanceWalletIcon,
                      ),
                      wSizedBox10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Credit/Debit Card"),
                          Text("Master Card ending ***5", style: _greyS12Style),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final _greyS12Style = TextStyle(color: Colors.grey, fontSize: 12);
  final _greyS14Style = TextStyle(color: Colors.grey, fontSize: 14);
  final _greenStyle = TextStyle(color: Colors.green);

  final _insets16 = EdgeInsets.all(16);
  final _insets10 = EdgeInsets.all(10);

  final _cardDecoration = BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(5));

  final _divider = Divider();
  final _accountBalanceWalletIcon = Icon(Icons.account_balance_wallet);
}
