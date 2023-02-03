//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Dylan DeSantis on 1/31/23.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
  func itemDetailViewControllerDidCancel(
    _ controller: AddItemViewController)
  func itemDetailViewController(
    _ controller: AddItemViewController,
    didFinishAdding item: ChecklistItem
  )
    func itemDetailViewController(
      _ controller: AddItemViewController,
      didFinishEditing item: ChecklistItem
    )
}

class AddItemViewController: UITableViewController, UITextViewDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewControllerDelegate?
    var itemToEdit: ChecklistItem?

    
    override func viewDidLoad() {
      super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
      if let item = itemToEdit {
        title = "Edit Item"
        textField.text = item.text
        doneBarButton.isEnabled = true
    } }

    
    // MARK: - Actions
    @IBAction func cancel() {
      delegate?.itemDetailViewControllerDidCancel(self)
    }
    @IBAction func done() {
      if let item = itemToEdit {
        item.text = textField.text!
        delegate?.itemDetailViewController(
    self,
          didFinishEditing: item)
      } else {
        let item = ChecklistItem()
        item.text = textField.text!
        delegate?.itemDetailViewController(self, didFinishAdding: item)
    } }
    
    override func tableView(
      _ tableView: UITableView,
      willSelectRowAt indexPath: IndexPath
    ) -> IndexPath? {
    return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      textField.becomeFirstResponder()
    }
    
    func textField(
      _ textField: UITextField,
      shouldChangeCharactersIn range: NSRange,
      replacementString string: String
    ) -> Bool {
      let oldText = textField.text!
      let stringRange = Range(range, in: oldText)!
      let newText = oldText.replacingCharacters(
        in: stringRange,
        with: string)
        doneBarButton.isEnabled = !newText.isEmpty
    return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
      doneBarButton.isEnabled = false
    return true
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}