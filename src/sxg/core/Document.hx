package sxg.core;

interface Document<T> {
  function createElementNS(ns : String, name : String) : T;
  function elementToString(el : T, ?pretty : Bool = false) : String;
  function appendChild(parent : T, child : T) : Void;
  function removeChild(parent : T, child : T) : Void;
  function getAttribute(el : T, name : String) : String;
  function setAttribute(el : T, name : String, value : String) : String;
  function getFloatAttribute(el : T, name : String) : Null<Float>;
  function setFloatAttribute(el : T, name : String, value : Null<Float>) : Null<Float>;
  function getStyle(el : T, name : String) : String;
  function setStyle(el : T, name : String, value : String) : String;
  function getFloatStyle(el : T, name : String) : Null<Float>;
  function setFloatStyle(el : T, name : String, value : Null<Float>) : Null<Float>;
  function removeAttribute(el : T, name : String) : Void;
}
