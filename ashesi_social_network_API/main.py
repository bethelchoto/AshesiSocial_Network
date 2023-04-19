import json
import firebase_admin
from firebase_admin import credentials
from flask import Flask, request, jsonify
from firebase_admin import firestore
from flask import escape
import functions_framework

cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

@functions_framework.http
def ashesi_social_network_api(request):
    request_json = request.get_json(silent=True)
    request_args = request.args

    if request.method == 'POST' and request.path == '/profiles':
        return profile()

    elif request.method == 'GET' and request.path == '/profiles':
        profile_id = request_args['SID']
        return getProfile(profile_id)

    elif request.method == 'PUT' and request.path == '/profiles':
        # profile_id = record['SID']
        return updateProfile()
            
    return "Bad request"


#Profile Registration
def profile():
    try:
        record = json.loads(request.data)
        student_id = record.get('SID') # get SID from the request data
        record['SID'] = student_id
        stud_reg = db.collection('profiles').document(student_id)
        if stud_reg.get().exists:
            response = jsonify({'Error': 'Student Already Registered'})
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers["Content-Type"] = "application/json"
            return response, 409
        else:
            stud_reg.set(record)
            response = jsonify({'message': 'Student Successfully Registered'})
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers["Content-Type"] = "application/json"
        return response, 200

    except Exception as e:
        return jsonify({'Error': f'{e}'}), 500

#Get Profile
def getProfile(profile_id):
    try:
        get_profile = db.collection('profiles').document(profile_id)
        profile = get_profile.get()
        if profile.exists:
            response = jsonify(profile.to_dict())
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers["Content-Type"] = "application/json"
            return response, 200
        else:
            response =jsonify({'message:': f'Profile {profile_id} Not Available'})
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers["Content-Type"] = "application/json" 
        return response, 404

    except Exception as e:
        return jsonify({'Error': f'{e}'}), 500


#Update Profile
def updateProfile():
    try:
        record = request.get_json()
        profile_sid = record['SID']
        profile_ref = db.collection('profiles').where('SID', '==', profile_sid)
        query = profile_ref.get()

        if len(query) == 1:
            profile_doc = query[0]
            profile_doc.reference.update(record)
            response = jsonify({'message': 'Profile Updated Successfully'})
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers["Content-Type"] = "application/json"
            return response, 200

        elif len(query) > 1:
            response = jsonify({'error': 'Multiple profiles found with same Student id'})
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers["Content-Type"] = "application/json"
            return response, 409

        else:
            response = jsonify({'error': 'Profile not found'})
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers["Content-Type"] = "application/json"
            return response, 404

    except Exception as e:
        return jsonify({'Error': f'{e}'}), 500

