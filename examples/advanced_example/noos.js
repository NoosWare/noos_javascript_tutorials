'use strict'

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
}

function call_with_image(service, path, callback) {
    var form_data = {
        filename: (path, fs.createReadStream(path))
    };
    call(service, form_data, callback);
}

exports.available_services = function(callback) {
    call('available_services', null, callback);
}

exports.face_detection = function(path, callback) {
    call_with_image('face_detection', path, callback);
}

exports.gender_detection = function(path, callback) {
    call_with_image('gender_detection', path, callback);
}

exports.age_detection = function(path, callback) {
    call_with_image('age_detection', path, callback);
}

exports.face_expression = function(path, callback) {
    call_with_image('face_expression', path, callback);
}

exports.face_recognition = function(path, callback) {
    call_with_image('face_recognition', path, callback);
}

exports.human_detection = function(path, callback) {
    call_with_image('human_detection', path, callback);
}

exports.object_recognition = function(path, callback) {
    call_with_image('object_recognition', path, callback);
}

exports.slam_with_lidar = function() {

}

exports.create_map = function() {

}

exports.qr_recognition = function() {

}

exports.get_map = function() {

}

exports.orb_features = function() {

}

exports.path_planning = function() {

}

exports.nlp_dialog_systems = function() {

}
