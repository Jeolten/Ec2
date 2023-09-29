import os
import flask
from flask import jsonify, request, Flask
from flask_healthz import healthz, HealthError
import pymysql as MySQLdb

application = flask.Flask(__name__)
application.register_blueprint(healthz, url_prefix="/healthz")
application.config.update(HEALTHZ = {"live": "application.liveness", 
"ready": "application.readiness"})
application.debug = True

def liveness():
  return "<p>OK</p>"

def readiness():
  return "<p>OK</p>"

@application.route('/')
def funfact():
  return "1st Week Assignment"

@application.route("/create", methods=["POST"])
class Create():
  def user_create():
    connection = MySQLdb.connect(
      user   = os.getenv('MYSQL_USERNAME'),
      passwd = os.getenv('MYSQL_PASSWORD'),
      db     = os.getenv('MYSQL_INSTANCE_NAME'),
      host   = os.getenv('MYSQL_PORT_3306_TCP_ADDR'),
      port   = int(os.getenv('MYSQL_PORT_3306_TCP_PORT'))
    )
    username = request.json["username"]
    password = request.json["password"]
    cursor = connection.db.cursor(MySQLdb.cursors.DictCursor)
    sql = 'INSERT INTO app (username, password) VALUES (%s,%s)'
    if request.method == "POST":
      data = (username, password)
      try:
        cursor.execute(sql, data)
        connection.commit()
        cursor.close()
        connection.close()
      except Exception as exception:
        return jsonify(str(exception))
    else:
      return jsonify(str(data))

if __name__ == "__main__":
  application.run(host='0.0.0.0', port=3000)

