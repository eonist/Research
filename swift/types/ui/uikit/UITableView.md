Tranclucent popover:

```swift
/**
 * styling
 * EXAMPLE: clearNavBar()//NavBarStyling
 * EXAMPLE: applyVibrantBG()//BGStyling
 */
extension UITableViewController{
    var effect:UIBlurEffect {return UIBlurEffect(style: .extraLight)}
    var resizingMask:UInt8 {return UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)}
    
    //BGStyling
    private var buildBlurView:UIVisualEffectView {
        let blurView = UIVisualEffectView(effect: effect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(resizingMask))
        return blurView
    }
    func applyVibrantBG(){
        let backgroundView = UIView(frame: view.bounds)
        backgroundView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(resizingMask))
        backgroundView.addSubview(self.buildBlurView)
        tableView.backgroundView = backgroundView
        tableView.separatorEffect = UIVibrancyEffect(blurEffect: effect)
    }
    //NavBarStyling
    func clearNavBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()// Sets shadow (line below the bar) to a blank image
        self.navigationController?.navigationBar.backgroundColor = .clear// Sets the translucent background color
        self.navigationController?.navigationBar.isTranslucent = true// Set translucent. (Default value is already true, so this can be removed if desired.)
    }
}

```

```swift
/**
 * 
 */
class FadeOutSegue:UIStoryboardSegue{
    let duration: TimeInterval = 0.5
    let animationOptions: UIViewAnimationOptions = [.curveEaseInOut]
    override func perform() {
        Swift.print("works")
        destination.view?.alpha = 0
        UIApplication.shared.keyWindow?.insertSubview(destination.view!, aboveSubview: source.view!)/*add destination view to view hierarchy*/
        UIView.animate(withDuration: duration, delay: 0, options: animationOptions, animations: {/*animate*/
            self.destination.view?.alpha = 1
        }) { (_) in
            self.source.present(self.destination, animated: false, completion: nil)//completion
        }
    }
}
/**
 * Go from main to popover
 */
class FadeInSegue:UIStoryboardSegue{
    let duration: TimeInterval = 0.5
    let animationOptions: UIViewAnimationOptions = [.curveEaseInOut]
    override func perform() {
        destination.view?.alpha = 0
        UIApplication.shared.keyWindow?.insertSubview(destination.view!, aboveSubview: source.view!)/*add destination view to view hierarchy*/
        UIView.animate(withDuration: duration, delay: 0, options: animationOptions, animations: {/*animate*/
            self.destination.view?.alpha = 1
        }) { (_) in
            self.source.present(self.destination, animated: false, completion: nil)//completion
        }
    }
}

```


```swift
//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct Model {
    let date: String
    let name: String
    let hour: String
    let audioUrl: String
}

class HelpViewController: UITableViewController {

    let jsonData = "[{\"date_raw\":\"1/18/2017 12:00:00 AM\",\"name\":\"Hello 2\",\"hour\":\"12:00 - 14:00\",\"audio_url\":\"http://example.com/file2.mp4\"},{\"date_raw\":\"1/18/2017 12:00:00 AM\",\"name\":\"Hello 1\",\"hour\":\"10:00 - 12:00\",\"audio_url\":\"http://example.com/file1.mp4\"},{\"date_raw\":\"1/17/2017 12:00:00 AM\",\"name\":\"Hello\",\"hour\":\"10:00 - 12:00\",\"audio_url\":\"http://example.com/file.mp4\"},{\"date_raw\":\"1/16/2017 12:00:00 AM\",\"name\":\"Hello\",\"hour\":\"10:00 - 12:00\",\"audio_url\":\"http://example.com/file.mp4\"}]"

    var data = [String: [Model]]()
    var keys = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TestCell")
        loadData()
    }

    func loadData() {
        guard let jsonData = jsonData.data(using: .utf8),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments),
            let jsonArray = json as? [[String: Any]]
        else { return }

        // Map json to array of Models
        let mappedData = jsonArray.flatMap { (elem) -> Model? in
            guard let dateRaw = elem["date_raw"] as? String,
                let name = elem["name"] as? String,
                let hour = elem["hour"] as? String,
                let audioUrl = elem["audio_url"] as? String else { return nil }

            return Model(date: dateRaw, name: name, hour: hour, audioUrl: audioUrl)
        }

        // Create a dictionary from array of Models
        // Each key == section (model.date), will contain array of associated with this key models
        data = mappedData.reduce([String: [Model]]()) { (result, element) -> [String: [Model]] in

            var res = result
            if res[element.date] == nil {
                res[element.date] = [element]
                self.keys += [element.date]
            } else {
                res[element.date]! += [element]
            }
            return res
        }

        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if keys.count < 1 { return 0 }

        let key = keys[section]
        return data[key]?.count ?? 0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath)

        let key = keys[indexPath.section]
        let model = data[key]?[indexPath.row]
        if let model = model {
            cell.textLabel?.text = model.name
        }

        return cell
    }

}

let helpViewController = HelpViewController()
helpViewController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 400)

PlaygroundPage.current.liveView = helpViewController.view
```