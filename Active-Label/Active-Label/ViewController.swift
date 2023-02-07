//
//  ViewController.swift
//  Active-Label
//
//  Created by 王潇 on 2023/2/7.
//

import UIKit
import ActiveLabel

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createActiveLabel()
        
//        createCustomizeLabel()
    }

    func createActiveLabel() {
        let label = ActiveLabel(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: 320))
        label.textAlignment = .center
        let customType = ActiveType.custom(pattern: "\\swith\\b") // Regex that looks for "with"
        label.enabledTypes = [.mention, .hashtag, .url, customType]
        label.text = "This is a post with #hashtags and a @userhandle 123"
        label.numberOfLines = 0
        label.mentionColor = .systemBlue
//        label.customColor[customType] = UIColor.purple
//        label.customSelectedColor[customType] = UIColor.green
        label.handleCustomTap(for: customType) { element in
            print("Custom type tapped: \(element)")
        }
        label.filterHashtag { hashtag in hashtag.contains("\\shashtags\\b") }
        
        self.view.addSubview(label)
//        self.view.backgroundColor = .orange
    }
    
    func createCustomizeLabel() {
        let label = ActiveLabel(frame: CGRect(x: 20, y: 40, width: view.frame.width - 40, height: 300))
        view.addSubview(label)
        
        let customType = ActiveType.custom(pattern: "\\sare\\b")
        let customType2 = ActiveType.custom(pattern: "\\ssupports\\b")
        
        label.enabledTypes.append(customType)
        label.enabledTypes.append(customType2)
        label.numberOfLines = 0
        label.lineSpacing = 10
        
        /// 设置网址文字的最大长度,当超出该长度的数值时,将截取网址并在尾部添加省略号
        label.urlMaximumLength = 31
        
        label.customize { label in
            label.text = "This is a post with #multiple #hashtags and a @userhandle."
            label.textColor = UIColor(red: 102.0/255, green: 117.0/255, blue: 127.0/255, alpha: 1)
            label.hashtagColor = UIColor(red: 85.0/255, green: 172.0/255, blue: 238.0/255, alpha: 1)
            label.mentionColor = UIColor(red: 238.0/255, green: 85.0/255, blue: 96.0/255, alpha: 1)
            label.URLColor = UIColor(red: 85.0/255, green: 238.0/255, blue: 151.0/255, alpha: 1)
            label.handleMentionTap { self.alert("Mention", message: $0) }
            label.handleHashtagTap { self.alert("Hashtag", message: $0) }
            label.handleURLTap { self.alert("URL", message: $0.absoluteString) }
        }
    }
    
    func alert(_ title: String, message: String) {
        let vc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(vc, animated: true, completion: nil)
    }
}

