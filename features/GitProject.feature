Feature: Test plan sample

#  base url: "http://www.petsmart.com/"

  Scenario: Main page functionality - header navigation
    Then Check that menu item "Dog" contains submenus
    Then Check that menu item "Cat" contains submenus
    Then Check that menu item "Fish" contains submenus
    Then Check that menu item "Bird" contains submenus
    Then Check that menu item "Reptile" contains submenus
    Then Check that menu item "Small Pet" contains submenus
    Then Check that menu item "Pet Services" contains submenus
    Then Check that menu item "Sale" contains submenus

  Scenario: Main page functionality - footer navigation
    Then Check footer menu Store Services with items
    Then Check footer menu PetSmart Cares with items
    Then Check footer menu Shop With Us with items
    Then Check footer menu Education with items
    Then Check footer menu About PetSmart with items

  Scenario: Main page functionality - external links - facebook
    Then Click on Facebook icon
    Then Verify navigation to Facebook

  Scenario: Main page functionality - external links - hangouts
    Then Click on Google Plus icon
    Then Verify navigation to Google Plus

  Scenario: Main page functionality - external links - twitter
    Then Click on Twitter icon
    Then Verify navigation to Twitter

  Scenario: Main page functionality - external links - instagram
    Then Click on Instagram icon
    Then Verify navigation to Instagram

  Scenario: Main page functionality - external links - pinterest
    Then Click on Pinterest icon
    Then Verify navigation to Pinterest

  Scenario: Main page functionality - external links - youtube
    Then Click on YouTube icon
    Then Verify navigation to YouTube

  Scenario: Main page functionality - upcoming events wrapper
    Then Print out all upcoming events in wrapper

  Scenario: Main page functionality - search - valid search
    Then In search type Dogs Toys
    Then Check that some results returned

  Scenario: Main page functionality - search - invalid search
    Then In search type tttt
    Then Check that zero results returned

  Scenario: Main page functionality - pet services wrapper
    Then in Pet service click on each item and verify that all promo messages are different

  Scenario: Dog - Food and health - Brands
    Then In "Dog" menu go to "Food & health"
    Then In "Featured Brands" check that each brand navigates to the page with brand specific items

  Scenario: Dog - Food and health - top categories
    Then In "Dog" menu go to "Food & health"
    Then Check that each link in "Top Categories" works

  Scenario: Dog - Food - see 200 items verification
    Then In "Dog" menu go to "Food"
    Then Click "View 200 Items"
    Then Check that 200 items displayed

  Scenario: Dog - Food - pagination verification
    Then In "Dog" menu go to "Food"
    Then Go through all pages and print out all given items

  Scenario: Dog - Food - sorting - price high to low
    Then In "Dog" menu go to "Food"
    Then Set sorting to "price high to low"
    Then Verify correct sorting by price high to low

  Scenario: Dog - Food - sorting - price low to high
    Then In "Dog" menu go to "Food"
    Then Set sorting to "price low to high"
    Then Verify correct sorting by price low to high

  Scenario: Dog - Food - sorting - top rated
    Then In "Dog" menu go to "Food"
    Then Set sorting to "top rated"
    Then Verify correct sorting by top rated

  Scenario: Dog - Food - sorting - best sellers
    Then In "Dog" menu go to "Food"
    Then Set sorting to "best sellers"
    Then Verify correct sorting

  Scenario: Dog - Food - sorting - new arrivals
    Then In "Dog" menu go to "Food"
    Then Set sorting to "new arrivals"
    Then Verify correct sorting by arrival date

  Scenario: Dog - Food - filter - Brand
    Then In "Dog" menu go to "Food"
    Then Set filter for brand
    Then Verify correct filter sorting

  Scenario: Dog - Food - filter - Flavor
    Then In "Dog" menu go to "Food"
    Then Set filter for flavor
    Then Verify correct filter sorting

  Scenario: Dog - Food - filter - Breed
    Then In "Dog" menu go to "Food"
    Then Set filter for breed
    Then Verify correct filter sorting

  Scenario: Dog - Food - filter - Price
    Then In "Dog" menu go to "Food"
    Then Set filter for price
    Then Verify correct filter sorting

  Scenario: Dog - Food - filter - Rating
    Then In "Dog" menu go to "Food"
    Then Set filter for by-product-rating
    Then Verify correct filter sorting

  Scenario: Dog - Food - filter - Ways To Shop
    Then In "Dog" menu go to "Food"
    Then Set filter for more-ways-to-shop
    Then Verify correct filter sorting

  Scenario: Dog - Food - filter - Health Consideration
    Then In "Dog" menu go to "Food"
    Then Set filter for health-consideration
    Then Verify correct filter sorting

  Scenario: Dog - Food - comparing - adding 2 items
    Then In "Dog" menu go to "Food"
    Then Add 2 random items into compare mode

  Scenario: Dog - Food - comparing - adding 3 items
    Then In "Dog" menu go to "Food"
    Then Add 3 random items into compare mode

  Scenario: Dog - Food - comparing - adding more then 4 items
    Then In "Dog" menu go to "Food"
    Then Add 4 random items into compare mode

  Scenario: Dog - Food - comparing - removing 1-3 items
    Then In "Dog" menu go to "Food"
    Then Add 3 random items into compare mode
    Then Remove one item from compare mode
    Then Remove one item from compare mode
    Then Remove one item from compare mode

  Scenario: Dog - Shopping - 1 item to cart - all fine
    Then In "Dog" menu go to "Food"
    Then Select 1 available item on the page
    Then Select Size
    Then Select Flavor
    Then Select Qty
    Then Click Add to cart
    Then Verify that 1 item_items added to the cart

  Scenario: Dog - Shopping - 1 item to cart - size, quantity and flavor not selected
    Then In "Dog" menu go to "Food"
    Then Select 1 available item on the page
    Then Click Add to cart
    Then Verify the error message displayed for Size field
    Then Verify the error message displayed for Flavor field
    Then Verify the error message displayed for Qty field

  Scenario: Dog - Shopping - 1 item to cart with removing
    Then In "Dog" menu go to "Food"
    Then Select 1 available item on the page
    Then Click Add to cart
    Then Remove item from the cart

  Scenario: Dog - Shopping - 1 item to cart with proceeding
    Then In "Dog" menu go to "Food"
    Then Select 1 available item on the page
    Then Click Add to cart
    Then Click Check out

  Scenario: Dog - Shopping - more than 1 item to cart with removing of 1 item
    Then In "Dog" menu go to "Food"
    Then Select 3 available item on the page
    Then Click Add to cart
    Then Remove item from the cart
    Then Click Check out