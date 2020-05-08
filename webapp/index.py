from flask import Flask,render_template, request, redirect
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:mypass@mariadb-jobsearch.db-netwoork/Jobsearching'
db = SQLAlchemy(app)

@app.route("/database")
def datab():
   result = db.engine.execute("SELECT DATABASE()")
   names = [row[0] for row in result]
   return names[0]




@app.route("/")
def index():
   result = db.engine.execute("SELECT DISTINCT(PROFESSION_NAME) FROM Professions")
   names = []

   for row in result:
       name = {}
       name["menu"] = row[0]
       names.append(name)

   return render_template("index.html", data=names)



@app.route("/openings", methods=["POST", "GET"])
def openings():

    if request.method == "GET":
        search = request.args.get('opening')
        result = db.engine.execute("SELECT Company_Name, Opening_Description, Profession_Name FROM Professions INNER JOIN Openings ON Professions.Profession_Id = Openings.Profession_Id INNER JOIN Offices O on Openings.Office_Id = O.Office_Id INNER JOIN Companies C on O.Company_Id = C.Company_Id WHERE Profession_Name = %s",search)

    else:
        result = db.engine.execute("select * from Openings")


    names = []

    for row in result:
        name = {}
        name["Company_Name"] = row[0]
        name["Description"] = row[1]
        names.append(name)
    return render_template('show_d.html',data=names)


@app.route("/company", methods=["POST", "GET"])
def company():
    
    if request.method == "GET":
        search = request.args.get('search')

        result = db.engine.execute("SELECT Person_Name, Profession_Name FROM People INNER JOIN Positions P on People.Person_Id = P.Person_Id INNER JOIN Offices O on P.Office_Id = O.Office_Id INNER JOIN Companies C on O.Company_Id = C.Company_Id INNER JOIN Positions on People.Person_Id = Positions.Person_Id INNER JOIN Professions on Positions.Profession_Id = Professions.Profession_Id WHERE Company_Name = %s",search)
    else:
        result = db.engine.execute("select * from Positions")
    names = []

    for row in result:
        name = {}
        name["Person_Name"] = row[0]
        name["Profession_Name"] = row[1]
        names.append(name)

    return render_template('show_f.html',data=names)



@app.route("/salary", methods=["POST", "GET"])
def salary():
    if request.method == "GET":
        search = request.args.get('salary')
        result = db.engine.execute("SELECT Profession_Name, ROUND(AVG(Positions.Salary)) FROM Positions INNER JOIN Professions P on Positions.Profession_Id = P.Profession_Id WHERE Profession_Name = %s",search)
    else:
        result = db.engine.execute("select * from Positions")


    names = []

    for row in result:
        name = {}
        name["Profession_Type"] = row[0]
        name["Salary"] = row[1]
        names.append(name)
    return render_template('show_e.html',data=names)


if __name__ == "__main__":
   app.run(host="0.0.0.0", debug=True)
