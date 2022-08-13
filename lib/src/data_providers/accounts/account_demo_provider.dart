import '../../models/account_model.dart';

class AccountDemoProvider{

  static List<Account> fetchAccountList() {
      return [
        const Account(accountnumber: "3006",
            name:  "Cafe Duo",
            statecode: 0,
            address1_stateorprovince: "WA",
            entityimage_url: null,
            emailaddress1: 'pete@contoso.com'
        ),
        const Account(accountnumber: "3006",
            name:  "Fourth Coffee",
            statecode: 0,
            address1_stateorprovince: "WA",
            entityimage_url: null,
            emailaddress1: 'pete@contoso.com'
        ),
        const Account(accountnumber: "3006",
            name:  "Contoso Coffee",
            statecode: 0,
            address1_stateorprovince: "WA",
            entityimage_url: null,
            emailaddress1: 'claudiam365@pmgdemo.onmicrosoft.com'
        ),
        const Account(accountnumber: "3006",
            name:  "Bean-to-Cup Machines",
            statecode: 0,
            address1_stateorprovince: "WA",
            entityimage_url: null,
            emailaddress1: 'parsifal@contoso.com'
        ),
      ];
  }

  static List<Account> fetchAccountListWithSearch(String searchWord){
    return [
      const Account(accountnumber: "3006",
          name:  "Cafe Duo",
          statecode: 0,
          address1_stateorprovince: "WA",
          entityimage_url: null,
          emailaddress1: 'pete@contoso.com'
      ),
      const Account(accountnumber: "3006",
          name:  "Fourth Coffee",
          statecode: 0,
          address1_stateorprovince: "WA",
          entityimage_url: null,
          emailaddress1: 'pete@contoso.com'
      ),
      const Account(accountnumber: "3006",
          name:  "Contoso Coffee",
          statecode: 0,
          address1_stateorprovince: "WA",
          entityimage_url: null,
          emailaddress1: 'claudiam365@pmgdemo.onmicrosoft.com'
      ),
      const Account(accountnumber: "3006",
          name:  "Bean-to-Cup Machines",
          statecode: 0,
          address1_stateorprovince: "WA",
          entityimage_url: null,
          emailaddress1: 'parsifal@contoso.com'
      ),
    ].where((element) => (element.accountnumber!.contains(searchWord) ||element.name!.contains(searchWord))).toList();
  }
}