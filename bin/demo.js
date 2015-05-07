(function (console) { "use strict";
var Demo = function() { };
Demo.main = function() {
	console.log("hello");
};
Demo.xml = function() {
	var doc = new sxg_core_XmlDocument();
};
var Xml = function(nodeType) {
	this.nodeType = nodeType;
	this.children = [];
	this.attributeMap = new haxe_ds_StringMap();
};
Xml.createDocument = function() {
	return new Xml(Xml.Document);
};
var haxe_IMap = function() { };
var haxe_ds_StringMap = function() {
	this.h = { };
};
haxe_ds_StringMap.__interfaces__ = [haxe_IMap];
var sxg_core_CoreDocument = function() { };
var sxg_core_XmlDocument = function(xml) {
	if(null == xml) this.xml = Xml.createDocument(); else this.xml = xml;
};
sxg_core_XmlDocument.__interfaces__ = [sxg_core_CoreDocument];
var __map_reserved = {}
Xml.Document = 6;
Demo.main();
})(typeof console != "undefined" ? console : {log:function(){}});
