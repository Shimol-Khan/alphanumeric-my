// Rails Staffs
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "stylesheets/application.scss"

// jQuery Config
var jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

// Custom javascript

// Fancy Alert
$(document).ready(function (){
	setTimeout(function(){
		$('#notice_wrapper').fadeOut("fast",function(){
			$(this).remove();
		})
	},3500);
});