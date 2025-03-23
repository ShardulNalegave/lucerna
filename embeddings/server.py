
from flask import Flask, request
from embeddings.specter2_proximity import Specter2Proximity
from embeddings.specter2_ad_hoc_query import Specter2AdHocQuery

app = Flask("embeddings")
proximity_model = Specter2Proximity()
adhoc_query_model = Specter2AdHocQuery()

@app.route("/")
def index():
    return "Hello, World!"

@app.post("/generate/proximity")
def get_proximity_embedding():
    paper = request.get_json(silent=True)
    if paper == None:
        return {
            'message': 'Could not parse request body'
        }, 400

    if paper.get('title') == None or paper.get('abstract') == None:
        return {
            'message': 'Required fields "title" and/or "abstract" not present in request body'
        }, 400
    
    embedding = proximity_model.generate_embeddings(paper)
    return {
        'dims': len(embedding),
        'embedding': embedding,
    }

@app.post("/generate/adhoc_query")
def get_adhoc_query_embedding():
    query = request.get_json(silent=True)
    if query == None:
        return {
            'message': 'Could not parse request body'
        }, 400

    if query.get('query') == None:
        return {
            'message': 'Required field "query" not present in request body'
        }, 400
    
    query = query['query']
    embedding = adhoc_query_model.generate_embeddings(query)
    return {
        'dims': len(embedding),
        'embedding': embedding,
    }