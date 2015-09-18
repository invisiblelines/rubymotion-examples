class RMQCameraController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.underPageBackgroundColor
    load_buttons
  end

  def load_buttons
    btn = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    btn.setTitle('Select an image', forState: UIControlStateNormal)

    btn = rmq.append(btn, :btn).layout(l: 20, t: 100, fr: 20, h: 50)
    btn.on(:tap) { select_image }
  end

  def select_image
    BW::Device.camera.any.picture(media_types: [:image]) do |result|
      image_view = UIImageView.alloc.initWithImage(result[:original_image])

      rmq.append(image_view, :image).layout(l: 50, t: 200, w: 200, h: 180)
    end
  end
end
