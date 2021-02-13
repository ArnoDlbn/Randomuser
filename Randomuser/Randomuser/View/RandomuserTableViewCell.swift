//
//  RandomuserTableViewCell.swift
//  Randomuser
//
//  Created by Arnaud Dalbin on 12/02/2021.
//

import UIKit

class RandomuserTableViewCell: UITableViewCell {
    
    var userFirstName: UILabel!
    var userLastName: UILabel!
    var userImage: UIImageView!
    
//    private let userImage : UIImageView = {
//        let img = UIImageView()
//        img.contentMode = .scaleAspectFit
//        img.clipsToBounds = true
//        return img
//    }()
//
//    private let userFirstName : UILabel = {
//        let lbl = UILabel()
//        lbl.textColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 16)
//        lbl.textAlignment = .left
//        return lbl
//    }()
//
//    private let userLastName : UILabel = {
//        let lbl = UILabel()
//        lbl.textColor = .black
//        lbl.font = UIFont.systemFont(ofSize: 16)
//        lbl.textAlignment = .left
//        return lbl
//    }()
    
//    override func reloadInputViews() {
//        userImage = UIImageView()
//        userImage.contentMode = .scaleAspectFit
//        userImage.clipsToBounds = true
//        addSubview(userImage)
//
//        userFirstName = UILabel()
//        userFirstName.textColor = .black
//        userFirstName.font = UIFont.boldSystemFont(ofSize: 16)
//        userFirstName.textAlignment = .right
//        addSubview(userFirstName)
//
//        userLastName = UILabel()
//        userLastName.textColor = .black
//        userLastName.font = UIFont.systemFont(ofSize: 16)
//        userLastName.textAlignment = .left
//        addSubview(userLastName)
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        userImage = UIImageView()
        userImage.contentMode = .scaleAspectFit
        userImage.clipsToBounds = true
        addSubview(userImage)

        userFirstName = UILabel()
        userFirstName.textColor = .black
        userFirstName.font = UIFont.boldSystemFont(ofSize: 16)
        userFirstName.textAlignment = .right
        addSubview(userFirstName)

        userLastName = UILabel()
        userLastName.textColor = .black
        userLastName.font = UIFont.systemFont(ofSize: 16)
        userLastName.textAlignment = .left
        addSubview(userLastName)
        
        userImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 150, height: 0, enableInsets: false)
        userFirstName.anchor(top: topAnchor, left: userImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        userLastName.anchor(top: topAnchor, left: userFirstName.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
         
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
