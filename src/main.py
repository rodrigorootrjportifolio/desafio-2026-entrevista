from flask import Flask, jsonify, render_template
from flask_caching import Cache
from datetime import datetime
from prometheus_flask_exporter import PrometheusMetrics
import os

app = Flask(__name__)
LOCAL_CACHE_DEFAULT_TIMEOUT = int(os.getenv("LOCAL_CACHE_DEFAULT_TIMEOUT", 600))

cache = Cache(app, config={
    "CACHE_TYPE": "SimpleCache",
    "CACHE_DEFAULT_TIMEOUT": LOCAL_CACHE_DEFAULT_TIMEOUT 
})
## PROM
metrics = PrometheusMetrics(app)

@app.route("/estatico")
@cache.cached()
def estatico():
    return jsonify({
        "users": [
            {"id": 1, "name": "Desafio Devops 2026 - Rodrigo da Silva Cunha"},
        ]
    })

@app.route("/timer")
@cache.cached(timeout=LOCAL_CACHE_DEFAULT_TIMEOUT)
def timer():
    dt = datetime.now().isoformat()
    return jsonify({
        "data":[{"data":dt}]
        })

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)