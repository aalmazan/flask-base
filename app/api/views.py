from flask import Blueprint

api_blueprint = Blueprint("api", __name__)


@api_blueprint.route("/")
def home():
    return {"status": "OK"}
