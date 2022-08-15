import 'package:dataverse_accounts_sample_app/src/blocs/accounts/accounts_state.dart';
import 'package:dataverse_accounts_sample_app/src/ui/account_details_screen.dart';
import 'package:dataverse_accounts_sample_app/src/network/aad_oauth_client.dart';
import 'package:dataverse_accounts_sample_app/src/utils/di/service_locator.dart';
import 'package:dataverse_accounts_sample_app/src/utils/filter_option.dart';
import 'package:dataverse_accounts_sample_app/src/utils/view_type.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filter_list/filter_list.dart';
import '../blocs/accounts/accounts_bloc.dart';
import '../blocs/accounts/accounts_event.dart';
import '../models/account_model.dart';

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

  Widget _buildAccountGridCard(Account account, VoidCallback? onTap) {
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
                child: account.entityimage_url == null
                    ? Container(
                  //width: 200,
                  height: 100,
                  color: Colors.grey,
                ) :
                Image.network(
                  account.entityimage_url!,
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
                    '${account.name}-${account.statecode}',
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
                              account.address1_stateorprovince == null ? "": account.address1_stateorprovince!,
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

  Widget _buildAccountListCard(Account account, VoidCallback? onTap) {
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
                  child: account.entityimage_url == null
                      ? Container(
                    width: 100,
                    //height: 100,
                    color: Colors.grey,
                  ) :
                  Image.network(
                    account.entityimage_url!,
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
                      '${account.name}- ${account.statecode}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      account.address1_stateorprovince == null ? "": account.address1_stateorprovince!,
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
                  ...MenuItems.firstItems.map(
                        (item) =>
                        DropdownMenuItem<MenuItem>(
                          value: item,
                          child: MenuItems.buildItem(item),
                        ),
                  ),
                ],
                onChanged: (value) {
                  //MenuItems.onChanged(context, value as MenuItem);
                  _openFilterDialog();
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
                    return viewType == ViewType.listview? _buildAccountListCard(state.accounts[index],
                        () =>
                      Navigator.of(context).push(MaterialPageRoute(
                        builder:(context) => AccountDetailsScreen(account: state.accounts[index]
                        ),
                      ))):
                    _buildAccountGridCard(state.accounts[index],
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

  List<String> stateList = [
    "Active",
    "Inactive"
  ];
  List<String>? selectedStateList = [];

  Future<void> _openFilterDialog() async {
    await FilterListDialog.display<String>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(context),
      headlineText: 'Select State',
      height: 500,
      listData: stateList,
      selectedListData: selectedStateList,
      choiceChipLabel: (item) => item,
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ControlButtonType.All, ControlButtonType.Reset],
      onItemSearch: (item, query) {
        /// When search query change in search bar then this method will be called
        ///
        /// Check if items contains query
        return item.toLowerCase().contains(query.toLowerCase());
      },

      onApplyButtonClick: (list) {
        setState(() {
          selectedStateList = List.from(list!);
        });
        Navigator.pop(context);
      },

      /// uncomment below code to create custom choice chip
      /* choiceChipBuilder: (context, item, isSelected) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(
            color: isSelected! ? Colors.blue[300]! : Colors.grey[300]!,
          )),
          child: Text(
            item.name,
            style: TextStyle(
                color: isSelected ? Colors.blue[300] : Colors.grey[500]),
          ),
        );
      }, */
    );
  }

}

class MenuItem {
  final String text;
  //final IconData icon;

  const MenuItem({
    required this.text,
    //required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [stateCode, state];

  static const stateCode = MenuItem(text: 'State code');
  static const state = MenuItem(text: 'State');

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) async {
    switch (item) {
      case MenuItems.stateCode:
        final list = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FilterPage(
              allTextList: items,
              selectedStateList: selectedItems,
            ),
          ),
        );
        if (list != null) {
          // setState(() {
          //   selectedUserList = List.from(list);
          // });
        }
      //Do something
        break;
      case MenuItems.state:
      //Do something
        break;
    }
  }


// Initial Selected Value
  String dropdownvalue = 'State code';
// List of items in our dropdown menu
  static var items = [
    'State code',
    'StateOrProvince',
  ];

  static List<String>? selectedItems = [];



}

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key, this.allTextList, this.selectedStateList})
      : super(key: key);
  final List<String>? allTextList;
  final List<String>? selectedStateList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FilterListWidget<String>(
        listData: allTextList,
        selectedListData: selectedStateList,
        onApplyButtonClick: (list) {
          // do something with list ..
        },
        choiceChipLabel: (item) {
          /// Used to display text on chip
          return item;
        },
        validateSelectedItem: (list, val) {
          ///  identify if item is selected or not
          return list!.contains(val);
        },
        onItemSearch: (user, query) {
          /// When search query change in search bar then this method will be called
          ///
          /// Check if items contains query
          return user.toLowerCase().contains(query.toLowerCase());
        },
      ),
    );
  }
}