// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'jquery'
import 'bootstrap';
import '../stylesheets/application';
import '@fortawesome/fontawesome-free/js/all'

// 評価機能
import Raty from "raty.js"
window.raty = function(elem,opt) {
  let raty =  new Raty(elem,opt);
  raty.init();
  return raty;
}

Rails.start()
// Turbolinks.start() //raty読み込みのために無効化
ActiveStorage.start()

window.$ = window.jQuery = require('jquery');

// ローディング画面
// jQuery(document).on('turbolinks:load', function(){
$(function(){
$('.loading').on('click',function(){
  $('.loading-mark').css("display", "block")   
});
});
