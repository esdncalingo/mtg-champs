class EventsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "EventsChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end