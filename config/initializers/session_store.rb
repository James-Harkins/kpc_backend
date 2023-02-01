if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_kpc_backend', domain: 'kpc_backend-json-api'
else
    Rails.application.config.session_store :cookie_store, key: '_kpc_backend'
end