import 'package:flutter/material.dart';

import '../../models/account_model.dart';

class AccountListCard extends StatelessWidget{
  const AccountListCard({Key? key,@required this.account, @required this.onTap}) : super(key: key);

  final Account? account;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: account?.entityimage_url == null
                        ? Container(
                      width: 100,
                      //height: 100,
                      color: Colors.grey,
                    ) :
                    Image.network(
                      account!.entityimage_url!,
                      width: 100,
                      //height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${account?.name}- ${account?.statecode}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        account?.address1_stateorprovince == null ? "": account!.address1_stateorprovince!,
                        style: const TextStyle(fontSize: 12),
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

}