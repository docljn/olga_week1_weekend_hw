#
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

# def total_price(pet_shop)
#   total_cash = 0
#   pets = pet_shop[:pets]
#   for pet in pets
#     total_cash += pet[:price]
#   end
#   return total_cash
# end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,number_of_pets)
  pet_shop[:admin][:pets_sold] += number_of_pets
end

def stock_count(pet_shop)
  stock_count = 0
  pets = pet_shop[:pets]
  for pet in pets
    stock_count += 1
  end
  return stock_count
end

def pets_by_breed(pet_shop, breed)

  same_breed_array = []
  pets = pet_shop[:pets]
  for pet in pets
    if pet[:breed] == breed
      same_breed_array << pet[:breed]
    end
  end
  return same_breed_array

end

def find_pet_by_name(pet_shop, pet_name)
  #return pet hash if parameter pet_name matches a pet name in pets array

  pets = pet_shop[:pets]
  for pet in pets
    if pet[:name] == pet_name
      return pet
    end
  end
  # if no pet match found return nil
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  # delete pet hash from pets array if pet_name matches pet name in array
  pets = pet_shop[:pets]
  for pet in pets
    if pet[:name] == pet_name
      pets.delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  #adds new pet hash to pets array
  pets = pet_shop[:pets]
  pets.push(new_pet)

end

def customer_pet_count(customer)
  # Input parameter is a customer hash within a customers array
  # Function to count the number of pets within a pets array in the customer hash

  return cust_pet_count = customer[:pets].count()

end

def add_pet_to_customer(customer, new_pet)
  # Input parameter 1: customer hash within a customers array
  # Input parameter 2: new pet hash
  # Function to add a new pet to the pets array for that customer hash
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, pet_wanted)
  # TEST FOR THIS FUNCTION:
  # def test_customer_can_afford_pet__insufficient_funds
  #   customer = @customers[1]
  #   can_buy_pet = customer_can_afford_pet(customer, @new_pet)
  #   assert_equal(false, can_buy_pet)
  # end

  # I read this as:
  # - return true if the customer has enough cash to buy the pet
  # - return false if the customer does not have enough cash

  # inputs are:
    # customer - a person, specified in the test as an element in the @customers hash
    # pet - a specific animal, specificed in the test as @new_pet

  # I'm assuming that we don't need to check whether the pet exists, as that will have been done elsewhere: returning a pet hash if it does, and nil if it doesn't

  # In this case, all I have to do is check whether "pet" == nil
  # If it's nil, then I can't check if the customer can afford it, because it doesn't exist.
  # If it's not nil, then I can go ahead and compare the price of the pet with the customer's available cash.

  customer_cash = customer[:cash]
  # agree with this bit!

  pets = @pet_shop[:pets]
  # I think this is more than you need....
  # Your "customer_can_afford_pet" method asks for a "pet_wanted", which - based on the test - is the entire hash detailing the pet.
  # The test specifies @new_pet, which is a hash.

  # I _think_ that means that you could just compare the customer's cash with the price of the pet, and have a working method...

    p "rb:pets - #{pets}"
    p "pet_wanted #{pet_wanted}"

    for pet in pets

    if pet == pet_wanted
      p pet
      p pet_wanted
      p pet[:price]
      if customer_cash >= pet[:price]
        return true
      else
        return false
      end
    else
      p "pet doesn't exist"
      return false
    end
  end
  p "rb:pets - #{pets}"


end

# def sell_pet_to_customer(pet_shop, pet, customer)
#   # This function calls 3 functions:
#   # 1. Adds pet to the customer
#   # 2. Increases by 1 the admin[:pets_sold] value in the pet_shop hash
#   # 3. Updates the admin[:total_cash] value with the price of the pet_type
#   #pet = find_pet_by_name(pet_shop, pet)
#   #p pet[:name]
#   #if pet == pet[:name]
#   #return if nil

# #  if pet[:name] == pet
#     customer_can_afford_pet = customer_can_afford_pet(customer, pet)
#     p customer_can_afford_pet
#     if (customer_can_afford_pet)
#       add_pet_to_customer(customer, pet)
#       increase_pets_sold(pet_shop, 1)
#       add_or_remove_cash(pet_shop, pet[:price])
#     end
# #  end
#
# end
