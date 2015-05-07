(function (console) { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var Demo = function() { };
Demo.main = function() {
	var xml = sxg_Svg.xml();
	var dom = sxg_Svg.dom();
	console.log(xml.toString());
	console.log(dom.toString());
};
var Xml = function(nodeType) {
	this.nodeType = nodeType;
	this.children = [];
	this.attributeMap = new haxe_ds_StringMap();
};
Xml.createElement = function(name) {
	var xml = new Xml(Xml.Element);
	if(xml.nodeType != Xml.Element) throw new js__$Boot_HaxeError("Bad node type, expected Element but found " + xml.nodeType);
	xml.nodeName = name;
	return xml;
};
Xml.createDocument = function() {
	return new Xml(Xml.Document);
};
var haxe_IMap = function() { };
var haxe_ds_StringMap = function() {
	this.h = { };
};
haxe_ds_StringMap.__interfaces__ = [haxe_IMap];
haxe_ds_StringMap.prototype = {
	get: function(key) {
		if(__map_reserved[key] != null) return this.getReserved(key);
		return this.h[key];
	}
	,setReserved: function(key,value) {
		if(this.rh == null) this.rh = { };
		this.rh["$" + key] = value;
	}
	,getReserved: function(key) {
		if(this.rh == null) return null; else return this.rh["$" + key];
	}
};
var js__$Boot_HaxeError = function(val) {
	Error.call(this);
	this.val = val;
	this.message = String(val);
	if(Error.captureStackTrace) Error.captureStackTrace(this,js__$Boot_HaxeError);
};
js__$Boot_HaxeError.__super__ = Error;
js__$Boot_HaxeError.prototype = $extend(Error.prototype,{
});
var sxg_Document = function(doc) {
	this.doc = doc;
};
sxg_Document.xml = function() {
	return new sxg_Document(new sxg_core_XmlDocument());
};
sxg_Document.dom = function(document) {
	return new sxg_Document(new sxg_core_DomDocument(document));
};
var sxg_Svg = function(doc) {
	this.doc = doc;
};
sxg_Svg.xml = function() {
	return new sxg_Svg(sxg_Document.xml());
};
sxg_Svg.dom = function(document) {
	return new sxg_Svg(sxg_Document.dom(document));
};
sxg_Svg.prototype = {
	toString: function() {
		return "svg???";
	}
};
var sxg_core_CoreDocument = function() { };
var sxg_core_DomDocument = function(document) {
	if(null == document) {
		this.doc = window.document;
	} else this.doc = document;
};
sxg_core_DomDocument.__interfaces__ = [sxg_core_CoreDocument];
sxg_core_DomDocument.prototype = {
	createElementNS: function(ns,name) {
		return this.doc.createElementNS(ns,name);
	}
};
var sxg_core_XmlDocument = function(xml,prefixes) {
	if(null == xml) this.xml = Xml.createDocument(); else this.xml = xml;
	if(null == prefixes) {
		var _g = new haxe_ds_StringMap();
		if(__map_reserved["http://www.w3.org/2000/svg"] != null) _g.setReserved("http://www.w3.org/2000/svg","svg"); else _g.h["http://www.w3.org/2000/svg"] = "svg";
		if(__map_reserved["http://www.w3.org/1999/xlink"] != null) _g.setReserved("http://www.w3.org/1999/xlink","xmlink"); else _g.h["http://www.w3.org/1999/xlink"] = "xmlink";
		if(__map_reserved["http://www.w3.org/2000/xmlns/"] != null) _g.setReserved("http://www.w3.org/2000/xmlns/","xmlns"); else _g.h["http://www.w3.org/2000/xmlns/"] = "xmlns";
		this.prefixes = _g;
	} else this.prefixes = prefixes;
};
sxg_core_XmlDocument.__interfaces__ = [sxg_core_CoreDocument];
sxg_core_XmlDocument.prototype = {
	createElementNS: function(ns,name) {
		return Xml.createElement(this.p(ns,name));
	}
	,p: function(ns,value) {
		var pr = this.prefixes.get(ns);
		if(null == pr) throw new js__$Boot_HaxeError("no prefix found for " + ns);
		return "" + pr + ":" + value;
	}
};
var __map_reserved = {}
Xml.Element = 0;
Xml.Document = 6;
sxg_Document.SVG = "http://www.w3.org/2000/svg";
sxg_Document.XMLNS = "http://www.w3.org/2000/xmlns/";
sxg_Document.XLINK = "http://www.w3.org/1999/xlink";
Demo.main();
})(typeof console != "undefined" ? console : {log:function(){}});
