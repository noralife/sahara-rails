# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Customer.create(name: 'admin', email: 'admin@ho.ge', password: 'admin', role: 'admin')
Customer.create(name: 'hoge1', email: 'hoge1@ho.ge', password: 'hoge1', role: 'user')
Customer.create(name: 'hoge2', email: 'hoge2@ho.ge', password: 'hoge2', role: 'user')
Customer.create(name: 'hoge3', email: 'hoge3@ho.ge', password: 'hoge3', role: 'user')
Customer.create(name: 'hoge4', email: 'hoge4@ho.ge', password: 'hoge4', role: 'user')
Customer.create(name: 'hoge5', email: 'hoge5@ho.ge', password: 'hoge5', role: 'user')

Product.create(name: 'Tajine Pot',  desc: 'The traditional tajine pot is made of pottery, which is sometimes painted or glazed. It consists of two parts: a base unit that is flat and circular with low sides and a large cone- or dome-shaped cover that sits on the base during cooking. The cover is designed to promote the return of all condensation to the bottom. Tajine is traditionally... --Wikipedia')
Product.create(name: 'Argan oil', desc: 'Argan oil is a plant oil produced from the kernels of the argan tree (Argania spinosa L.) that is endemic to to Morocco. In Morocco, argan oil is used to dip bread in at breakfast or to drizzle on couscous or pasta. World-wide, it is gaining a reputation both as an ingredient in high-end, personal-care products and as a heart-healthy... --Wikipedia')
Product.create(name: 'Babouche', desc: 'La babouche du persan (papus) compose de pa (pied) et de pus (couvrir), renvoie simplement a chaussure. En France, des le XVIe siecle, apparaissent les formes papouch ou babuc. Cest une chaussure en cuir traditionnelle provenant du monde arabo-musulman. Les babouches des Bedouins sont avec ou sans... --Wikipedia')
Product.create(name: 'Rose water', desc: 'Rose water is a flavoured water made by steeping rose petals in water. It is the hydrosol portion of the distillate of rose petals, a by-product of the production of rose oil for use in perfume. It is used to flavour food, as a component in some cosmetic and medical preparations, and for religious purposes throughout Europe and Asia... --Wikipedia')
Product.create(name: 'Couscous', desc: 'Couscous  is a traditional Moroccan dish of semolina (granules of durum wheat) which is cooked by steaming. It is traditionally served with a meat or vegetable stew spooned over it. Couscous is a staple food throughout the North African cuisines of Tunisia, Algeria, Morocco, Mauritania and Libya and to a lesser extent in the Middle East... --Wikipedia')
Product.create(name: 'Maghrebi mint tea', desc: 'Maghrebi mint tea Maghrebi mint tea, also known as Moroccan, Tuareg, Algerian, Tunisian, or Libyan mint tea, is a green tea prepared with spearmint leaves and sugar, traditional to the Greater Maghreb region (the Northwest African countries of Morocco, Algeria, Tunisia, Libya, and Mauritania). It has since spread throughout North Africa, parts... --Wikipedia')
Product.create(name: 'Spices', desc: 'A spice is a seed, fruit, root, bark, berry, bud or vegetable substance primarily used for flavoring, coloring or preserving food. Spices are distinguished from herbs, which are parts of leafy green plants used for flavoring or as a garnish. Many spices have antimicrobial properties. This may explain why spices are more commonly used... --Wikipedia')

Order.create(customer_id: 1, product_id: 1, status: 'finish')
Order.create(customer_id: 1, product_id: 2, status: 'started')
Order.create(customer_id: 2, product_id: 2, status: 'processing')
Order.create(customer_id: 3, product_id: 2, status: 'finish')
