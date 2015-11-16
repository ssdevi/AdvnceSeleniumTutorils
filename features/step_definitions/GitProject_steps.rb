#Main page functionality - header navigation
Then /^Check that menu item "([^"]*)" contains submenus$/ do |x|
  driver = $driver
  $driver.get("http://www.petsmart.com/")
  element = $driver.find_element(:xpath, "//ul[@class='ws-common-list pet-main-nav']/li[.//text()='#{x}']")
  $driver.action.move_to(element).perform
  $driver.find_element(:xpath, "//ul[@class='ws-common-list pet-main-nav']/li[div[contains(@class,'main-nav-dropdown')]]")
  puts element

end

#Scenario: Main page functionality - footer navigation
Then(/^Check footer menu ([^"]*) with items$/) do |x|

  $driver.get("http://www.petsmart.com/")
  sleep 5
  footerElement = $driver.find_element(:xpath, "//div[@class='ws-header pet-nav-heading pet-footer-header'][.//h3[text()='#{x}']]")
  footerElement.displayed?
end

# to check the navigation to a new page and verify you are on the correct page
Then /^Click on ([^"]*) icon$/ do |x|
  driver = $driver
  $driver.get("http://www.petsmart.com/")
  element = $driver.find_element(:xpath, "//a[@title='#{x}']")
  element. click

end
Then /^Verify navigation to ([^"]*)$/ do |x|
  driver = $driver
  $driver.get("http://www.petsmart.com/")
  $driver.find_element(:xpath, "//a[@title='#{x}']").click
  $driver. switch_to.window $driver.window_handles.last
  assert($driver.title.include?('PetSmart'))
  # assert $driver.title == "PetSmart"
  puts $driver.title
end

#Capture all the upcoming events
Then /^Print out all upcoming events in wrapper$/ do
  driver = $driver
  $driver.get("http://www.petsmart.com/")
  element = $driver.find_element(:xpath, "//div[@class='monthly-event-title']")
  puts element.text

end

#search - valid & invalid searches
Then /^In search type ([^"]*)$/ do |x|
  driver = $driver
  $driver.get("http://www.petsmart.com/")
  element = $driver.find_element(:id, "searchForm")
  element.send_keys "#{x}"
  element = $driver.find_element(:xpath, "//form/button[@title='Start search.']")
  element.click
end
Then /^Check that ([^"]*) returned$/ do |x|
  element = $driver.find_element(:xpath, "//h1[@class='ws-heading']")
  element = element.text
  array = element.split()
  element = array[0]

  puts element
  if element !=0
    puts "#{x}"
  else
    puts "#{x}"
  end

end
#in Pet service click on each item and verify that all promo messages are different

Then /^in Pet service click on each item and verify that all promo messages are different$/ do

  driver = $driver
  $driver.get("http://www.petsmart.com/")
  array = $driver.find_elements(:xpath, "//ul[@class='pet-services__nav']//a")
  for element in array
    element.click
    array = $driver.find_elements(:xpath, "//span[@class='promo-text__red']")

    class Array
      def uniq?
        self.length == self.uniq.length
      end
    end
    puts array.uniq?
  end
end


#Dog - Food and health - Brands

Then /^In "Dog" menu go to "Food & health"$/ do
  driver = $driver
  $driver.get("http://www.petsmart.com/")
  sleep 8
  element = $driver.find_element(:xpath, "//li[@class='ws-common-list-item pet-main-nav-item-level1']//span[@class='ws-category-title' and text()='Dog']" )
  driver.action.move_to(element).perform
  element = $driver.find_element(:xpath, "//ul[@class='ws-category-list main-nav-subcat-list main-nav-dropdown-subcat-list']//span[@class='ws-category-title' and text()='Food & Health']" )
  driver.action.move_to(element).perform
  element.click
end

Then /^In "Featured Brands" check that each brand navigates to the page with brand specific items$/ do
  elements = $driver.find_elements(:xpath, "//div[@class='logo-tile gutter__right--tiny']//img" )
  for element in elements
    element.click
    brand_name = $driver.find_element(:xpath, "//div[@class='ws-group pet-heading-group pet-family-title']//h3")
    puts brand_name.text
    $driver.navigate.back
  end
end

#Dog - Food and health - top categories
Then /^Check that each link in "Top Categories" works$/ do
  # present_url = $driver.current_url
  elements = $driver.find_elements(:xpath, "//div[@class='content-row--content-width spacer__bottom--medium clearfix']//a/img" )
  for i in 0..elements.count-1 do
    elements[i].click
    new_window_url = $driver.current_url
    puts new_window_url
    $driver.navigate.back
    elements = $driver.find_elements(:xpath, "//div[@class='content-row--content-width spacer__bottom--medium clearfix']//a/img" )
  end
end

#Dog - Food - see 200 items verification
Then /^In "Dog" menu go to "Food"$/ do
  driver = $driver
  $driver.get("http://www.petsmart.com/")
  sleep 8
  element = $driver.find_element(:xpath, "//li[@class='ws-common-list-item pet-main-nav-item-level1']//span[@class='ws-category-title' and text()='Dog']" )
  driver.action.move_to(element).perform
  element = $driver.find_element(:xpath, "//ul[@class='ws-category-list main-nav-subcat-list main-nav-dropdown-subcat-list']//span[@class='ws-category-title' and text()='Food']" )
  driver.action.move_to(element).perform
  element.click
end
Then /^Click "View 200 Items"$/ do
  element = $driver.find_element(:xpath, "//div[@class='ws-group pet-filter-group pet-paging-group']//a[text()='View 200 Items']" )
  element.click
end
Then /^Check that 200 items displayed$/ do
  elements = $driver.find_elements(:xpath, "//a[@class='url kor-product-link pet-prodloop-title']/h4[@class='ws-product-title fn']")
  puts elements.count
end

#Dog - Food - pagination verification
#it's failing after 16th page
Then /^Go through all pages and print out all given items$/ do
  driver = $driver
  totalpaginations = $driver.find_elements(:xpath, "//ul[@class='ws-product-listing-pagination-list']/li[@class='ws-product-listing-pagination-list-item']")
  sleep 5
  a = 1
  for pagination in totalpaginations do
    sleep 5
    pagination = $driver.find_element(:xpath, "(//ul[@class='ws-product-listing-pagination-list']/li[@class='ws-product-listing-pagination-list-item'])["+a.to_s+"]")
    puts pagination.attribute("innerHTML")
    pagination.click
    elements = $driver.find_elements(:xpath, "//div[@class='ws-group pet-prodloop']//h4[@class='ws-product-title fn']")
    for element in elements do
      puts element.text
    end
    a =a+1
  end
end

#Dog - Food - sorting - price high to low

Then /^Set sorting to "price high to low"$/ do
  element = $driver.find_element(:xpath, "//form/select[@name='SortingAttribute']")
  element.click
  element = $driver.find_element(:xpath, "//form/select[@name='SortingAttribute']/option[@value='ProductSalePrice-desc']")
  $driver.action.move_to(element).perform
  element.click
end
# array == array.sort for ascending
# and array == array.sort.reverse for descending
Then /^Verify correct sorting by price high to low$/ do
  elements = $driver.find_elements(:xpath, "//span[@class='kor-product-sale-price-value ws-sale-price ws-sale-price-temporary']")
  for element in elements do
    element = element.text
    substring = "$"
    element.slice! substring
    array = Array.new
    array = array.push(element)
    puts array
    array == array.sort.reverse
  end

end

#Dog - Food - sorting - price low to high
Then /^Set sorting to "price low to high"$/ do
  element = $driver.find_element(:xpath, "//form/select[@name='SortingAttribute']")
  element.click
  element = $driver.find_element(:xpath, "//form/select[@name='SortingAttribute']/option[@value='ProductSalePrice-asc']")
  $driver.action.move_to(element).perform
  element.click
end

Then /^Verify correct sorting by price low to high$/ do
  elements = $driver.find_elements(:xpath, "//span[@class='kor-product-sale-price-value ws-sale-price ws-sale-price-lower ws-sale-price-temporary']")
  for element in elements do
    element = element.text
    substring = "$"
    element.slice! substring
    array = Array.new
    array = array.push(element)
    puts array
    array == array.sort
  end

end

#Dog - Food - sorting - top rated
Then /^Set sorting to "top rated"$/ do
  element = $driver.find_element(:xpath, "//form/select[@name='SortingAttribute']")
  element.click
  element = $driver.find_element(:xpath, "//form/select[@name='SortingAttribute']/option[@value='AverageRating-desc']")
  $driver.action.move_to(element).perform
  element.click
end

Then /^Verify correct sorting by top rated$/ do
  elements = $driver.find_elements(:xpath, "//div[@class='ws-group pet-prodloop-rating-group ws-stars']")
  for element in elements do
    element = element.text
    array = Array.new
    array = array.push(element)
    puts array
    array == array.sort.reverse
  end
end

#??????????????
#Dog - Food - sorting - best sellers
Then /^Set sorting to "best sellers"$/ do
  element = $driver.find_element(:xpath, "//form/select[@name='SortingAttribute']")
  element.click
  element = $driver.find_element(:xpath, "//form/select[@name='SortingAttribute']/option[@value='SalesRankUnitsIndex-asc']")
  $driver.action.move_to(element).perform
  element.click
end

Then /^Verify correct sorting$/ do
  elements = $driver.find_elements(:xpath, "")
# ?????????????
end

#????????????
#Dog - Food - sorting -new arrivals
Then /^Set sorting to "new arrivals"$/ do
  element = $driver.find_element(:xpath, "//form/select[@name='SortingAttribute']")
  element.click
  element = $driver.find_element(:xpath, "//form/select[@name='SortingAttribute']/option[@value='ArrivalDate-desc']")
  $driver.action.move_to(element).perform
  element.click
end

Then /^Verify correct sorting by arrival date$/ do
  elements = $driver.find_elements(:xpath, "")
# ?????????????
end

#Scenario: Dog - Food - filter - Brand
Then /^Set filter for ([^"]*)$/ do |x|
  element = $driver.find_element(:xpath, "//div[@class='ws-filter ws-filter-#{x}']//li[@class='ws-filter'][1]/input[@type='checkbox']")
  element.click
end

Then /^Verify correct filter sorting$/ do
  elements = $driver.find_elements(:xpath, "//ul[@class='ws-selected-filters-list ws-filter-list']//li/span[@class='ws-filter-value']")
  for element in elements do
    element = element.text
    puts element
  end
end

#Scenario: Dog - Food - comparing - adding 2 items
Then /^Add 2 random items into compare mode$/ do
  myArray = $driver.find_elements(:xpath, "//input[@class='ws-compare-link-checkbox']")
  mySelection = myArray.sample(2)
  for element in mySelection do
    element.click
  end
end



#Scenario: Dog - Food - comparing - adding 3 items
Then /^Add 3 random items into compare mode$/ do
  myArray = $driver.find_elements(:xpath, "//input[@class='ws-compare-link-checkbox']")
  mySelection = myArray.sample(3)
  for element in mySelection do
    element.click
  end
end

#Scenario: Dog - Food - comparing - adding 3 items
Then /^Add 4 random items into compare mode$/ do
  myArray = $driver.find_elements(:xpath, "//input[@class='ws-compare-link-checkbox']")
  mySelection = myArray.sample(4)
  for element in mySelection do
    element.click
  end
end

#Scenario: Dog - Food - comparing - removing 1-3 items
Then /^Remove one item from compare mode$/ do
  elements = $driver.find_elements(:xpath,  "//a[@class='ws-compare-link-remove ref-compare-active   pet-compare-remove']")
  for i in (0..elements.count-1)
    elements[i].click
    $driver.manage.timeouts.implicit_wait = 10
  end
end

#Scenario: Dog - Shopping - 1 item to cart - all fine
Then /^Select 1 available item on the page/ do
  elements = $driver.find_elements(:xpath,  "//h4[@class='ws-product-title fn']")
  mySelection = elements.sample
  mySelection.click
end
Then /^Select Size$/ do
  element = $driver.find_element(:xpath, "//div[@aria-labelledby='List_SizeCode']//div[@class='kor-select-text-viewport-button']")
  element.click
  $driver.mouse.move_to [$driver.find_element(:xpath, "//ul[@class=ws-variation-list        ws-variation-list-SizeCode                ws-variation-selectbox kor-select-list]")]
  elements = $driver.find_elements(:xpath, "//ul/li[@class=' ws-variation-list-item ws-variation-stock ']")
  element = elements[1]
  element.click
end
Then /^Select Flavor$/ do
  element = $driver.find_element(:xpath, "//div[@class='kor-select'][@aria-labelledby='List_Flavor']")
  element.click
  element = $driver.find_element(:xpath, "//ul[@data-variation-attribute='Flavor']")
  $driver.action.move_to(element).perform
  element = $driver.find_element(:xpath, "//ul/li[@class=' ws-variation-list-item ws-variation-stock '][1]")
  element.click
end

Then /^Select Qty$/ do
  element = $driver.find_element(:id, "Quantity_36-5149891")
  element.click
end

Then /^Click Add to cart$/ do
  element = $driver.find_element(xpath, "//div[@class='ws-add-to-cart-container']/button[@type='submit']")
  element.click
end
Then /^Verify that 1 item_items added to the cart$/ do
  element = $driver.find_element(xpath, "//td[@class='ws-cart-qty ws-cart-line-item']/input[@class='ws-text ws-product-quantity-input ws-updateable']")
  puts  element.text
end
Then /^Verify the error message displayed for Size field$/ do
  element = $driver.find_element(xpath,"//ul[@class='kor-field-error-list']/li[text()='Size is a required field.']")
  result = element.exists?
  puts result
end
Then /^Verify the error message displayed for Flavor field$/ do
  element = $driver.find_element(xpath,"//ul[@class='kor-field-error-list']/li[text()='Flavor is a required field.']")
  result = element.exists?
  puts result
end
Then /^Verify the error message displayed for Qty field$/ do
  element = $driver.find_element(xpath,"//ul[@class='kor-field-error-list']/li[text()='This field is required.']")
  result = element.exists?
  puts result
end
Then /^Remove item from the cart$/ do
  element = $driver.find_element(xpath, "//input[@class='ws-text ws-product-quantity-input ws-updateable']")
  element.click
  element = $driver.find_element(xpath, "//span[@class='ws-running-price']")
  if element. text == '$ 0.00'
    puts Passed
  end
end
Then /^Click Check out$/ do
  element = $driver.find_element(xpath,  "//div[@class='ws-cart-summary-controls']//button[@class='ws-button ws-proceed-to-checkout']")
  element.click
end

Then /^Select 3 available item on the page$/ do
  elements = $driver.find_elements(:xpath,  "//h4[@class='ws-product-title fn']")
  mySelection = elements.sample(3)
  for selection in mySelection
   selection.click
  end
end