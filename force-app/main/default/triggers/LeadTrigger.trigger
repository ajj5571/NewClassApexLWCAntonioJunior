trigger LeadTrigger on Lead (before insert, after insert, before update, after update) {

    if(Trigger.isInsert && Trigger.isAfter ){
        List<Task> taskList = New List<Task>();
        for(Lead lTemp :Trigger.New){
            Task taskObj         = new Task();
            taskObj.Subject      = 'Entrar em contato com o Lead';
            taskObj.ActivityDate = System.Today();
            taskObj.WhoId        = lTemp.Id;
            taskObj.Description  = string.isNotBlank(ltemp.Lastname) ? 'essa atividade tem que ser enviada para '+ lTemp.LastName : '';   
            taskList.add(taskObj);  
        }
        if(taskList.size() > 0){
            insert taskList;
        }

    }

}