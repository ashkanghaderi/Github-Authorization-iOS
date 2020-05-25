import UIKit
import RxSwift

protocol NibLoadable {}

extension NibLoadable where Self: UIView {

    static var nibName: String {
        return String(describing: self)
    }
}

protocol ReusableView {}

extension ReusableView where Self: UIView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

class CustomCell: UITableViewCell
{
    var bag = DisposeBag()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        config()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        config()
    }
    
    func config()
    {
        self.selectionStyle = .none
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
    }
}

public enum CellIds: String {
    case cellId = "CellId"
}

