How many users are there?
  User.count
  =>50

What are the 5 most expensive items?
  Item.order(price: :desc).limit(5)
    9           Gorgeous Plastic Pants  99.44       Books & Outdoors
    20          Intelligent Cotton Com  90.96       Movies, Tools &
    8           Small Concrete Pants    90.32       Garden & Grocery
    31          Gorgeous Granite Pants  90.24       Jewelery, Books
    17          Rustic Concrete Pants   87.53       Electronics

What's the cheapest electronics item?
  Item.order(price: :asc).limit(1).where(category: 'Electronics')
    => [#<Item:0x007fe972c245f8
    id: 34,
    name: "Rustic Wooden Table",
    price: #<BigDecimal:7fe972c0c390,'0.633E2',18(36)>,
    category: "Electronics">]

Who lives at "489 Fritsch Island"? Do they have another address?
  Address.where(street: "489 Fritsch Island")
  User.where(id: 35)
    [#<User:0x007fe972b2e248
    id: 35,
    first_name: "Marty",
    last_name: "Schmidt",
    email: "jimmy.watsica@purdykiehn.net">]
  Address.where(user_id: 35)
    => [#<Address:0x007fe972a05bf0
    id: 37,
    user_id: 35,
    street: "84642 Bosco Orchard",
    city: "East Devanland",
    state: "Maryland",
    zip: 97375>,
    #<Address:0x007fe972a05a38
    id: 38,
    user_id: 35,
    street: "489 Fritsch Island",
    city: "New Jessyca",
    state: "California",
    zip: 10586>]

Correct Tevin Mitchell's New York zip code to 10108.
  User.where(first_name: "Tevin")
  user_id = 25
  a = Address.find(26)
  a.zip = 10108
  a.save
How much would it cost to buy one of each piece of jewelery?
  Item.where("category LIKE ?", " %Jewelery%").sum(:price)
  #<BigDecimal:7fe974844b70,'0.0',9(27)>

How many total items did we sell?
  Order.sum(:quantity)
    822
How much was spent on health?
  Item.where("category LIKE ?", "Health")
   item_id = 1
  Order.where(item_id: 1).sum(:quantity) * Item.find(1).price
    #<BigDecimal:7fe9725c6f80,'0.20528E4',18(36)>
Simulate buying an item by inserting a User for yourself and an Order for that User (do not include this in the figures above).
  User.create(first_name: "Dirk",last_name: "Link", email: "dlink@ironyardclass.com" )
  Order.create(user_id: 53, item_id: 1, quantity: 2)
