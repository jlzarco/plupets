#CarrierWave.configure do |config|
#config.cache_dir = '#{Rails.root}/tmp/uploads'
#if Rails.env.production?
#  config.storage = :fog
#config.fog_credentials = {
#    :provider              => 'AWS',
#    :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
#    :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
 # }
#  config.fog_directory  = 'plupets'
#  config.fog_public     = true                                    # optional, defaults to true
#  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}  # optional, defaults to {}
#else
 #for development and testing locally
  #config.storage = :file
 #end
#end
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],       # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
  }
  config.fog_directory  = 'plupets'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  config.validate_is_attached = true             # defaults to false
   config.validate_is_uploaded = true             # defaults to false
   config.validate_unique_filename = false        # defaults to true
   config.validate_filename_format = false        # defaults to true
   config.validate_remote_net_url_format = false  # defaults to true

   config.max_file_size     = 10.megabytes        # defaults to 5.megabytes
   config.upload_expiration = 1.hour              # defaults to 10.hours
end
