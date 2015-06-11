###RESTaurant POS System:
This a application is a many-to-many relational data system, that allows restaurant owners to keep track of parties and their food orders. The application allows for multiple users (servers) to log in and start taking food orders and calcutalets the total of items per order.  

Ruby and Sinatra where use to built the back end of the POS system and with the help of Active Record the application can easily communicate with the SQL database. In the front end the user experiences the POS sytem with the help of Javascipt (which include the use of Jquery and Backbone), HTML and CSS.

#Challenge
```javascript
    $('#file').on('focusout', function() {

    reader.onload = function (event) {
        try {
          console.log(event.target.result);
            dataToUpload.file = event.target.result;
        } catch (ex) {
            throw new Error("Error Error");
        }
      }

      var file = document.getElementById('file');

      reader.readAsDataURL(file.files[0]);
    });
    imageFile = dataToUpload.file;
```

![Screen Shot](/screenshot.png)

