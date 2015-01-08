import UIKit
import MessageUI

class MailViewController: UIViewController, MFMailComposeViewControllerDelegate{
    @IBOutlet weak var MessageBox: UITextView!
    var banana = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Repeat")!)
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "bananaCheck", userInfo: nil, repeats: true)
    }
    @IBAction func SendMsg(sender: AnyObject) {
        println("Feedback")
        var subjectText = "Idea/Bug report for MathHelper"
        var messageBody = MessageBox.text+"<br><center><h5 class=\"end\">MathHelper ©2015 Codepixl (Aaron Sonin)</h5></center><style>.end{color:gray;} html{background-image: url(\"http://www.codepixl.net/mathhelper/iphone-stripe-bkg.png\"); background-repeat: repeat;}</style>"
        var To = ["aaronsonin@yahoo.com"]
        var mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(subjectText)
        mc.setMessageBody(messageBody, isHTML: true)
        mc.setToRecipients(To)
        self.presentViewController(mc, animated: true, completion: nil)
        //UIApplication.sharedApplication().openURL(NSURL(string: "mailto:aaronsonin@yahoo.com?subject=MathHelper%20Bug%20Report/Idea&body=I%20have%20a%20bug%20report%20or%20idea%20for%20MathHelper:")!)
    }
    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError) {
        switch result.value {
        case MFMailComposeResultCancelled.value:
            println("Mail cancelled")
        case MFMailComposeResultSaved.value:
            println("Mail saved")
        case MFMailComposeResultSent.value:
            println("Mail sent")
        case MFMailComposeResultFailed.value:
            println("Mail sent failure: \(error.localizedDescription)")
        default:
            break
        }
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func bananaCheck(){
        if(MessageBox.text.lowercaseString == "bananagram" && !banana){
            MessageBox.text = ""
            var story = UIStoryboard(name: "Secret", bundle: NSBundle.mainBundle())
            var view: AnyObject = story.instantiateInitialViewController()
            self.presentViewController(view as UIViewController, animated: true, completion: nil)
        }
    }
}
