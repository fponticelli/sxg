package sxg.core;

interface Document {
  function createElementNS(ns : String, name : String) : Element;
}
