###RESTaurant POS System:
This application is a many-to-many relational data system that allows restaurant personnel to list new food items and keep track of parties and their food orders. The application can have multiple users (servers) log in, start taking food orders and completes each transaction with a calculation of the total of items per order.  

Ruby and Sinatra were used to build the back end of the POS system, and with the help of Active Record, the application can easily communicate with the SQL database. In the front end, the user experiences the POS sytem with the help of Javascipt (which includes the use of Jquery and Backbone), HTML and CSS.

![Screen Shot](/screenshot.png)

#Challenge
One of the main challenges I encountered was making a click event that displays a parties' food order. The code below is a function for a Backbone view that gets any food item belonging to a specific party and appends it to an unordered list.

```javascript
  events: {
    'click .party': 'selectParty'
   },
  intialize: function(){
    this.listenTo(this.model, "change", this.render);
  },
  selectParty: function(){
    app.partySelection = this.model;
    if (this.model.get("foods")) {
      var foods = this.model.get('foods');
      var foodList = $('<ul>');
      for (var i = 0; i < foods.length; i++){
        var foodD = $('<li>').text(foods[i]['name']);
        var priceD = $('<strong>').text('$'+foods[i]['price']);
        foodD.append(priceD);
        foodList.append(foodD);
      };
      $('.orders').html(foodList);
    }
  },
```

#Upcoming Features
Features that will be included in the next version are: A display that totals up the price for an individual order and a printable receipt.


