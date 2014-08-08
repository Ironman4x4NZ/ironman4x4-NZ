# encoding: UTF-8

category = Refinery::Ironman::Category.create!(name: '12v Fridges')
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Fridge Accessories'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Fridges'))

category = Refinery::Ironman::Category.create!(name: 'Bullbars')
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Commercial'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Deluxe Commercial'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Protector'))

category = Refinery::Ironman::Category.create!(name: 'Camping')
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Awning Accessories'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Awnings'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Camping Accessories'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Fishing'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Roof Top Tent'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Swags'))

category = Refinery::Ironman::Category.create!(name: 'Dual Battery Systems')

category = Refinery::Ironman::Category.create!(name: 'Equipment')

category = Refinery::Ironman::Category.create!(name: 'Exhaust Systems')

category = Refinery::Ironman::Category.create!(name: 'Fuel Tank Protection Plates')

category = Refinery::Ironman::Category.create!(name: 'Lights')
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Driving Lights'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'LED Light Bars'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Work Lights'))

category = Refinery::Ironman::Category.create!(name: 'Long Range Fuel Tanks')

category = Refinery::Ironman::Category.create!(name: 'Mining Parts')
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Mining Light Bar'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Sand Flag'))

category = Refinery::Ironman::Category.create!(name: 'Recovery Equipment')
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Air Compressors'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Lifting Jacks'))
sub_subcategory = subcategory.append_child(Refinery::Ironman::Category.new(name: 'Exhaust Jack'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Lifting Jacks'))
sub_subcategory = subcategory.append_child(Refinery::Ironman::Category.new(name: 'High Lift Jacks'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Recovery Devices & Equipment'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Recovery Kits'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Recovery Straps & Snatches'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Tyre Accessories & Tools'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Winches'))
sub_subcategory = subcategory.append_child(Refinery::Ironman::Category.new(name: 'Electric Winches (12v)'))
sub_subcategory = subcategory.append_child(Refinery::Ironman::Category.new(name: 'Hand Winch'))
sub_subcategory = subcategory.append_child(Refinery::Ironman::Category.new(name: 'Winch Accessories'))

category = Refinery::Ironman::Category.create!(name: 'Roof Racks')
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Alloy'))
sub_subcategory = subcategory.append_child(Refinery::Ironman::Category.new(name: 'Cage Style'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Mounting Kits'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Steel'))
sub_subcategory = subcategory.append_child(Refinery::Ironman::Category.new(name: 'Cage Style'))
sub_subcategory = subcategory.append_child(Refinery::Ironman::Category.new(name: 'Roof Top Tent Compatible'))
sub_subcategory = subcategory.append_child(Refinery::Ironman::Category.new(name: 'Trade Style'))

category = Refinery::Ironman::Category.create!(name: 'Snorkels')
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Snorkels'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Spare Parts'))

category = Refinery::Ironman::Category.create!(name: 'Steel Side Steps & Scrub Rails')
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Steel Side Steps & Scrub Rails'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Steel Side Steps'))

category = Refinery::Ironman::Category.create!(name: 'Storage')
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Drawer Systems'))
sub_subcategory = subcategory.append_child(Refinery::Ironman::Category.new(name: 'Drawers'))
sub_subcategory = subcategory.append_child(Refinery::Ironman::Category.new(name: 'Wing Kits'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Space Cases'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Tool Boxes'))

category = Refinery::Ironman::Category.create!(name: 'Underbody Protection')

category = Refinery::Ironman::Category.create!(name: 'Ute Accessories')
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Rear Sports Bars'))

category = Refinery::Ironman::Category.create!(name: 'Suspension')
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Adjustable Drag Links'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Adjustable Panhard Rods'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Adjustable Trailing Arms'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Bracket Kit'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Bracket'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Brake Line Spacers'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Bush Kits'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Camber Correction'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Caster Correction'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Coil Springs'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Diff Breathers'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Driveline Spacers'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Extended Brake Hose'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'GVM Upgrade'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Leaf Springs'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Polyurethane Spring Bushes'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Shackles & Pins'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Shock Absorbers'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Steering Dampers'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Suspension Kits'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Sway Bar Links'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Torsion Bars'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'Trim Packers'))
subcategory = category.append_child(Refinery::Ironman::Category.new(name: 'U-Bolts'))
