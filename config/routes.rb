Rails.application.routes.draw do
  
  post   '/api/v1/login'           => 'customers#login'
  get    '/api/v1/logout'          => 'customers#logout'
  put    '/api/v1/customers/:id'   => 'customers#update'
  get    '/api/v1/customers/:id'   => 'customers#get'
  delete '/api/v1/customers/:id'   => 'customers#destroy'
  get    '/api/v1/customers'       => 'customers#list'
  post   '/api/v1/customers'       => 'customers#create'
  
  get    '/api/v1/products'     => 'products#list'
  post   '/api/v1/products'     => 'products#create'
  put    '/api/v1/products/:id' => 'products#update'
  get    '/api/v1/products/:id' => 'products#get'
  delete '/api/v1/products/:id' => 'products#destroy'

  get    '/api/v1/orders'     => 'orders#list'
  post   '/api/v1/orders'     => 'orders#create'
  put    '/api/v1/orders/:id' => 'orders#update'
  get    '/api/v1/orders/:id' => 'orders#get'
  delete '/api/v1/orders/:id' => 'orders#destroy'

end
