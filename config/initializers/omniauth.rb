Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '252385738211526', '92ef5cecfe9b13dee1722b9693eb43fd'
end