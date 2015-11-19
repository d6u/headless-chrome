var Chrome = require('chrome-remote-interface');

// ---------------------
// Update the host
// ---------------------
var opts = {host: '192.168.99.100', port: 9222};

console.log('stage 0');

Chrome(opts, function (chrome) {
  console.log('stage 1');

  chrome.Network.setCacheDisabled(true);
  chrome.Network.enable();
  chrome.Page.enable();
  chrome.once('ready', function () {
    chrome.Page.navigate({'url': 'http://google.com'});
  });

  setTimeout(function () {
    chrome.Page.getResourceTree(function(err, data) {
      console.log(data);
      chrome.close();
    });
  }, 1000);

}).on('error', function (err) {
    console.log(err);
});
