trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    // With 'ClosedOpportunityTrigger' active, 
    // if an opportunity is inserted or updated with a stage of 'Closed Won', 
    // it will have a task created with the subject 'Follow Up Test Task'.
    
    List<Task> taskList = new List<Task>();

    for (Opportunity opp : [SELECT Id, StageName FROM Opportunity WHERE Id IN :Trigger.new AND 
                                                                                StageName = 'Closed Won']) {
        System.debug(opp);
        Task newTask = new Task(
            Subject = 'Follow Up Test Task',
            WhatId = opp.Id
        );
        taskList.add(newTask);
    }
    if (taskList.size() > 0) {
        insert taskList;
    }
    
}