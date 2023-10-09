//
//  ViewController.swift
//  AsyncCode
//
//  Created by Andros Slowley on 3/30/22.
//

import UIKit

class ViewController: UITableViewController {

    var models = [AsyncCodeModel]()
    
    let fetcher = AsyncCodeFetcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetcher.fetchContent("", completion: handleModels(_:_:))
        
        tableView.register(AsyncCell.self, forCellReuseIdentifier: "asyncCell")
    }
    
    func handleModels(_ newModels: [AsyncCodeModel], _ error: Error?) {
        DispatchQueue.main.async { [weak self] in
            self?.models.append(contentsOf: newModels)
            self?.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "asyncCell", for: indexPath) as? AsyncCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        fetcher.fetchContent("", completion: handleModels(_:_:))
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}


class AsyncCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
