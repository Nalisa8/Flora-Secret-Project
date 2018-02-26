
require_relative('../models/flowers')
require_relative('../models/plants')
require_relative('../models/origin')


require('pry-byebug')

origin1 = Origin.new({'origin_name' => 'South America'})
origin1.save()

origin2 = Origin.new({'origin_name' => 'South Africa'})
origin2.save()

origin3 = Origin.new({'origin_name' => 'Asia'})
origin3.save()

origin4 = Origin.new({'origin_name' => 'Centre America'})
origin4.save()

flower1 = Flowers.new(
  {'flower_name' => 'African Violet',
   'origin_id' => origin2.id,
   'quantity' => 30 })
flower1.save();

flower2 = Flowers.new(
  {'flower_name' => 'Begonia',
  'origin_id' => origin1.id,
  'quantity' => 15 })
flower2.save()

flower3 = Flowers.new(
  {'flower_name' => 'Kaffir Lily',
  'origin_id' => origin2.id,
  'quantity' => 25 })
flower3.save()

flower4 = Flowers.new(
  {'flower_name' => 'Kalan Choe',
  'origin_id' => origin2.id,
  'quantity' => 20  })
flower4.save()

flower5 = Flowers.new(
  {'flower_name' => 'Orchid',
  'origin_id' => origin3.id,
  'quantity' => 10  })
flower5.save()

flower6 = Flowers.new(
  {'flower_name' => 'Purple Shmarock',
    'origin_id' => origin1.id,
    'quantity' => 35 })
flower6.save()


plant1 = Plants.new(
  {'plant_name' => 'Heart of Jesus',
  'origin_id' => origin1.id,
   'quantity' => 28 })
plant1.save()

plant2 = Plants.new(
  {'plant_name' => 'Lucky Bamboo',
    'origin_id' => origin3.id,
     'quantity' => 21})
plant2.save()

plant3 = Plants.new(
  {'plant_name' => 'The Ornata',
  'origin_id' => origin4.id,
    'quantity' => 5 })
plant3.save()

plant4 = Plants.new(
  {'plant_name' => 'Bonsai Weeping Fig',
  'origin_id' => origin3.id,
  'quantity' => 25 })
plant4.save()

plant5 = Plants.new(
  {'plant_name' => 'Ruby Ball Cactus',
  'origin_id' => origin1.id,
  'quantity' => 10 })
plant5.save()

plant6 = Plants.new(
  {'plant_name' => 'Aloe Aristata',
  'origin_id' => origin2.id,
  'quantity' => 3})
plant6.save()




binding.pry
nil
