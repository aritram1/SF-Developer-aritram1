public class MassTaskController {

    public String getToggleAll() {
        return null;
    }


    public list<Task> getListOfTask() {
        return listOfTasks;
    }
    
    public list<TaskStub> getListOfTaskStub() {
        return listOfTaskStub;
    }
    
    


 public list <Task> listOfTasks = new list <Task> ();
 public list <TaskStub> listOfTaskStub = new list <TaskStub> ();
 public String id { get; set; }
 public String subject { get; set; }
 public String status { get; set; }

 
 public PageReference createStubList(){
 
     listOfTasks = Database.query('Select id, subject, status from Task limit 10');
     
     for(Task t: listOfTasks){
      TaskStub ts = new TaskStub();
      ts.bselected = true;
      ts.id= t.id;
      ts.subject = t.subject;
      ts.status = t.status;
      listOfTaskStub.add(ts);
     } 
     return null;
 }
 
 public class TaskStub{
  public boolean bselected { get; set; }
  public String id { get; set; }
  public String subject { get; set; }
  public String status { get; set; }
 }
  
}