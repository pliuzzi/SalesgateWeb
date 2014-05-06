function formatXml(xml) {

  var reg = /(>)\s*(<)(\/*)/g;
  var wsexp = / *(.*) +\n/g;
  var contexp = /(<.+>)(.+\n)/g;
  xml = xml.replace(reg, '$1\n$2$3').replace(wsexp, '$1\n').replace(contexp, '$1\n$2');
  var pad = 0;
  var formatted = '';
  var lines = xml.split('\n');
  var indent = 0;
  var lastType = 'other';
  // 4 types of tags - single, closing, opening, other (text, doctype, comment)
  // - 4*4 = 16 transitions
  var transitions = {
    'single->single' : 0,
    'single->closing' : -1,
    'single->opening' : 0,
    'single->other' : 0,
    'closing->single' : 0,
    'closing->closing' : -1,
    'closing->opening' : 0,
    'closing->other' : 0,
    'opening->single' : 1,
    'opening->closing' : 0,
    'opening->opening' : 1,
    'opening->other' : 1,
    'other->single' : 0,
    'other->closing' : -1,
    'other->opening' : 0,
    'other->other' : 0
  };

  for (var i = 0; i < lines.length; i++) {
    var ln = lines[i];
    var single = Boolean(ln.match(/<.+\/>/)); // is this line a single tag? ex.
                                              // <br />
    var closing = Boolean(ln.match(/<\/.+>/)); // is this a closing tag? ex.
                                                // </a>
    var opening = Boolean(ln.match(/<[^!].*>/)); // is this even a tag (that's
                                                  // not <!something>)
    var type = single ? 'single' : closing ? 'closing' : opening ? 'opening' : 'other';
    var fromTo = lastType + '->' + type;
    lastType = type;
    var padding = '';

    indent += transitions[fromTo];
    for (var j = 0; j < indent; j++) {
      padding += '  ';
    }
    if (fromTo == 'opening->closing')
      formatted = formatted.substr(0, formatted.length - 1) + ln + '\n'; // substr
                                                                          // removes
                                                                          // line
                                                                          // break
                                                                          // (\n)
                                                                          // from
                                                                          // prev
                                                                          // loop
    else
      formatted += padding + ln + '\n';
  }

  return formatted;
}
function selectText(element) {
  var doc = document, text = doc.getElementById(element), range, selection;
  if (doc.body.createTextRange) {
    range = document.body.createTextRange();
    range.moveToElementText(text);
    range.select();
  } else if (window.getSelection) {
    selection = window.getSelection();
    range = document.createRange();
    range.selectNodeContents(text);
    selection.removeAllRanges();
    selection.addRange(range);
  }
}
function formatXml2(xml) {
  var formatted = '';
  var reg = /(>)(<)(\/*)/g;
  xml = xml.replace(reg, '$1\r\n$2$3');
  var pad = 0;
  jQuery.each(xml.split('\r\n'), function(index, node) {
    var indent = 0;
    if (node.match(/.+<\/\w[^>]*>$/)) {
      indent = 0;
    } else if (node.match(/^<\/\w/)) {
      if (pad != 0) {
        pad -= 1;
      }
    } else if (node.match(/^<\w[^>]*[^\/]>.*$/)) {
      indent = 1;
    } else {
      indent = 0;
    }

    var padding = '';
    for (var i = 0; i < pad; i++) {
      padding += '  ';
    }

    formatted += padding + node + '\r\n';
    pad += indent;
  });

  return formatted;
}
function showLoadingBar(){
  $("body").css("cursor", "progress");
  $('.js-loading-bar').modal('show').is(':visible');
}
function hideLoadingBar(){
  $("body").css("cursor", "default");
  $('.js-loading-bar').modal('hide');
}