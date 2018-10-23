#!/bin/bash

# setup
set -e
server='https://demo.noos.cloud:9001'
username=`head -n 1 "${HOME}/.noos_credentials"`
password=`tail -n 1 "${HOME}/.noos_credentials"`

# available services
url="$server/available_services"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    $url 2> /dev/null | python -m json.tool

# face_detection
url="$server/face_detection"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    -F "filename=@../data/face.jpg" \
    $url 2> /dev/null | python -m json.tool

# gender_detection
url="$server/gender_detection"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    -F "filename=@../data/cropped_face.jpg" \
    $url 2> /dev/null | python -m json.tool

# age_detection
url="$server/age_detection"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    -F "filename=@../data/face.jpg" \
    $url 2> /dev/null | python -m json.tool

# face_expression
url="$server/face_expression"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    -F "filename=@../data/cropped_face.jpg" \
    $url 2> /dev/null | python -m json.tool

# face_recognition
url="$server/face_expression"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    -F "filename=@../data/cropped_face.jpg" \
    $url 2> /dev/null | python -m json.tool

# human_detection
url="$server/human_detection"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    -F "filename=@../data/human.jpg" \
    $url 2> /dev/null | python -m json.tool

# object_recognition
url="$server/object_recognition"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    -F "filename=@../data/cup.jpg" \
    $url 2> /dev/null | python -m json.tool

# slam_with_lidar
# $curl -F "json=@laser.json" $server/slam

# create_map

# qr_recognition

# get_map

# orb_features

# path_planning

# nlp_dialog_systems

