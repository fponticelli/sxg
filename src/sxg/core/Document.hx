package sxg.core;

interface Document {
  function createElementNS(ns : String, name : String) : Element;
  function elementToString(el : Element, ?pretty : Bool = false) : String;
}
