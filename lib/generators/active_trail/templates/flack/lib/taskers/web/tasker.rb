require 'jsonclient'
class WebTasker < Flor::BasicTasker

  def task

    $stdout << ' AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
    $stdout << ' WEB'
    $stdout << ' TASKER'

    payload['post_tstamp'] = Time.now.to_s

    JSONClient.new.post('http://localhost:3000/webparticipant/create', { message: message })
  end

  def on_cancel

    # TODO
  end
end
