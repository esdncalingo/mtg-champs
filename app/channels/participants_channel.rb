class ParticipantsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "ParticipantsChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
