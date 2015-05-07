(function (console) { "use strict";
var Demo = function() { };
Demo.main = function() {
	console.log("hello");
};
Demo.main();
})(typeof console != "undefined" ? console : {log:function(){}});
