// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "bootstrap/dist/js/bootstrap"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
import 'taskleaf/hello';
document.addEventListener('turbolinks:load', function(){
    document.querySelectorAll('td').forEach(function(td){
      td.addEventListener('mouseover', function(e){
          e.currentTarget.style.backgroundColor = '#eff';
      });
      td.addEventListener('mouseout', function(e){
          e.currentTarget.style.backgroundColor = '';
      });
    });
  });