trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<Task> taskList = new List<Task>();

    for ( Order_Event__e evnt : Trigger.new) {

        if (evnt.Has_Shipped__c == true) {
            Task evntTask = new Task(
                Priority = 'Medium',
                Subject = 'Follow up on shipped order ' + evnt.Order_Number__c,
                OwnerId = evnt.CreatedById              
            );
        taskList.add(evntTask);          
        }       
    }
    if (taskList.size() > 0 ) {
        try {
            insert taskList;
        } catch ( DmlException e ) {
            System.debug('An error occurred during insert ' + e.getMessage());
        }
    }
}