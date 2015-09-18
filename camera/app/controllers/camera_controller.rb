class CameraController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.underPageBackgroundColor

    @picker            = UIImagePickerController.alloc.init
    @picker.delegate   = self
    @picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum

    @picker.setMediaTypes([KUTTypeImage])

    load_buttons
  end

  def load_buttons
    btn = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    btn.frame = [[50, 20], [200, 50]]
    btn.setTitle('Select an image', forState:UIControlStateNormal)
    btn.addTarget(self, action: :select_image, forControlEvents:UIControlEventTouchUpInside)

    view.addSubview(btn)
  end

  def select_image
    self.presentModalViewController(@picker, animated: true)
  end

  def imagePickerController(picker, didFinishPickingMediaWithInfo: info)
    dismissModalViewControllerAnimated(true)

    image_view = UIImageView.alloc.initWithImage(info.valueForKey("UIImagePickerControllerOriginalImage"))
    image_view.frame = [[50, 200], [200, 180]]

    view.addSubview(image_view)
  end
end