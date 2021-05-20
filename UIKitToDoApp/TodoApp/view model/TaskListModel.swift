import Foundation
import Combine


class TaskListModel {
    
    // replace this with
    // @Published var tasks = ["buy milk"]
    
    let tasks = CurrentValueSubject<[String], Never>(["buy milk"])
    
    var addNewTask = PassthroughSubject<String, Never>()
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        //data stream to create new task
        addNewTask
            .filter({ $0.count > 3 })
            .sink { _ in
        } receiveValue: { [unowned self] newTask in
            self.tasks.send(self.tasks.value + [newTask])
        }.store(in: &subscriptions)
        
        // get initial values at launch like from file system
        // save changes to tasks in file system
        
        
        
    }
}
