from flask import Flask, jsonify
from flask_caching import Cache
from datetime import datetime
from flask import Flask, render_template
import os

app = Flask(__name__)

cache = Cache(app, config={
    "CACHE_TYPE": "SimpleCache",
    "CACHE_DEFAULT_TIMEOUT": os.getenv('LOCAL_CACHE_DEFAULT_TIMEOUT', 600)
})

cache = Cache(app)


@app.route("/estatico")
@cache.cached()
def estatico():
    print("Consultando banco...")

    return jsonify({
        "users": [
            {"id": 1, "name": "Desafio Devops 2026 - Rodrigo da Silva Cunha"},
        ]
    })

@app.route("/timer")
@cache.cached()
def timer():
    dt = datetime.datetime.now()
    print(now)
    return jsonify(now)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)