# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
User.destroy_all
Subscription.destroy_all

Product.create(name: "Wash Day Delight Water-to-Foam Shampoo", brand: "CAROL'S DAUGHTER", product_type: "Shampoo")
Product.create(name: "Custom Curl Cream", brand: "PROSE", product_type: "Curl Cream")
Product.create(name: "Royal Oils Scalp Elixir Treatment", brand: "Head & Shoulders", product_type: "Oil")
Product.create(name: "Moisture Luxe Detangling Spray", brand: "My Black Is Beautiful", product_type: "Detangler")
Product.create(name: "Papaya Castor Foam Conditioner", brand: "Eden Bodyworks", product_type: "Leave In Conditioner")
Product.create(name: "Oribe Priming Lotion Leave-In Conditioning Detangler", brand: "Oribe", product_type: "Detangler")
Product.create(name: "Coco Creme Paraben free Coil Enhancing Moisture Butter", brand: "CAROL'S DAUGHTER", product_type: "Curl Cream")
Product.create(name: "High Shine Multi-Benefit Oil", brand: "DevaCurl", product_type: "Oil")
Product.create(name: "Coconut Custard Make It Last Wash N’ Go Shampoo", brand: "Shea Moisture", product_type: "Shampoo")
Product.create(name: "Define & Shine Gel Serum", brand: "SUAVE PROFESSIONALS FOR NATURAL HAIR", product_type: "Oil")
Product.create(name: "Knot on My Watch Instant Detangling Therapy", brand: "Aunt Jackie's", product_type: "Detangler")
Product.create(name: "The Green Collection Avocado Hair Mousse", brand: "Curls", product_type: "Mousse")
Product.create(name: "Rosemary Mint Strengthening Hair Masque", brand: "Mielle Organics", product_type: "Hair Mask")
Product.create(name: "B. Well Organic + Australian 100% Tea Tree Oil", brand: "Briogeo", product_type: "Oil")
Product.create(name: "Coconut Oil Styling Cream", brand: "Beleza Natural", product_type: "Curl Cream")

User.create(username: "LillyPop",  password_digest: "flowers", name: "Lillian Perez" , email: "lilly@perez.com")
User.create(username: "alleygator",  password_digest: "john1122son", name: "Allison Johnson", email: "Alley@johnson.com")
User.create(username: "swadewade",  password_digest: "curvacious" , name: "Matthew Wade", email: "matthew@wade.com")
User.create(username: "ToyToy",  password_digest: "Akin94" , name: "Toyin Estrada", email: "Toyin@Estrada.com" )
User.create(username: "RomanWWE",  password_digest: "GOAT" , name: "Roman Reigns", email: "roman@reigns.com" )

User.all.each do |user|
    frequencies = ["bi-weekly", "monthly", "bi-monthly"]
    3.times do
        product = Product.all.sample
        frequency = frequencies.sample
        Subscription.create(user_id: user.id, product_id: product.id, frequency: frequency)
    end
end