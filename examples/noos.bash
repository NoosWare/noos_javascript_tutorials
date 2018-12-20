#!/bin/bash
set -e

function usage() {
    echo 'Usage:'
    echo '    $0 help'
    echo '    $0 all'
    echo '    $0 service'
    echo ''
    echo 'You can list the available services like so:'
    echo '$0 available_services'
}

if [ $# -ne 1 ]; then
    echo 'ERROR: no arguments given'
    usage
    exit 1
fi

if [ "$1" == "help" -o "$1" == "h" ]; then
    usage
    exit 0
fi

service="${1}"

# setup
server='https://demo.noos.cloud:9001'
username=`head -n 1 ".noos_credentials"`
password=`tail -n 1 ".noos_credentials"`

##################################################
# COMPUTER VISION                                #
##################################################

# available services
if [ "${service}" == 'all' -o "${service}" == 'available_services' ]; then
    url="$server/available_services"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        $url 2> /dev/null | python -m json.tool
fi

# face_detection
if [ "${service}" == 'all' -o "${service}" == 'face_detection' ]; then
    url="$server/face_detection"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "filename=@../data/face.jpg" \
        $url 2> /dev/null | python -m json.tool
fi

# gender_detection
if [ "${service}" == 'all' -o "${service}" == 'gender_detection' ]; then
    url="$server/gender_detection"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "filename=@../data/cropped_face.jpg" \
        $url 2> /dev/null | python -m json.tool
fi

# age_detection
if [ "${service}" == 'all' -o "${service}" == 'age_detection' ]; then
    url="$server/age_detection"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "filename=@../data/face.jpg" \
        $url 2> /dev/null | python -m json.tool
fi

# face_expression
if [ "${service}" == 'all' -o "${service}" == 'face_expression' ]; then
    url="$server/face_expression"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "filename=@../data/cropped_face.jpg" \
        $url 2> /dev/null | python -m json.tool
fi

# face_recognition
if [ "${service}" == 'all' -o "${service}" == 'face_expression' ]; then
    url="$server/face_expression"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "filename=@../data/cropped_face.jpg" \
        $url 2> /dev/null | python -m json.tool
fi

# human_detection
if [ "${service}" == 'all' -o "${service}" == 'human_detection' ]; then
    url="$server/human_detection"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "filename=@../data/human.jpg" \
        $url 2> /dev/null | python -m json.tool
fi

# object_recognition
if [ "${service}" == 'all' -o "${service}" == 'object_recognition' ]; then
    url="$server/object_recognition"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "filename=@../data/cup.jpg" \
        $url 2> /dev/null | python -m json.tool
fi

# qr_recognition
if [ "${service}" == 'all' -o "${service}" == 'qr_recognition' ]; then
    url="$server/qr_recognition"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "filename=@../data/qr_code.jpg" \
        $url 2> /dev/null | python -m json.tool
fi

##################################################
# ORB                                            #
##################################################

# orb_add_model
if [ "${service}" == 'all' -o "${service}" == 'orb_add_model' ]; then
    url="$server/orb_add_model"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "filename=@../data/qr_code.jpg" \
        $url 2> /dev/null | python -m json.tool
fi

# orb_del_model
if [ "${service}" == 'all' -o "${service}" == 'orb_del_model' ]; then
    url="$server/orb_del_model"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "filename=@../data/qr_code.jpg" \
        $url 2> /dev/null | python -m json.tool
fi

# orb_query
if [ "${service}" == 'all' -o "${service}" == 'orb_query' ]; then
    url="$server/orb_query"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "filename=@../data/qr_code.jpg" \
        $url 2> /dev/null | python -m json.tool
fi

##################################################
# MOBILE ROBOTICS                                #
##################################################

# upload_slam_config_file
if [ "${service}" == 'all' -o "${service}" == 'upload_slam_config_file' ]; then
    url="$server/upload_slam_config_file"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "json=@../data/upload_icp_file.json" \
        $url 2> /dev/null | python -m json.tool
fi

# slam
if [ "${service}" == 'all' -o "${service}" == 'slam' ]; then
    url="$server/slam"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "json=@../data/laser.json" \
        $url 2> /dev/null | python -m json.tool
fi

# get_map
if [ "${service}" == 'all' -o "${service}" == 'get_map' ]; then
    url="$server/get_map"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F 'json={"map_name": "map"}' \
        $url 2> /dev/null | python -m json.tool > tmp

        cat tmp
        echo 'data:image/png;base64,' > image.b64
        grep image tmp | cut -d '"' -f 4 >> image.b64
        convert inline:image.b64 map.png
        rm image.b64 tmp
fi

# delete_map
if [ "${service}" == 'all' -o "${service}" == 'delete_map' ]; then
    url="$server/delete_map"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F 'json={"name": "map"}' \
        $url 2> /dev/null | python -m json.tool > tmp
fi

# path_planning
if [ "${service}" == 'all' -o "${service}" == 'path_planning' ]; then
    url="$server/path_planning"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F "json=@../data/path.json" \
        $url 2> /dev/null | python -m json.tool
fi

##################################################
# DIALOGUE SYSTEM                                #
##################################################

# chat
if [ "${service}" == 'all' -o "${service}" == 'chat' ]; then
    url="$server/chat"
    echo $url
    curl \
        -H "User-Token: ${username}" \
        -H "Accept-Token: ${password}" \
        -F  'json={"state" : "hello", "filename" : ""}' \
        $url 2> /dev/null | python -m json.tool
fi

exit 0
