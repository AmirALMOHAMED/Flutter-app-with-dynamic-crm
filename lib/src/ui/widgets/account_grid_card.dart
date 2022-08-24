import 'package:flutter/material.dart';

import '../../models/account_model.dart';

class AccountGridCard extends StatelessWidget{
  const AccountGridCard({Key? key,@required this.account, @required this.onTap}) : super(key: key);

  final Account? account;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: account?.entityimage_url == null
                      ? Container(
                    //width: 200,
                    height: 100,
                    color: Colors.grey,
                  ) :
                  Image.network(
                    account!.entityimage_url!,
                    //width: 200,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${account?.name}-${account?.statecode}',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      maxLines: 1,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 8,
                              ),
                              child: Text(
                                account?.address1_stateorprovince == null ? "": account!.address1_stateorprovince!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}