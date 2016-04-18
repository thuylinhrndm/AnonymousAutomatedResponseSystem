Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '621462154232-5ctpve7rpkv3ufnp1aego45csubn1bdl.apps.googleusercontent.com', 'SUWh2PSfaB6XYmlxk-Cu7E27', skip_jwt: true
  provider :facebook,'103687326658603', 'cb0f80b96da12b7ff1dddb2baaf599ae', skip_jwt: true
end