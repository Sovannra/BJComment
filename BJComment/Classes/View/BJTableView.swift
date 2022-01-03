//
//  BJTableView.swift
//  BJComment
//
//  Created by Sovannra on 3/1/22.
//

import UIKit

public class BJTableView: UIView {
    
    public var comment: [BJCommentListModel]?
    
    public var delegate: BJDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupComponent()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponent() {
        addSubview(vTableView)
    }
    
    private func setupConstraint() {
        vTableView.fillSuperview()
    }
    
    public lazy var vTableView: UITableView = {
        let view = UITableView()
        view.register(BJTableCell.self, forCellReuseIdentifier: "cellId")
        view.estimatedRowHeight = 999
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.rowHeight = UITableView.automaticDimension
        view.delegate = self
        view.dataSource = self
        return view
    }()
}

extension BJTableView: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BJTableCell
        guard let data = comment?[indexPath.row] else { return cell }
        let viewModel = BJCommentViewModel(comment: data, indexPath: indexPath)
        cell.data = viewModel
        cell.deleate = self
        return cell
    }
    
    private func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func insertRow(_ data: BJCommentListModel) {
        comment?.insert(data, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        vTableView.insertRows(at: [indexPath], with: .automatic)
        scrollToIndex(indexPath, animated: true)
        reloadTable()
    }
    
    public func updateRow(_ data: BJCommentListModel, _ index: Int) {
        comment?[index] = data
        let indexPath = IndexPath(row: index, section: 0)
        vTableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    public func deleteRow(_ indexPath: IndexPath) {
        comment?.remove(at: indexPath.row)
        vTableView.deleteRows(at: [indexPath], with: .fade)
        reloadTable()
    }
    
    public func scrollToIndex(_ indexPath: IndexPath, animated: Bool) {
        vTableView.scrollToRow(at: indexPath, at: .top, animated: animated)
    }
    
    private func reloadTable() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.vTableView.reloadData()
        }
    }
}

extension BJTableView: BJDelegate {
    public func didSelect(_ type: BJActionType, _ comment: BJCommentViewModel) {
        delegate?.didSelect(type, comment)
    }
    
    public func didLongPress(_ comment: BJCommentViewModel) {
        delegate?.didLongPress(comment)
    }
}
