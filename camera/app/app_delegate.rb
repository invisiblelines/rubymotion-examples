class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    camera_controller = CameraController.alloc.init

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = camera_controller
    @window.makeKeyAndVisible

    true
  end
end
