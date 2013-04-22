feedsapi = require("../api/feeds.js");
url = require('url')
querystring = require('querystring')
firebase = require('firebase')

exports.feedOfNote = function(req, res) {
  /*/feeds/note request
  */
  var note, params, urlData, validParams;

  console.log("feeds/note api");
  urlData = url.parse(req.url);
  params = querystring.parse(urlData.query);
  validParams = feedsapi.validateNoteParam(params);
  /*param validation
  */

  if (validParams) {
    note = new firebase("https://wiredancer.firebaseio.com/note");
    return note.once("value", function(snapshot) {
      var result;

      result = feedsapi.query(snapshot.val(), 'note', validParams);
      res.write(result);
      return res.end();
    });
  } else {
    res.write("Could not understand your request");
    return res.end();
  }
}

exports.feedOfUser = function(req, res) {
  /*/feeds/user request
  */
  var note, params, urlData, validParams;

  console.log("feeds/user api");
  urlData = url.parse(req.url);
  params = querystring.parse(urlData.query);
  validParams = feedsapi.validateUserParam(params);
  /*param validation
  */

  if (validParams) {
    note = new firebase("https://wiredancer.firebaseio.com/user");
    return note.once("value", function(snapshot) {
      var result;

      result = feedsapi.query(snapshot.val(), 'user', validParams);
      res.write(result);
      return res.end();
    });
  } else {
    res.write("Could not understand your request");
    return res.end();
  }
}
