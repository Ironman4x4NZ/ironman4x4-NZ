Refinery::Core::Engine.routes.draw do

  get 'categories/:id/children' => 'ironman/categories#children', :as => 'category_children', :format => :json

  get 'product-categories/:id' => 'ironman/categories#index', as: :product_categories
  get 'product-categories/:category_id/:id' => 'ironman/categories#index', as: :product_subcategories
  get 'product-categories/:category_id/:subcategory_id/:id' => 'ironman/categories#index', as: :product_sub_subcategories

  get 'category-products/:id' => 'ironman/products#index', as: :category_products
  get 'category-products/:category_id/:id' => 'ironman/products#index', as: :subcategory_products
  get 'category-products/:category_id/:subcategory_id/:id' => 'ironman/products#index', as: :sub_subcategory_products

  get 'products/:category_id/:id' => 'ironman/products#show', as: :products_category_product
  get 'products/:category_id/:subcategory_id/:id' => 'ironman/products#show', as: :products_subcategory_product
  get 'products/:category_id/:subcategory_id/:sub_subcategory_id/:id' => 'ironman/products#show', as: :products_sub_subcategory_product

  get 'categories/:category_id/:id' => 'ironman/categories#show', as: :subcategory
  get 'categories/:category_id/:subcategory_id/:id' => 'ironman/categories#show', as: :sub_subcategory


  # Frontend routes
  namespace :ironman do
    resources :products, :only => [:index, :show]
    resources :categories, :only => [:index, :show]
    resources :vehicles, :only => [:index, :show]
  end

  # Admin routes
  namespace :ironman, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/ironman" do
      resources :products, :except => :show do
        collection do
          post :update_positions
        end
      end

      resources :categories, :except => :show do
        collection do
          post :update_positions
        end
      end

      resources :vehicles, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
