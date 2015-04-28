//name spacing soluction below by using (app)
// creating my namespace
var app = {};

//model!
app.FoodModel = Backbone.Model.extend();
//template!
app.FoodTemplate = $('#food-template').html();
//model view!
app.FoodView = Backbone.View.extend({
  template: _.template(app.FoodTemplate),
  intialize: function(){
    //console.log('new card view');
    this.listenTo(this.model, "change", this.render);
  },
  render: function(){
    //console.log('rendering new card view');
    var data = this.model.attributes; //special place where info is held
    this.$el.html(this.template(data)); //method inside of method
    $(".food-section").append(this.$el.html());
  }
});

//collection!
app.FoodList = Backbone.Collection.extend({
  url: '/api/foods',
  model: app.FoodModel
});
//collection view!
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

$(document).ready(function(){

  app.foodList = new app.FoodList();
  app.foodListView = new app.FoodListView({
    collection: app.foodList
  });
  app.foodList.fetch();

});
