import UIKit
//import QuartzCore

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        self.view.layer.backgroundColor = UIColor.cyan.cgColor
        self.view.layer.cornerRadius = 20.0;
        self.view.layer.frame = self.view.layer.frame.insetBy(dx: 120, dy: 120)
        

        
        
        let sublayer:CALayer = CALayer()
        sublayer.backgroundColor = UIColor.green.cgColor
        sublayer.shadowOffset = CGSize(width: 20, height: 20)
        sublayer.shadowRadius = 5.0;
        sublayer.shadowColor = UIColor.red.cgColor
        sublayer.shadowOpacity = 0.8;
        sublayer.frame = CGRect(x: 80, y: 380, width: 100, height: 200)
        self.view.layer .addSublayer(sublayer)
        
        
        
        
        
        
        
        
        
        

        let myStr : String = "Hello World";
        let fontS: CGFloat = 24;
        myLabel.text = myStr;
        myLabel.font = UIFont.systemFont(ofSize: fontS)
        myLabel.layer.cornerRadius = 10
        myLabel.backgroundColor = UIColor.red
        myLabel.clipsToBounds = true
        // Maks to the current shape of the layer
        // bound is the frame starting at origin 0, 0

    }
    
    
    
    @IBAction func fixItAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Alert",
                                      message: "Message",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField { (field) in
            field.placeholder = "Text"
            field.textAlignment = NSTextAlignment.center
            field.font = UIFont.systemFont(ofSize: 22)
        }
        
        alert.addTextField { (field) in
            field.placeholder = "Size"
            field.textAlignment = NSTextAlignment.center
            field.font = UIFont.systemFont(ofSize: 22)

        }
        
        alert.addTextField { (field) in
            field.placeholder = "corener Size"
            field.textAlignment = NSTextAlignment.center
            field.font = UIFont.systemFont(ofSize: 22)

        }
        
        alert.addAction(UIAlertAction(title: "DO IT",
                                      style: UIAlertActionStyle.default,
                                      handler: { action in
            switch action.style{
            case .default:
                let textStr: String = (alert.textFields![0]).text!
                let textSize: CGFloat = CGFloat(Int ((alert.textFields![1]).text!)!)
                let raduisSize: CGFloat = CGFloat(Int ((alert.textFields![2]).text!)!)
      
                let maximumLabelSize : CGSize = CGSize(width: self.view.frame.size.width,
                                                       height: 500)
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
