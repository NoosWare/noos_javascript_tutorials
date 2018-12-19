var exports = module.exports = {};

var request = require('request');
var fs = require('fs');

// server url
var server = 'https://demo.noos.cloud:9001/';

// authentification login
var data = fs.readFileSync(".noos_credentials");
var logins = data.toString().split("\n");
var auth = {
    'User-Token': logins[0], // username
    'Accept-Token': logins[1] // password
};


function build_request(service, form_data) {
    var options = {
        url: server + service,
        headers: auth,
        method: 'GET',
        // forever: true,
    };
    if (form_data !== null) {
        options.formData = form_data;
        options.method = 'POST';
    }
    return options;
}

function call(service, form_data, callback) {
    var options = build_request(service, form_data);
    request(options, callback);
    return;
}

function call_with_file(service, path, callback) {
    var form_data = {
        filename: (path, fs.createReadStream(path))
    };
    call(service, form_data, callback);
}

exports.available_services = function(callback) {
    call('available_services', null, callback);
}

//////////////////////////////////////////////////
// COMPUTER VISION                              //
//////////////////////////////////////////////////
exports.face_detection = function(path, callback) {
    call_with_file('face_detection', path, callback);
}

exports.gender_detection = function(path, callback) {
    call_with_file('gender_detection', path, callback);
}

exports.age_detection = function(path, callback) {
    call_with_file('age_detection', path, callback);
}

exports.face_expression = function(path, callback) {
    call_with_file('face_expression', path, callback);
}

exports.face_recognition = function(path, callback) {
    call_with_file('face_recognition', path, callback);
}

exports.human_detection = function(path, callback) {
    call_with_file('human_detection', path, callback);
}

exports.object_recognition = function(path, callback) {
    call_with_file('object_recognition', path, callback);
}

exports.qr_recognition = function() {
    call_with_file('qr_recognition', path, callback);
}

//////////////////////////////////////////////////
// ORB                                          //
//////////////////////////////////////////////////


// orb_add_model

// orb_del_model

// orb_query

//////////////////////////////////////////////////
// MOBILE ROBOTICS                              //
//////////////////////////////////////////////////
exports.upload_slam_config_file = function(path, callback) {
    form_data = {
        json: fs.readFileSync(path)
    };
    call('upload_slam_config_file', form_data, callback);
}

exports.slam = function(path, callback) {
    form_data = {
        json: fs.readFileSync(path)
    };
    call('slam', form_data, callback);
}

exports.get_map = function(callback) {
    form_data = {
        json: '{"map_name": "map"}'
    };
    call('get_map', form_data, callback);
}

exports.path_planning = function(path, callback) {
    form_data = {
        json: fs.readFileSync(path)
    }
    call('path_planning', form_data, callback);
}

//////////////////////////////////////////////////
// DIALOGUE_SYSTEMS                             //
//////////////////////////////////////////////////
exports.chat = function(sentence, path, callback) {
    form_data = {
        json: '{"state": "' + sentence + '", "filename": ""}'
    };
    call('chat', form_data, callback);
}
