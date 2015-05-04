var app = {};
//=================== Food MVC =================================================

app.FoodModel = Backbone.Model.extend();

app.FoodTemplate = $('#food-template').html();

app.FoodView = Backbone.View.extend({
  tagName: 'div',
  className: 'items',
  events: {
    'click .delete': 'gone',
    'click .foods': 'selectFood'
  },
  template: _.template(app.FoodTemplate),
  intialize: function(){
    this.listenTo(this.model, "change", this.render);
    this.listentTo(this.model, "delete", this.render);
  },
  selectFood: function(){
    app.foodSelection = this.model;
  },
  gone: function(){
      this.model.destroy();
      $(this.el).remove();
  },
  render: function(){
    var data = this.model.attributes;
    var html = this.template(data);
    this.$el.html(html);
    $(".food-section").append(this.$el);
  }
});

app.FoodList = Backbone.Collection.extend({
  url: '/api/foods',
  model: app.FoodModel
});

app.FoodListView = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.collection, "sync", this.render);
  },
  render: function(){
    this.$el.empty();
    var modelCount = this.collection.models.length;
    for (var i = 0; i < modelCount; i++) {
      var model = this.collection.models[i];
      var view = new app.FoodView({ model: model});
      view.render();
    }
  }
});

//=================== Parties MVC ==============================================

app.PartyModel = Backbone.Model.extend()

app.PartyTemplate = $('#party-template').html()

app.PartyView = Backbone.View.extend({
  tagName: 'div',
  className: 'tables',
  template: _.template(app.PartyTemplate),
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
  render: function(){
    this.$el.empty();
    var data = this.model.attributes;
    var html = this.template(data);
    this.$el.html(html);
    $(".parties-section").append(this.$el);
    return this;
  }
});

app.PartyList = Backbone.Collection.extend({
  url: '/api/parties',
  model: app.PartyModel
});

app.PartyListView = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.collection, "sync", this.render);
  },
  render: function(){
    this.$el.empty();
    var modelCount = this.collection.models.length;
    for (var i = 0; i < modelCount; i++) {
      var model = this.collection.models[i];
      var view = new app.PartyView({ model: model});
      view.render();
    }
  }
});

//=================== Document ready ===========================================
$(document).ready(function(){

  app.foodList = new app.FoodList();
  app.foodListView = new app.FoodListView({
    collection: app.foodList
  });
  app.foodList.fetch();

  app.partyList = new app.PartyList();
  app.partyListView = new app.PartyListView({
    collection: app.partyList,
    el: $('.parties-section')
  });
  app.partyList.fetch();


  $('#place-order').on('click', function(){

    var partyId = app.partySelection.get('id');
    var foodId = app.foodSelection.get('id');

    $.ajax({
      method: 'post',
      url: '/api/orders',
      data: {order: {partie_id: partyId, food_id: foodId} },
      success: function(data){
        var options = data;
        app.partyList.fetch( {reset: true} );
      }
    });

  });//end of click event


});//document ready end
