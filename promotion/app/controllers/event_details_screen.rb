class EventDetailsScreen < PM::WebScreen

  attr_accessor :event_id

  def on_load
    set_nav_bar_button :back, {
      title: 'Back',
      style: :plain,
      tint_color: UIColor.blueColor,
      action: :back
    }

    set_nav_bar_button :right, {
      title: 'Post Comment',
      style: :plain,
      tint_color: UIColor.blueColor,
      action: :post_comment
    }

    load_event
  end

  def load_event
    AFMotion::JSON.get("http://api.meetup.com/2/event/#{event_id}",
                       sign: true,
                       key: API_KEY) do |result|
      if result.success?
        self.title = result.object['name']

        set_content(result.object['description'])
      end
    end
  end

  def content
  end

  def post_comment
    open EventCommentScreen.new(event_id: event_id)
  end
end
