class LogUploadJob < ApplicationJob
  queue_as :default

  def perform(logs)
    key = "heroku_logs/#{Time.now.utc.strftime('%Y/%m/%d')}/#{SecureRandom.uuid}.log"

    Aws::S3::Client.new.put_object(
      bucket: ENV["S3_BUCKET"],
      key: key, 
      body: logs
    )
  end
end