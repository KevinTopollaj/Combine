import UIKit
import Combine

class AddNewViewController: UIViewController {

    // get reference to viewmodel
  var taskViewModel: TaskListModel?
    
    var text: String = ""
    
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.addTarget(self, action: #selector(updateText), for: .editingChanged)
    }
    
    @objc func updateText() {
        self.text = textField.text ?? ""
    }
    
    // MARK: - outlets
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        // create new task from textfield
      taskViewModel?.addNewTask.send(text)
        dismiss()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss()
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
