//
//  ListTableViewCell.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 28/06/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import UIKit
import Combine

class ListTableViewCell: UITableViewCell {
    
    private(set) var publisher = PassthroughSubject<String, Never>()
    
    var listCellModel: ListCellViewModel?{
        didSet{
            self.textLabel?.text = listCellModel?.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.red
        button.setTitle("Tap", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(didTapOnButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: contentView.frame.size.width - 100.0, y: 5.0, width: 100.0, height: 35.0)
    }
    
    @objc private func didTapOnButton(){
        publisher.send(listCellModel?.title ?? "Opps sorry")
    }

}
