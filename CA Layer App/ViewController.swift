import UIKit
//import QuartzCore

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        let myStr : String = "Hello World";
        let fontS: CGFloat = 24;

        myLabel.text = myStr;
        myLabel.font = UIFont.systemFont(ofSize: fontS)
        
        // adjust the label to resize to the string
        
        myLabel.layer.shadowOffset = CGSize(width: 0, height: 3)
        myLabel.layer.shadowRadius = 5.0;
        myLabel.layer.shadowColor = UIColor.black.cgColor
        myLabel.layer.shadowOpacity = 0.8;
        myLabel.layer.cornerRadius = 10
        myLabel.backgroundColor = UIColor.red

        // deciding the maximum frame
        
        
        
        

        
        let maximumLabelSize : CGSize = CGSize(width: 500, height: 500)
//        let boundingBox: CGRect = myStr.boundingRect(with: maximumLabelSize,
//                                                     options: .usesLineFragmentOrigin,
//                                                     attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontS)],
//                                                     context: nil)
        
        
        let attr = [NSFontAttributeName : UIFont.systemFont(ofSize: fontS)]
        
        let newBoundingBox = myStr.boundingRect(with: maximumLabelSize,
                                                options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                attributes: attr,
                                                context: nil)
        
        // this is applying the frmae ot the label
        let prevCen : CGPoint = myLabel.center
        self.myLabel.frame = newBoundingBox
        myLabel.center = prevCen
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        self.view.layer.backgroundColor = UIColor.cyan.cgColor
        self.view.layer.cornerRadius = 20.0;
        self.view.layer.frame = self.view.layer.frame.insetBy(dx: 120, dy: 120)


        let sublayer:CALayer = CALayer()
        sublayer.backgroundColor = UIColor.red.cgColor
        sublayer.shadowOffset = CGSize(width: 0, height: 3)
        sublayer.shadowRadius = 5.0;
        sublayer.shadowColor = UIColor.black.cgColor
        sublayer.shadowOpacity = 0.8;
        sublayer.frame = CGRect(x: 80, y: 380, width: 200, height: 200)
        self.view.layer .addSublayer(sublayer)
    }
    
    @IBAction func fixItAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Alert",
                                      message: "Message",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField { (_) in
            
        }
        
        alert.addTextField { (_) in
            
        }
        
        alert.addTextField { (_) in
            
        }
        
        alert.addAction(UIAlertAction(title: "DO IT",
                                      style: UIAlertActionStyle.default,
                                      handler: { action in
            switch action.style{
            case .default:
                let textStr: String = (alert.textFields![0]).text!
                let textSize: CGFloat = CGFloat(Int ((alert.textFields![1]).text!)!)
                let raduisSize: CGFloat = CGFloat(Int ((alert.textFields![2]).text!)!)
                
                
                
                let maximumLabelSize : CGSize = CGSize(width: 500, height: 500)
                let loc : CGPoint = self.myLabel.center
                var boundingBox: CGRect = textStr.boundingRect(with: maximumLabelSize,
                                                               options: .usesLineFragmentOrigin,
                                                               attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: textSize)],
                                                               context: nil)
                
                boundingBox = CGRect (x: 0,
                                      y: 0,
                                      width: boundingBox.width*1.1,
                                      height: boundingBox.height)
                
                self.myLabel.frame = boundingBox
                self.myLabel.font = UIFont.systemFont(ofSize: textSize)
                self.myLabel.text = textStr
                self.myLabel.center = loc
                self.myLabel.layer.cornerRadius = raduisSize

            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }
        }))
        
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
}
