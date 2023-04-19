import json
import uuid
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()


@functions_framework.http
def electronic(request):

    request_json = request.get_json(silent=True)
    request_args = request.args

    if request.method == 'POST' and request.path == '/voters':
        return voter_registration()

    elif request.method == 'GET' and request.path == '/voters':
        id = request_args['id']
        return get_voter(id)

    elif request.method == 'DELETE' and request.path == '/voters':
        id = request_args['id']
        return delete_voter(id)

    elif request.method == 'PUT' and request.path == '/voters':
        return update_voters()

    elif request.method == 'POST' and request.path == '/elections':
        return election_registration()

    elif request.method == 'GET' and request.path == '/elections':
        id = request_args['eid']
        return get_election(id)

    elif request.method == 'PUT' and request.path == '/elections':
        return update_elections()

    elif request.method == 'DELETE' and request.path == '/elections':
        eid = request_args['eid']
        return delete_election(eid)

    elif request.method == 'PATCH' and request.path == '/elections/voting':
        return cast_vote()
    
    return "Bad request"


def voter_registration():

    record = json.loads(request.data)
    v_id = str(uuid.uuid4())
    record['id'] = v_id
    reg_voter = db.collection('voters').document(v_id)
    if reg_voter.get().exists:
        return jsonify({'Error': 'Already Registered Voter'}), 409
    else:
        reg_voter.set(record)
    return jsonify({'message': 'Voter Registered'}), 200


def get_voter(id):

    get_voter = db.collection('voters').document(id)
    voter = get_voter.get()
    if voter.exists:
        return jsonify(voter.to_dict())
    return jsonify({'error': 'Unregistered voter'}), 404

# Delete Voter
@app.route('/voters', methods=['DELETE'])
def delete_voter(id):

    del_voter = db.collection('voters').document(id)
    voter = del_voter.get()
    if voter.exists:
        del_voter.delete()
        return jsonify({'message:': f'Voter {id} removed successfully'}), 200
    return jsonify({'message:': f'Voter {id} not available'}), 404

# Update Voter 
@app.route('/voters', methods=['PUT'])
def update_voters():

    record = request.get_json()
    voter_id = record['id']
    docs = db.collection('voters').get()
    for doc in docs:
        if doc.id == voter_id:
            db.collection('voters').document(doc.id).update(record)
        return jsonify({'message:': 'Voter  updated successfully'}),200
    return jsonify({'error': 'Voter not found'}), 404
        

def election_registration():
    record = json.loads(request.data)
    e_id = str(uuid.uuid4())
    record['id'] = e_id
    reg_election = db.collection('elections').document(e_id)
    if reg_election.get().exists:
        return jsonify({'Error': 'Election exist'}, reg_election.get().to_dict()), 409
    else:
        reg_election.set(record)
    return jsonify({'message': 'Election Successfully Registered'}, reg_election.get().to_dict()), 200

# Get One Election
def get_election(id):

    request_json = request.get_json(silent=True)
    request_args = request.args
    election_id = request_args['id']
    get_election = db.collection('elections').document(e_id)
    election = get_election.get()
    if election.exists:
        return jsonify({'message': 'Successful'}, election.to_dict()), 200
    return jsonify({'error': f'Election {election_id} is not registered '}), 404

# Delete Election
def delete_election():

    request_json = request.get_json(silent=True)
    request_args = request.args
    election_id = request_args['id']
    del_election = db.collection('elections').document(election_id)
    election = del_election.get()
    if election.exists:
        del_election.delete()
        return jsonify({'message:': f'Election with ID {election_id} removed successfully'}), 200
    return jsonify({'message:': f'Election with ID {election_id} not available'}), 404

# Update election
def update_elections():
    record = request.get_json()
    election_id = record['id']
    docs = db.collection('elections').get()
    for doc in docs:
        if doc.id == election_id:
            db.collection('elections').document(doc.id).update(record)
        return jsonify({'message:': f'Election with ID {election_id} updated successfully'}),200
    return jsonify({'error': f'election id {election_id} not found'}), 404

#---------------------------Voting--------------------------------------------------------
def cast_vote():
    election_data = json.loads(request.data)
    # Get the voter ID from the request data
    voter_id = election_data['name']
    docs = db.collection('voters').get()

    found = False
    # Verify that the voter is registered for this election
    for doc in docs:
        print(doc.id)
        
        if doc.id == voter_id:
            found = True

    if not found:
        return jsonify({'error': 'You are not registered to vote in this election.'}), 400
    # election_req = db.collection('elections').get()
    election_req = [doc.to_dict() for doc in db.collection('elections').stream()]
    election_id = election_data['election_id']

    # Verify that the candidate is valid and on the ballot
    found = False
    for doc in election_req:
        if doc['id'] == election_id:
            found = True
    if not found:
        return jsonify({'error': 'Election not registered to vote in this election.'}), 400
    else:
        election_result = []
        for election_val in election_req:
            if election_val["id"] == election_id:
                for position in election_val['positions']:
                    if position["name"] in election_data["vote"]:
                        if election_data["name"] in position["voters"]:
                            return jsonify({'error': 'Already voted.'}), 400

                        pos = position["name"]
                        for cand in position['candidates']:

                            if cand["name"] == election_data["vote"][pos]:
                                cand['results'] = int(cand["results"]) + 1
                                position["voters"].append(election_data["name"]) 
            election_result.append(election_val)
            db.collection('elections').document(election_val['id']).update(election_val)
    return jsonify(election_result)

app.run(debug=True)
