#MiniBAR

##Description
MiniBAR is a consumer-focused RoR mobile-first web app that allows users to open and manage an active tab from their mobile device. 

##Features
Users can register as a Patron or Bar (including payment methods). 

As a patron, users can search for bars by zip code and open a tab at a bar. Once a tab has been opened, they can view all items on their open tab, and close their tab (with tip). Bars can add tab items from a pre-determined drink list, toggle status to become discoverable in search rankings, and close a patron's tab (or all existing tabs).

##Technologies Used
  * Back End: Rails API, ActiveRecord, PostgreSQL, ActionCable
  * Front End: JavaScript, jQuery, HTML, CSS, Bourbon
  * APIs: Google Maps, Braintree

####Configuration

Ruby version: ````2.2.2````

####Setup

To get started, run ````bundle install```` followed the three following rake processes:

````be rake db:create````

````be rake db:migrate````

````be rake db:seed````

##Using MiniBar

###To open and close a bar tab as a customer:
  1. Register/Login as a patron (dummy payment info included)
  2. Select a bar to open a tab at (or search by zipcode)
  3. (Order drinks --- offline)
  4. Close your tab and leave a tip

###To have customers and tabs as a bar:
  1. Register/Login as a patron (dummy payment/EIN included)
  2. Navigate to settings, and set discoverable to ON (button will change to "Discoverable Off" once turned on)
  3. Navigate to all tabs to see a list of existing tabs
  4. Click on an existing tab and add or remove items
  5. Forcefully close the tab

##Challenges We Faced
One challenge of MiniBAR was setting up Payment through Braintree's Sandbox. It was a crucial step for a payment app, as it allows for verification and security of payment methods. The biggest challenge in implementing was determining how MiniBAR as a business should interact with it's "merchant" accounts.

A second challenge was implementing ActionCable. It took multiple days for us to complete, but was a great addition to the project. ActionCable allowed our servers to asynchronously update user feeds on both sides of the bar/patron transaction in real-time.

##Next Steps
We hope to implement a native mobile experience (most likely using Ionic). The app also needs to have authorization fully implemented. Other potential features include: limiting users to one open tab and allowing bars to add and customize their own menu items.

###Payment Environment

Integration with the [Braintree Sandbox](https://sandbox.braintreegateway.com/login) allows us to process payments in a testing environment. For security purposes, environment variables are used. For full functionality of the app, create a .env file with your unique sandbox credentials.

####Adding Braintree Info

(Documentation upcoming)

### Running the Test Suite

(Documentation upcoming)

##The Team
  * Team Lead: Jack Noble
  * Team Members: Dave Nestoff, Lucas Wright, Mark McLoughlin
