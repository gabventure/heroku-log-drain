class LogsController < ApplicationController
  def create
    logs = request.raw_post

    # Push logs to a background job for S3 upload
    LogUploadJob.perform_later(logs)

    head :ok
  end
end