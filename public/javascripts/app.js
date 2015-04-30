//name spacing soluction below by using (app)
// creating my namespace
var app = {};
//=================== Food MVC =================================================
//model!
app.FoodModel = Backbone.Model.extend();
//template!
app.FoodTemplate = $('#food-template').html();
//model view!
app.FoodView = Backbone.View.extend({
  tagName: 'div',
  className: 'items',
  events: {
    'click .delete': 'gone',
    'click .foods': 'selectFood'
  },
  template: _.template(app.FoodTemplate),
  intialize: function(){
    //console.log('new card view');
    this.listenTo(this.model, "change", this.render);
  },
  selectFood: function(){
    app.foodSelection = this.model;
    console.log(app.foodSelection);
  },
  gone: function(){
      $(this.el).remove();
  },
  render: function(){
    //console.log('rendering new food view');
    var data = this.model.attributes; //special place where info is held
    var html = this.template(data);
    this.$el.html(html); //method inside of method
    $(".food-section").append(this.$el);
  }
});
//collection!///
app.FoodList = Backbone.Collection.extend({
  url: '/api/foods',
  model: app.FoodModel
});
//collection view!///
app.FoodListView = Backbone.View.extend({
  initialize: function(){
    //console.log('collection is ready');
    this.listenTo(this.collection, "sync", this.render);//***magical method that listen to add,change,save,create,delete***
  },
  render: function(){
    //console.log('collection is being rendered');
    var modelCount = this.collection.models.length; // grabing every single model
    for (var i = 0; i < modelCount; i++) {
      //console.log('looping to render a model');
      var model = this.collection.models[i];
      var view = new app.FoodView({ model: model}); //pass in a model
      view.render();
    }
  }
});




//=================== Parties MVC ==============================================
//model!
app.PartyModel = Backbone.Model.extend()
//template!
app.PartyTemplate = $('#party-template').html()
//view!
app.PartyView = Backbone.View.extend({
  tagName: 'div',
  className: 'tables',
  template: _.template(app.PartyTemplate),
  events: {
    'click .party': 'selectParty'
   },
  intialize: function(){
    //console.log('new party view');
    this.listenTo(this.model, "change", this.render);
  },
  selectParty: function(){
    app.partySelection = this.model;
    console.log(app.partySelection);
  },
  render: function(){
    //console.log('rendering new party view');
    var data = this.model.attributes; //special place where info is held
    var html = this.template(data);
    this.$el.html(html); //method inside of method
    $(".parties-section").append(this.$el);
  },
  renderFoodList: function(){
    var foods = this.model.get('foods');
    console.log(foods);
    var foodList = $('<ul>');
    for (var i = 0; i < foods.length: i++){
      foodList.append($('<li>').text(foods[i]['name']['price']));
    };
  }
});
//collection!////
app.PartyList = Backbone.Collection.extend({
  url: '/api/parties',
  model: app.PartyModel
});
//collection view!////
app.PartyListView = Backbone.View.extend({
  initialize: function(){
    //console.log('collection is ready');
    this.listenTo(this.collection, "sync", this.render);//***magical method that listen to add,change,save,create,delete***
  },
  render: function(){
    //console.log('collection is being rendered');
    var modelCount = this.collection.models.length; // grabing every single model
    for (var i = 0; i < modelCount; i++) {
      //console.log('looping to render a model');
      var model = this.collection.models[i];
      var view = new app.PartyView({ model: model}); //pass in a model
      view.render();
    }
  }
});
//=================== Document ready ===========================================
$(document).ready(function(){
  //new instances of foods
  app.foodList = new app.FoodList();
  app.foodListView = new app.FoodListView({
    collection: app.foodList
  });
  app.foodList.fetch();
  //new instances of parties
  app.partyList = new app.PartyList();
  app.partyListView = new app.PartyListView({
    collection: app.partyList
  });
  app.partyList.fetch();



//============= jquery style functions ==========================================

  // $('div').click(function(){
  //   $( '.orders' ).toggle( "slow", function() {});
  // });


});//document ready end
