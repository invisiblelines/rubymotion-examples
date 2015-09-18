class EventCommentScreen < PM::FormScreen
  attr_accessor :event_id

  title "Comment Form"

  def on_load
    set_nav_bar_button :back, {
      title: 'Cancel',
      style: :plain,
      tint_color: UIColor.blueColor,
      action: :back
    }
  end

  def form_data
    [{
      title: "Comment",
      cells: [{
        name: "comment",
        title: "Comment",
        type: :longtext
      },
      {
        name: :submit,
        title: "Submit",
        type: :button,
        action: "submit_form:"
      }]
    }]
  end

  def submit_form(cell)
    App.alert(render_form.to_s)

    close_screen
  end
end
