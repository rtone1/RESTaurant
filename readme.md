###RESTaurant POS System:
This a application is a many-to-many relational data system, that allows restaurant owners to list new food items and keep track of parties and their food orders. The application allows for multiple users (servers) to log in and start taking food orders and calcutalets the total of items per order.  

Ruby and Sinatra where use to built the back end of the POS system and with the help of Active Record the application can easily communicate with the SQL database. In the front end the user experiences the POS sytem with the help of Javascipt (which include the use of Jquery and Backbone), HTML and CSS.

![Screen Shot](/screenshot.png)

#Challenge
One of the biggest challenges I encounter was to make a click event that displays a parties food order. The code below a snippet that sets a function in parties Backbone view that gets any food item belonging to a specific party and appends it to a unorder list.

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
Features that will be include in the next version are: A display of the total price amount and a printable receipt.


