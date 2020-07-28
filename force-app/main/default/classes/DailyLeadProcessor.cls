global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> blankLeadQuery = [SELECT Id 
                                        FROM Lead 
                                        WHERE LeadSource='' 
                                        LIMIT 200];
        List<Lead> leadsToUpdate = new List<Lead>();
        for (Lead blankLead : blankLeadQuery) {
            leadsToUpdate.add(new Lead(
                LeadSource = 'DreamForce'
            ));          
        }
        if (leadsToUpdate.size() < 0) {
            insert leadsToUpdate;            
        }
        
    }
   
}
// // How to schedule/execute an apex job from console - NB you can still use the UI
// DailyLeadProcessor leadSourceUpdator = new DailyLeadProcessor();
// // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
// String sch = '20 30 8 28 7 2 2020';
// String jobID = System.schedule('Update blank lead source', sch, leadSourceUpdator);
