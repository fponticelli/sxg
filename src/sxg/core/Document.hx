package sxg.core;

interface Document<T> {
  function createElementNS(ns : String, name : String) : T;
  function elementToString(el : T, ?pretty : Bool = false) : String;
  function appendChild(parent : T, child : T) : Void;
  function removeChild(parent : T, child : T) : Void;
}
