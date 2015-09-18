class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = UIColor.whiteColor

    label               = UILabel.new
    label.text          = "Hello World"
    label.textColor     = UIColor.blueColor
    label.frame         = [[0, 100], [375, 50]]
    label.textAlignment = NSTextAlignmentCenter

    @window.addSubview(label)

    @window.makeKeyAndVisible

    true
  end
end
