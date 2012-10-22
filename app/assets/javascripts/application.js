// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

jQuery.fn.comments = function(){
  var jComments = $( [] );
  this.each(
    function( intI, objNode ){
      var objChildNode = objNode.firstChild;
      while (objChildNode) {
        if (objChildNode.nodeType === 8) {
          jComments = jComments.add($(objChildNode))
        } else if (objChildNode.nodeType === 1) {
          jComments = jComments.add($( objChildNode ).comments());
        }
        objChildNode = objChildNode.nextSibling;
      }
    }
  );
  return( jComments );
}

function whocan_highlight() {
  $("body").comments().each(function (i) {
    if ($(this).next()) {
      $(this).next().addClass('whocan');
      $(this).next().attr('title', this.nodeValue);
    }
    true
  });
}

function whocan_report() {
  $('#whocan-report').show()
}
