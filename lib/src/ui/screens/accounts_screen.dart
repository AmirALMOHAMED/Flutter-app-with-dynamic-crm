import 'package:dataverse_accounts_sample_app/src/blocs/accounts/accounts_state.dart';
import 'package:dataverse_accounts_sample_app/src/ui/screens/account_details_screen.dart';
import 'package:dataverse_accounts_sample_app/src/network/aad_oauth_client.dart';
import 'package:dataverse_accounts_sample_app/src/ui/widgets/account_grid_card.dart';
import 'package:dataverse_accounts_sample_app/src/ui/widgets/account_list_card.dart';
import 'package:dataverse_accounts_sample_app/src/utils/di/service_locator.dart';
import 'package:dataverse_accounts_sample_app/src/utils/view_type.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/accounts/accounts_bloc.dart';
import '../../blocs/accounts/accounts_event.dart';
import '../widgets/account_filter_menu.dart';
import 'account_details_screen.dart';

class AccountsScreen extends StatefulWidget{
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();

}

class _AccountsScreenState extends State<AccountsScreen>{
  late AccountsBloc bloc;
  int _crossAxisCount = 1;
  double _aspectRatio = 3;
  ViewType viewType = ViewType.listview;

  TextEditingController searchTextController = TextEditingController();

  @override
  initState(){
    super.initState();
    bloc = context.read<AccountsBloc>();
    //bloc.add(FetchDataEvent());
  }

  // Widget _buildAccountGridCard(Account account, VoidCallback? onTap) {
  //   return InkWell(
  //     onTap: onTap,
  //     child: Padding(
  //     padding: const EdgeInsets.symmetric(
  //       horizontal: 8,
  //       vertical: 8,
  //     ),
  //     child: Card(
  //       elevation: 5,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(10),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(8),
  //               child: account.entityimage_url == null
  //                   ? Container(
  //                 //width: 200,
  //                 height: 100,
  //                 color: Colors.grey,
  //               ) :
  //               Image.network(
  //                 account.entityimage_url!,
  //                 //width: 200,
  //                 height: 100,
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.symmetric(
  //               horizontal: 8,
  //               vertical: 8,
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   '${account.name}-${account.statecode}',
  //                   style: const TextStyle(
  //                     fontSize: 12,
  //                   ),
  //                   maxLines: 1,
  //                 ),
  //
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 14),
  //                   child: Row(
  //                     children: [
  //                       Expanded(
  //                         flex: 1,
  //                         child: Padding(
  //                           padding: const EdgeInsets.only(
  //                             right: 8,
  //                           ),
  //                           child: Text(
  //                             account.address1_stateorprovince == null ? "": account.address1_stateorprovince!,
  //                             style: const TextStyle(
  //                               fontWeight: FontWeight.w700,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),
  //   );
  // }

  // Widget _buildAccountListCard(Account account, VoidCallback? onTap) {
  //   return InkWell(onTap: onTap,
  //   child: SizedBox(
  //     height: 100,
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Card(
  //         elevation: 5,
  //         child: Row(
  //           children: [
  //             ClipRRect(
  //               borderRadius: BorderRadius.circular(10),
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(8),
  //                 child: account.entityimage_url == null
  //                     ? Container(
  //                   width: 100,
  //                   //height: 100,
  //                   color: Colors.grey,
  //                 ) :
  //                 Image.network(
  //                   account.entityimage_url!,
  //                   width: 100,
  //                   //height: 100,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(width: 8),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(
  //               horizontal: 8,
  //               vertical: 16,
  //               ),
  //               child:Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     '${account.name}- ${account.statecode}',
  //                     style: const TextStyle(fontSize: 14),
  //                   ),
  //                   const SizedBox(height: 8,),
  //                   Text(
  //                     account.address1_stateorprovince == null ? "": account.address1_stateorprovince!,
  //                     style: const TextStyle(fontSize: 12),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //
  //   ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<AadOauthClient>().navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: const InputDecoration(
              hintText: 'Search',
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 16,
              ),
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(
              color: Colors.white,
            ),
            onChanged: (value){
              bloc.add(SearchDataEvent(query: value));
            },
            controller: searchTextController,
          ),
          actions: [
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                customButton: const Icon(
                  Icons.filter_list_alt,
                  size: 28,
                  color: Colors.white,
                ),
                customItemsIndexes: const [3],
                customItemsHeight: 8,
                items: [
                  ...AccountMenuItems.firstItems.map(
                        (item) =>
                        DropdownMenuItem<AccountMenuItem>(
                          value: item,
                          child: AccountMenuItems.buildItem(item),
                        ),
                  ),
                ],
                onChanged: (value) {
                  //MenuItems.onChanged(context, value as MenuItem);
                },
                itemHeight: 48,
                itemPadding: const EdgeInsets.only(left: 16, right: 16),
                dropdownWidth: 160,
                dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.blue,
                ),
                dropdownElevation: 8,
                offset: const Offset(0, 8),
              ),
            ),
            IconButton(
              onPressed: (){
                _aspectRatio = 3;
                _crossAxisCount = 1;
                viewType = ViewType.listview;
                setState((){});

              },
              icon: const Icon(
                Icons.list,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: (){
                _aspectRatio = 1;
                _crossAxisCount = 2;
                viewType = ViewType.gridview;
                setState((){});
              },
              icon: const Icon(
                Icons.grid_view_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: BlocConsumer<AccountsBloc, AccountsState>(
          listener: (context, state) {
            if(state is AccountsErrorFetchDataState)
              {
                (errorMsg) =>Center(
                  child: Column(
                    children: [
                      Text(state.errorMsg),
                      ElevatedButton(
                        child: const Text("Try Again"),
                        onPressed: () {
                          bloc.add(FetchDataEvent());
                          searchTextController.clear();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      ),
                    ],
                  ),
                );
              }
            else{
              () => const SizedBox();
            }
          },
          builder: (context, state) {
            if (state is AccountsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AccountsSuccessFetchDataState) {
              return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return viewType == ViewType.listview? AccountListCard(account: state.accounts[index], onTap:
                        () =>
                      Navigator.of(context).push(MaterialPageRoute(
                        builder:(context) => AccountDetailsScreen(account: state.accounts[index]
                        ),
                      ))):
                    AccountGridCard(account: state.accounts[index],onTap:
                        () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AccountDetailsScreen(account: state.accounts[index]
                                ),
                            )));
                  },
                  itemCount: state.accounts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _crossAxisCount,
                    childAspectRatio: _aspectRatio,
                  ),

              )
              );
            }
            if (state is AccountsErrorFetchDataState) {
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMsg),
                    ElevatedButton(
                      child: const Text("Try Again"),
                      onPressed: () {
                        bloc.add(FetchDataEvent());
                        searchTextController.clear();
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                  ],
                ),
              );
            }

            return Center(
              child: ElevatedButton(
                child: const Text("Try again"),
                onPressed: () {
                  bloc.add(FetchDataEvent());
                  searchTextController.clear();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

