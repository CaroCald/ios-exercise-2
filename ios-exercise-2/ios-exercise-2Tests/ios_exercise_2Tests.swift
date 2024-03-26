//
//  ios_exercise_2Tests.swift
//  ios-exercise-2Tests
//
//  Created by bayteq on 26/3/24.
//

import SnapshotTesting
import XCTest
@testable import ios_exercise_2

final class ios_exercise_2Tests: XCTestCase {

    func testData() {
        let data = Data([0xDE, 0xAD, 0xBE, 0xEF])

        assertSnapshot(of: data, as: .data)
      }
    
    func testTableViewController() {
      #if os(iOS)
        class TableViewController: UITableViewController {
          override func viewDidLoad() {
            super.viewDidLoad()
            self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
          }
          override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
          {
            return 10
          }
          override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
            -> UITableViewCell
          {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = "\(indexPath.row)"
            return cell
          }
        }
        let tableViewController = TableViewController()
        assertSnapshot(of: tableViewController, as: .image(on: .iPhoneSe))
      #endif
    }
    
    func testController (){
        let vc = InfoViewController()
        assertSnapshot(of: vc, as: .image)
     
    }
    
    func testViewController() {
        let vc = ViewController.instantiate()
        assertSnapshot(of: vc, as: .image)
    }
    
    func testViewControllerChangeColor() {
        
        let vc = ViewController.instantiate()
        vc.view.backgroundColor = .lightGray
        assertSnapshot(of: vc, as: .image)
    }

}
