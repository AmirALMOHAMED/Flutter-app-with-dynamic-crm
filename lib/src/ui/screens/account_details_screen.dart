import 'package:flutter/material.dart';

import '../../models/account_model.dart';

class AccountDetailsScreen extends StatelessWidget{
  const AccountDetailsScreen({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(account.name!),
      ),
      body:SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Padding(
                padding:const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: Container(
                  width: double.maxFinite,
                  height: 200,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: account.entityimage_url == null
                        ? Container(
                      width: 100,
                      height: 80,
                      color: Colors.grey,
                    ) :
                    Image.network(
                      account.entityimage_url!,
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 200,
                child: Card(
                  color: Colors.grey[100],
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              const Text(
                                "Account Number:",
                              ),
                              Text(account.accountnumber ?? ""),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              const Text(
                                "Account Name:",
                              ),
                              Text(account.name ?? ""),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children:[
                              Text(
                                "Email Address:${account.emailaddress1!}",
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12.0),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ) ,
      ),


    );
  }
}