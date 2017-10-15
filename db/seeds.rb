# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


print "Destroying true medicines..."
Truemedicine.destroy_all
print "Destroying lots..."
Lot.destroy_all
print "Destroying tests..."
Test.destroy_all

print "Seeding 3 lots ..."
lots = [
  {
    name: 'Spasfon',
    lot_number: 'G743',
    picture_url: 'https://pharmacie-citypharma.fr/media/catalog/product/cache/1/image/600x600/9df78eab33525d08d6e5fb8d27136e95/s/p/spasfon_cp_2.png',
    rcp_description: "Indications thérapeutiques : Traitement symptomatique des douleurs liées aux troubles fonctionnels du tube digestif et des voies biliaires.",
    laboratory: "Teva"
  },
  {
    name: 'Esoméprazole',
    lot_number: '5ZR0313',
    picture_url: 'https://posomed.fr/img/products/prod_45598-1-thumb.jpg',
    rcp_description: "Indications thérapeutiques : Les comprimés d'ESOMEPRAZOLE ZENTIVA 20 mg sont indiqués dans le Reflux gastro-œsophagien (RGO) ",
    laboratory: "Sanofi"
  },
  {
    name: 'Paroxétine',
    lot_number: '608',
    picture_url: 'https://posomed.fr/img/products/prod_50483-1-thumb.jpg',
    rcp_description: "Indications thérapeutiques : Traitement d' épisode dépressif majeur et de troubles Obsessionnels Compulsifs.",
    laboratory: "Rambaxy"
  }
]
lots.each do |lot|
  new_lot = Lot.new(lot)
  new_lot.save!
end
puts "done"

print "Seeding 3 truemedicines ..."
medicine1 = Truemedicine.new({
    codenumber: '010340094971775017160731105ZR0313',
    country_of_sale: 'Brazil',
    expiration_date: "blabla"
  })
medicine2 = Truemedicine.new({
    codenumber: 'wdmh',
    country_of_sale: 'France',
    expiration_date: "blabla"
  })
medicine3 = Truemedicine.new({
    codenumber: '01034009363923421717050010608',
    country_of_sale: 'Indonesia',
    expiration_date: "blabla"
  })

medicine1.lot = Lot.find_by_name('Spasfon')
medicine2.lot = Lot.find_by_name('Esoméprazole')
medicine3.lot = Lot.find_by_name('Paroxétine')
medicine1.save
medicine2.save
medicine3.save

puts "done"

print "Seeding 3 tests ..."
tests = [
  {
    codenumber: '010340094971775017160731105ZR0312',
    country: 'Brazil',
    image_url: "url",
    test_type: "datamatrix"
  },
  {
    codenumber: '01034009309860801721030010G742',
    country: 'France',
    image_url: "url",
    test_type: "codebar"
  },
  {
    codenumber: '01034009363923421717050010607',
    country: 'Indonesia',
    test_type: "codenumber"
  }
]
tests.each do |test|
  new_test = Test.new(test)
  new_test.save!
end
puts "done"
