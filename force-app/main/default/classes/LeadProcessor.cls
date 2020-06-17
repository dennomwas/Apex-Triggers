global class LeadProcessor implements Database.Batchable<SObject>, Database.Stateful {
    global Integer processedLeadsCounter = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {

        return Database.getQueryLocator(
            [SELECT Id, Name, LeadSource FROM Lead]);
    }
    global void execute(Database.BatchableContext bc, List<Lead> leadList) {

        List<Lead> processedLeads = new List<Lead>();
        for (Lead myLead : leadList) {
            processedLeads.add(new Lead(
                                        Id = myLead.Id,
                                        LeadSource = 'Dreamforce'));
            processedLeadsCounter = processedLeadsCounter + 1;
        }
        update processedLeads;
    }
    global void finish(Database.BatchableContext bc) {
        System.debug(processedLeadsCounter + ' Leads processed');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
                                    JobItemsProcessed,
                                    TotalJobItems
                            FROM AsyncApexJob
                            WHERE Id = :bc.getJobId()];
    }
}
