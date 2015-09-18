class RootScreen < PM::TableScreen

  title 'NRUG Events'
  

  def on_load
    @events = []

    load_events
  end

  def table_data
    [{
      cells: @events.map do |result|
        {
          title: result['name'],
          subtitle: Time.at(result['time'] / 1000).strftime('%d/%m/%Y'),
          action: :tap_cell,
          arguments: { event_id: result['id'] }
        }
      end
    }]
  end

  def tap_cell(id)
    open EventDetailsScreen.new(id)
  end

  private

  def load_events
    AFMotion::JSON.get('http://api.meetup.com/2/events',
                       status: 'past,upcoming',
                       group_urlname: 'Norwich-Ruby-User-Group-NRUG',
                       sign: true,
                       key: API_KEY) do |result|
      if result.success?
        @events = result.object['results'].reverse

        update_table_data
      end
    end
  end

end
