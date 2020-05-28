import UIKit
extension UITableView {

    
    func customStyle(seperatorStyle:UITableViewCell.SeparatorStyle = .none)
       {
           self.separatorStyle = seperatorStyle
           self.backgroundColor = UIColor.clear

       }
       
       func scrollTop()
       {
        self.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableView.ScrollPosition.top, animated: true)
       }
       
       func dynamicSize(withDefaultHeight h: CGFloat ){
        self.rowHeight = UITableView.automaticDimension
           self.estimatedRowHeight = h
       }
}
