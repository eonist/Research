```swift
import UIKit
import AVKit
import AVFoundation

class HLVideoController:AVPlayerViewController {//UIViewController,AVPlayerViewControllerDelegate
    lazy private var videoPlayer:AVPlayer = createVideoPlayer()
    private var videoPath:String
    private var episode:HighlightResponse.HighLight.Episode
    init(videoPath:String,episode:HighlightResponse.HighLight.Episode) {
        self.videoPath = videoPath
        self.episode = episode
        super.init(nibName:nil, bundle:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        videoPlayer.play()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Showing \(episode.name)".uppercased()//sets the title of the view
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HLVideoController{
    /**
     * Creates video path
     */
    public static func getVideoPath() -> String{
//        let path:String = {
//            guard let resourcePath = Bundle.main.resourcePath else {fatalError("resource path not available")}
//            return resourcePath + "/vid_1.mov"
//        }()
//        return path
        let path:String = "https://rawgit.com/stylekit/img/master/" + "vid_1.mp4"
        return path
    }
    /**
     * Creates video player
     */
    private func createVideoPlayer() -> AVPlayer{
//        Swift.print("videoPath:  \(videoPath)")
//        guard let videoPath = self.videoPath else {fatalError("video path not available")}
//        let url:URL = URL(fileURLWithPath: videoPath)
        guard let url:URL = URL.init(string: videoPath) else {fatalError("url malformed: \(videoPath)")}
        let player = AVPlayer(url: url)
        
        self.player = player
        return player
    }
}

```