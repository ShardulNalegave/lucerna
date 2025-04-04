
import torch
import numpy as np
import soundfile as sf
from kokoro import KPipeline
from flask import Flask, request

app = Flask("tts")
pipeline = KPipeline(lang_code='a')

@app.post("/generate")
def generate_podcast():
    paper = request.get_json(silent=True)
    if paper == None:
        return {
            'message': 'Could not parse request body'
        }, 400

    if paper.get('transcript') == None:
        return {
            'message': 'Required field "transcript" not present in request body'
        }, 400

    audio_segments = []
    generator = pipeline(paper['transcript'], voice='af_heart')
    for gs, ps, audio in generator:
        audio_segments.append(audio)

    if audio_segments:
        combined_audio = np.concatenate(audio_segments)
        sf.write('paper.wav', combined_audio, 24000)
    else:
        return {'message': 'No audio generated'}, 500

    
    return {
        'done': True
    }
