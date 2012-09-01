#CarrierWave.configure do |config|
 # config.fog_credentials = {
      # Configuration for Amazon S3 should be made available through an Environment variable.
      # For local installations, export the env variable through the shell OR
      # if using Passenger, set an Apache environment variable.
      #
      # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
      #
      # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

      # Configuration for Amazon S3
  #    :provider              => 'AWS',
   #   :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
    #  :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      #:region                => ENV['S3_REGION']
  #  }
#config.cache_dir = '#{Rails.root}/tmp/uploads'
#if Rails.env.production?
#  config.storage = :fog
#config.fog_credentials = {
#    :provider              => 'AWS',
#    :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
#    :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
#  }
#  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
#  config.fog_directory  = ENV['S3_Bucket_NAME']
#  config.fog_public     = true                                    # optional, defaults to true
#  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}  # optional, defaults to {}
#else
 #for development and testing locally
 # config.storage = :file
 #end
#end
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
  config.fog_public = false

  if Rails.env.production?
    config.fog_directory = ENV['BUCKET_PROD']
  elsif Rails.env.staging?
    config.fog_directory = ENV['BUCKET_STA']
  else
    config.fog_directory = ENV['BUCKET_DEV']
  end

end
