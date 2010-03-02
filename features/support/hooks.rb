Before do
  if Capybara.app_host
    uri = URI.parse Capybara.app_host
    host = uri.host
    if uri.port
      host += ":#{uri.port}"
    end
    host! host
  end
end
