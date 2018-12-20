var noos = require('./noos.js');

function usage() {
    console.log('Usage:');
    console.log('    $0 help');
    console.log('    $0 all');
    console.log('    $0 service');
    console.log('');
    console.log('You can list the available services like so:');
    console.log(process.argv[0], ' available_services');
}

function log(error, response, body) {
    if (error !== null) {
        console.log(error);
    }
    else if (body !== null) {
        console.log(JSON.stringify(JSON.parse(body), null, 4));
    }
}

if (process.argv.length == 2) {
    console.log('ERROR: no arguments given');
    usage();
    process.exit(1);
}

var service = process.argv[2];
if (service == 'help') {
    usage();
    process.exit(0);
}

if (service == 'all' || service == 'available_services') {
    noos.available_services(log);
}

//////////////////////////////////////////////////
// COMPUTER VISION                              //
//////////////////////////////////////////////////
if (service == 'all' || service == 'face_detection') {
    var path = __dirname + '/../../data/face.jpg';
    noos.face_detection(path, log);
}

var path = __dirname + '/../../data/cropped_face.jpg';

if (service == 'all' || service == 'gender_detection') {
    noos.gender_detection(path, log);
}

if (service == 'all' || service == 'age_detection') {
    noos.age_detection(path, log);
}

if (service == 'all' || service == 'face_expression') {
    noos.face_expression(path, log);
}

if (service == 'all' || service == 'face_recognition') {
    noos.face_recognition(path, log);
}

if (service == 'all' || service == 'human_detection') {
    var path = __dirname + '/../../data/human.jpg';
    noos.human_detection(path, log);
}

if (service == 'all' || service == 'object_recognition') {
    var path = __dirname + '/../../data/cup.jpg';
    noos.object_recognition(path, log);
}

if (service == 'all' || service == 'qr_recognition') {
    var path = __dirname + '/../../data/qr_code.jpg';
    noos.object_recognition(path, log);
}

//////////////////////////////////////////////////
// ORB                                          //
//////////////////////////////////////////////////

//////////////////////////////////////////////////
// MOBILE ROBOTICS                              //
//////////////////////////////////////////////////
if (service == 'all' || service == 'upload_slam_config_file') {
    var path = __dirname + '/../../data/upload_icp_file.json';
    noos.upload_slam_config_file(path, log);
}

if (service == 'all' || service == 'slam') {
    var path = __dirname + '/../../data/laser.json';
    noos.slam(path, log);
}

if (service == 'all' || service == 'get_map') {
    noos.get_map(log);
}

if (service == 'all' || service == 'delete_map') {
    noos.delete_map(log);
}

if (service == 'all' || service == 'path_planning') {
    var path = __dirname + '/../../data/path.json';
    noos.path_planning(path, log);
}

//////////////////////////////////////////////////
// DIALOGUE_SYSTEMS                             //
//////////////////////////////////////////////////
if (service == 'all' || service == 'chat') {
    noos.chat('hello', null, log);
}