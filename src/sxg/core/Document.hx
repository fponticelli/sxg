package sxg.core;

interface Document<T> {
  function createElementNS(ns : String, name : String) : T;
  function elementToString(el : T, ?pretty : Bool = false) : String;
  function appendChild(parent : T, child : T) : Void;
  function removeChild(parent : T, child : T) : Void;
  function setAttribute(el : T, name : String, value : String) : String;
  function setFloatAttribute(el : T, name : String, value : Null<Float>) : Null<Float>;
  function getAttribute(el : T, name : String) : String;
  function getFloatAttribute(el : T, name : String) : Null<Float>;
  function removeAttribute(el : T, name : String) : Void;
}
