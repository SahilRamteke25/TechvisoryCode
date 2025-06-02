@RestResource(urlMapping='/AccountsWithContacts/*')
global with sharing class AccountsWithContactsAPI {

    @HttpGet
    global static void getAccounts() {
        RestResponse res = RestContext.response;

        List<Account> accounts = [
            SELECT Id, Name, Industry,
                (SELECT Id, FirstName, LastName, Email FROM Contacts)
            FROM Account
            LIMIT 10
        ];

        List<AccountWithContactsWrapper> responseList = new List<AccountWithContactsWrapper>();
        for (Account acc : accounts) {
            responseList.add(new AccountWithContactsWrapper(acc, acc.Contacts));
        }

        res.responseBody = Blob.valueOf(JSON.serialize(responseList));
        res.statusCode = 200;
    }
    
     @HttpPost
     global static void createContact() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
    
        try {
            // Parse JSON into wrapper
            ContactRequest contactReq = (ContactRequest) JSON.deserialize(req.requestBody.toString(), ContactRequest.class);
    
            // Basic field validation
            if (String.isBlank(contactReq.AccountId) || String.isBlank(contactReq.FirstName) || 
                String.isBlank(contactReq.LastName) || String.isBlank(contactReq.Email)) {
                res.statusCode = 400;
                res.responseBody = Blob.valueOf('Missing required fields: AccountId, FirstName, LastName, or Email.');
                return;
            }
    
            // Check for duplicate (same Email & AccountId)
            List<Contact> existingContacts = [
                SELECT Id FROM Contact 
                WHERE Email = :contactReq.Email 
                AND AccountId = :contactReq.AccountId 
                LIMIT 1
            ];
    
            if (!existingContacts.isEmpty()) {
                res.statusCode = 200;
                res.responseBody = Blob.valueOf('Contact already exists with Email: ' + contactReq.Email);
                return;
            }
    
            // Create new contact
            Contact newContact = new Contact(
                AccountId = contactReq.AccountId,
                FirstName = contactReq.FirstName,
                LastName = contactReq.LastName,
                Email = contactReq.Email,
                Birthdate = contactReq.Birthdate,
                Department = contactReq.Department
            );
    
            insert newContact;
    
            res.statusCode = 201;
            res.responseBody = Blob.valueOf('Contact created successfully with Id: ' + newContact.Id);
    
        } catch (Exception e) {
            res.statusCode = 500;
            res.responseBody = Blob.valueOf('Error: ' + e.getMessage());
        }
    }

     
     global class ContactRequest {
        public String AccountId;
        public String FirstName;
        public String LastName;
        public String Email;
        public Date Birthdate;
        public String Department;
    }



    global class AccountWithContactsWrapper {
        public AccountInfo account;           
        public List<ContactInfo> contacts;    

        public AccountWithContactsWrapper(Account acc, List<Contact> conList) {
            this.account = new AccountInfo(acc);
            this.contacts = new List<ContactInfo>();
            for (Contact c : conList) {
                this.contacts.add(new ContactInfo(c));
            }
        }
    }

    global class AccountInfo {
        public Id Id;
        public String Name;
        public String Industry;

        public AccountInfo(Account acc) {
            this.Id = acc.Id;
            this.Name = acc.Name;
            this.Industry = acc.Industry;
        }
    }

    global class ContactInfo {
        public Id Id;
        public String FirstName;
        public String LastName;
        public String Email;

        public ContactInfo(Contact con) {
            this.Id = con.Id;
            this.FirstName = con.FirstName;
            this.LastName = con.LastName;
            this.Email = con.Email;
        }
    }
}