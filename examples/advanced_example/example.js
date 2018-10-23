'use strict'

var noos = require('./noos.js');

function log(error, response, body) {
    if (error !== null)
        console.log(error);
    if (body !== null) 
        console.log(JSON.stringify(JSON.parse(body), null, 4));
}

noos.available_services(log);

var path = __dirname + '/../data/face.jpg';
noos.face_detection(path, log);

var path = __dirname + '/../data/cropped_face.jpg';
noos.gender_detection(path, log);
noos.age_detection(path, log);
noos.face_expression(path, log);
noos.face_recognition(path, log);

var path = __dirname + '/../data/human.jpg';
noos.human_detection(path, log);

var path = __dirname + '/../data/cup.jpg';
noos.object_recognition(path, log);
