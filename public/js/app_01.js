//Application Initialization by hooking at DOM Ready event using jQuery. 
$(document).ready(function() {
  var APP_ID = "LAST_PRICE_APP";
  var appModel = null;

  //Start The App when JET is ready
  JET.onLoad(function () {
    console.log("JET has been initialized"); 
  });

  //Initialize JET
  JET.init({
    ID:"WebPageID",  //Unique ID of your application, can be any string
    Title:"My Web Page", //Title that will be showing on the application window
    Summary:"A sample page for the JET API" //Any string to describe your app
  });
});