/**
* @File Name : First_component.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : May 26, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | May 26, 2025 |   | Initial Version
**/

public with sharing class First_component {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccList(){
        return [Select Id, Name, Phone from Account];
    }
}