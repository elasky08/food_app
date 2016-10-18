# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     provider: 'AWS',
#     aws_access_key_id: ENV['AWS_ACCESS_KEY_Id'],
#     aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#     region: 'us-west-2'
#   }
#   config.fog_directory = 'test-food-app'
#   config.fog_public = false
#   config.fog_attributes = {'Cache-Control' => 'max-age#{365.days.to_i}'}
# end
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_Id'],                        # required
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                        # required
    region:                'us-west-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'test-food-app'                          # required
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
