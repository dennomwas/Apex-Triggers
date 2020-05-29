public with sharing class AccountHandler {
    
    public static Account insertNewAccount( String accName ) {
        Account newAccount = new Account(
            	Name = accName);
        try {
            insert newAccount;
            System.debug('New Account '+ newAccount);
        } catch (DmlException e) {
            System.debug('A DML exception occured ' + e.getMessage());
            return null;
        }
        
        system.debug('queriedAccount ' + newAccount);
        return newAccount;
    }
}
