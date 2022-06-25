if defined?(CypressOnRails)
  CypressOnRails.configure do |c|
    c.cypress_folder = File.expand_path("#{__dir__}/../../spec/cypress")
    # WARNING!! CypressOnRails can execute arbitrary ruby code
    # please use with extra caution if enabling on hosted servers or starting your local server on 0.0.0.0
    c.use_middleware = !Rails.env.production?
    c.use_vcr_middleware = !Rails.env.production? && ENV['CYPRESS'].present?
    c.logger = Rails.logger
  end

  # # if you compile your asssets on CI
  # if ENV['CYPRESS'].present? && ENV['CI'].present?
  #  Rails.application.configure do
  #    config.assets.compile = false
  #    config.assets.unknown_asset_fallback = false
  #  end
  # end
end
