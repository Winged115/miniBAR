### About MiniBAR

MiniBAR was our eight-day capstone project collaboration for Dev Bootcamp. It is a consumer-focused RoR mobile-first web app that allows users to manage an active tab from their mobile device. The main functionalities include:
* Register and log-in as a Patron or Bar (including set up payment methods)
* As a patron, search for bars by zip code and open a tab at a bar
* As a patron, view all items on their open tab, and close their tab (with tip)
* As a bar, add tab items from a pre-determined drink list
* As a bar, change status to become discoverable in search rankings
* As a bar, close a patrons tab (or all tabs)

Technologies, languages, and API's include: 
* Ruby on Rails
* JQuery
* Javascript
* Bourbon SASS library
* Google Maps API
* Braintree API

####Configuration

Ruby version: ````2.2.2````

* System dependencies

####Setup

````bundle install````

````be rake db:create````

````be rake db:migrate````

````be rake db:seed````

###Payment Environment

Integration with the [Braintree Sandbox](https://sandbox.braintreegateway.com/login) allows us to process payments in a testing environment. For security purposes, environment variables are used. For full functionality of the app, create a .env file with your unique sandbox credentials.

####Adding Braintree Info

(Documentation upcoming)

### Running the Test Suite

(Documentation upcoming)

