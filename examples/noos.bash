#!/bin/bash

# setup
set -e
server='https://demo.noos.cloud:9001'
username=`head -n 1 "${HOME}/.noos_credentials"`
password=`tail -n 1 "${HOME}/.noos_credentials"`


###############################################################################
# COMPUTER VISION                                                             #
###############################################################################

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

# qr_recognition
url="$server/qr_recognition"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    -F "filename=@../data/qr_code.jpg" \
    $url 2> /dev/null | python -m json.tool

###############################################################################
# ORB                                                                         #
###############################################################################

# orb_add_model

# orb_del_model

# orb_query

###############################################################################
# MOBILE ROBOTICS                                                             #
###############################################################################

# upload_slam_config_file
url="$server/upload_slam_config_file"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    -F "json=@../data/upload_icp_file.json" \
    $url 2> /dev/null | python -m json.tool

# icp_slam_with_lidar
url="$server/slam"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    -F "json=@../data/laser.json" \
    $url 2> /dev/null | python -m json.tool

# create_map

# get_map

# path_planning
url="$server/path_planning"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    -F "json=@../data/path.json" \
    $url 2> /dev/null | python -m json.tool

###############################################################################
# DIALOGUE SYSTEM                                                             #
###############################################################################

# chat
url="$server/chat"
echo $url
curl \
    -H "User-Token: ${username}" \
    -H "Accept-Token: ${password}" \
    -F  'json={"state" : "hello", "filename" : ""}' \
    $url 2> /dev/null | python -m json.tool
