'use strict'

// import needed modules
var request = require('request');
var fs = require('fs');

// Read the logins for the platform
var data = fs.readFileSync(".noos_credentials");
var logins = data.toString().split("\n");
var auth = {
    'User-Token': logins[0], // username
    'Accept-Token': logins[1] // password
};

// The form to submit
var file_path = __dirname + "/../data/face.jpg";
var form_data = {
    filename: (file_path, fs.createReadStream(file_path)),
};

// create the request options
var request_options = {
    url: 'https://demo.noos.cloud:9001/face_detection',
    headers: auth,
    method: 'POST',
    formData: form_data
};

// request the platform and print the result
request(request_options, function(error, response, body) {
    if (error) throw error;
    var json_body = JSON.parse(body);
    console.log(JSON.stringify(json_body, null, 4));
});
