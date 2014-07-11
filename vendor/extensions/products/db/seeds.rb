#Dir[File.join(Rails.root, 'vendor', 'extensions', 'products', 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

#load 'vendor/extensions/products/db/seeds/01_users.rb'
#load 'vendor/extensions/products/db/seeds/02_vehicles.rb'
#load 'vendor/extensions/products/db/seeds/03_categories.rb'
load 'vendor/extensions/products/db/seeds/04_accessory_products.rb'
load 'vendor/extensions/products/db/seeds/05_suspension_products.rb'

Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  Refinery::User.find_each do |user|
    user.plugins.where(name: 'refinerycms-products').first_or_create!(
      position: (user.plugins.maximum(:position) || -1) +1
    )
  end if defined?(Refinery::User)

  #Refinery::Page.where(link_url: (url = "/products")).first_or_create!(
  #  title: 'Products',
  #  deletable: false,
  #  menu_match: "^#{url}(\/|\/.+?|)$"
  #) do |page|
  #  Refinery::Pages.default_parts.each_with_index do |part, index|
  #    page.parts.build title: part, body: nil, position: index
  #  end
  #end if defined?(Refinery::Page)
end

Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  Refinery::User.find_each do |user|
    user.plugins.where(name: 'refinerycms-products').first_or_create!(
      position: (user.plugins.maximum(:position) || -1) +1
    )
  end if defined?(Refinery::User)

  #Refinery::Page.where(link_url: (url = "/products/categories")).first_or_create!(
  #  title: 'Categories',
  #  deletable: false,
  #  menu_match: "^#{url}(\/|\/.+?|)$"
  #) do |page|
  #  Refinery::Pages.default_parts.each_with_index do |part, index|
  #    page.parts.build title: part, body: nil, position: index
  #  end
  #end if defined?(Refinery::Page)
end

Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  Refinery::User.find_each do |user|
    user.plugins.where(name: 'refinerycms-products').first_or_create!(
      position: (user.plugins.maximum(:position) || -1) +1
    )
  end if defined?(Refinery::User)

  #Refinery::Page.where(link_url: (url = "/products/vehicles")).first_or_create!(
  #  title: 'Vehicles',
  #  deletable: false,
  #  menu_match: "^#{url}(\/|\/.+?|)$"
  #) do |page|
  #  Refinery::Pages.default_parts.each_with_index do |part, index|
  #    page.parts.build title: part, body: nil, position: index
  #  end
  #end if defined?(Refinery::Page)
end
