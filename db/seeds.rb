# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print "Destroying lots..."
Lot.destroy_all
print "Destroying true medicines..."
Truemedicine.destroy_all
print "Destroying tests..."
Test.destroy_all

print "Seeding 3 lots ..."
lots = [
  {
    name: 'Spasfon',
    lot_number: 'G743',
    picture_url: 'https://pharmacie-citypharma.fr/media/catalog/product/cache/1/image/600x600/9df78eab33525d08d6e5fb8d27136e95/s/p/spasfon_cp_2.png',
    rcp_description: "Indications thérapeutiques <br> Traitement symptomatique des douleurs liées aux troubles fonctionnels du tube digestif et des voies biliaires. Traitement des manifestations spasmodiques et douloureuses aiguës des voies urinaires: coliques néphrétiques. Traitement symptomatique des manifestations spasmodiques douloureuses en gynécologie. Traitement adjuvant des contractions au cours de la grossesse en association au repos.
<br> Posologie et mode d'administration <br> Chez l'adulte, la posologie usuelle est de 2 lyophilisats oraux, à prendre au moment de la crise, à renouveler en cas de spasmes importants.
Les lyophilisats oraux sont à dissoudre dans un verre d'eau ou à laisser fondre sous la langue pour obtenir un effet rapide.
Chez l'enfant : 1 lyophilisat 2 fois par 24 heures à dissoudre dans un verre d'eau.",
    laboratory_name: "Teva"
  },
  {
    name: 'Esoméprazole',
    lot_number: '5ZR0313',
    picture_url: 'https://posomed.fr/img/products/prod_45598-1-thumb.jpg',
    rcp_description: "Indications thérapeutiques <br> Les comprimés d'ESOMEPRAZOLE ZENTIVA 20 mg sont indiqués dans:
Reflux gastro-œsophagien (RGO) (Traitement de l'œsophagite érosive par reflux. Traitement d'entretien et prévention des récidives après cicatrisation d'une œsophagite par reflux gastro-œsophagien. Traitement symptomatique du reflux gastro-œsophagien (RGO).) En association à une antibiothérapie appropriée, éradication de Helicobacter pylori pour cicatrisation de l'ulcère duodénal en cas d'infection par Helicobacter pylori et prévention de la récidive de l'ulcère gastro-duodénal en cas d'infection par Helicobacter pylori."
",
    laboratory_name: "Sanofi"
  },
  {
    name: 'Paroxétine',
    lot_number: '608',
    picture_url: 'https://posomed.fr/img/products/prod_50483-1-thumb.jpg',
    rcp_description: "Indications thérapeutiques <br> Traitement de : Episode dépressif majeur. Troubles Obsessionnels Compulsifs. Trouble Panique avec ou sans agoraphobie. Trouble Anxiété Sociale ou Phobie sociale.
Trouble Anxiété Généralisée. Etat de stress post-traumatique.",
    laboratory_name: "Rambaxy"
  }
]
lots.each do |lot|
  new_lot = Lot.new(lot)
  new_lot.save!
end
puts "done"

print "Seeding 3 truemedicines ..."
medicines = [
  {
    codenumber: '010340094971775017160731105ZR0313',
    country_of_sale: 'Brazil',
    expiration_date: "blabla"
  },
  {
    codenumber: '01034009309860801721030010G743',
    country_of_sale: 'France',
    expiration_date: "blabla"
  },
  {
    codenumber: '01034009363923421717050010608',
    country_of_sale: 'Indonesia',
    expiration_date: "blabla"
  }
]
medicines[1].lot_id = Lot.find_by_name('Spasfon')
medicines[2].lot_id = Lot.find_by_name('Esoméprazole')
medicines[3].lot_id = Lot.find_by_name('Paroxétine')

medicines.each do |medicine|
  new_medicine = Truemedicine.new(medicine)
  new_medicine.save!
end
puts "done"

print "Seeding 3 tests ..."
tests = [
  {
    codenumber: '010340094971775017160731105ZR0313',
    country: 'Brazil',
    image_url: "url",
    image_type: "datamatrix"
  },
  {
    codenumber: '01034009309860801721030010G743',
    country: 'France',
    image_url: "url",
    image_type: "codebar"
  },
  {
    codenumber: '01034009363923421717050010608',
    country: 'Indonesia'
  }
]
tests.each do |test|
  new_test = Test.new(test)
  new_test.save!
end
puts "done"
