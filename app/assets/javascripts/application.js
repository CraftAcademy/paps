// document.addEventListener('DOMContentLoaded', function(){
//   navigator.geolocation.getCurrentPosition(function(resp){
//     var currentUserLocation = {
//        lat: resp.coords.latitude,
//        lng: resp.coords.longitude
//      };
//   }).done(function(currentUserLocation){
//     var request = new XMLHttpRequest();
//     request.onload = callback;
//     request.open("post", "/");
//     var formData = new FormData();
//     formData.append('my_data', currentUserLocation);
//     request.send(formData);
//   })
// }, false);
//
// function callback () {
//  console.log(this.responseText);
// }
var currentUserLocation = new Promise(function(resolve, reject){ navigator.geolocation.getCurrentPosition(resolve, reject);});
currentUserLocation.then(
function(position){
      console.log("Latitude " + position.coords.latitude, "Longitude " + position.coords.longitude);
      var request = new XMLHttpRequest();
      request.onload = callback;
      request.open("post", "../../controllers/home_controller.rb", true);
      var formData = new FormData();
      formData.append('my_data', currentUserLocation);
      request.send(formData);
  },
  function(error){
      console.error(error);
  }
);

function callback () {
 console.log(this.responseText);
}
