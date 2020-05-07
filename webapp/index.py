from flask import Flask,render_template, request, redirect
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:penguinie@mariadb-jobsearch.db-netwoork/Jobsearching'
db = SQLAlchemy(app)

@app.route("/database")
def datab():
   result = db.engine.execute("SELECT DATABASE()")
   names = [row[0] for row in result]
   return names[0]




@app.route("/")
def index():
   result = db.engine.execute("SELECT DISTINCT(PROFESSION_NAME) FROM Professions")
   accs = []

   for row in result:
       name = {}
       name["Accomodations"] = row[0]
       accs.append(name)

   return render_template("index.html", data=accs)





@app.route("/destinations", methods=["POST", "GET"])
def dest():

    #result = db.engine.execute("select * from DEST")

    if request.method == "GET":
        search = request.args.get('accomodations')
        result = db.engine.execute("SELECT Company_Name, Opening_Description, Profession_Name FROM Professions INNER JOIN Openings ON Professions.Profession_Id = Openings.Profession_Id INNER JOIN Offices O on Openings.Office_Id = O.Office_Id INNER JOIN Companies C on O.Company_Id = C.Company_Id WHERE Profession_Name = %s",search)

    else:
        result = db.engine.execute("select * from DEST")


    names = []

    for row in result:
        name = {}
        name["Dest_Name"] = row[0]
        name["Dest_Price"] = row[1]
        names.append(name)
    return render_template('show_d.html',customers=names)



@app.route("/destinations_two", methods=["POST", "GET"])
def dest_two():
    #result = db.engine.execute("select * from DIVECUST")
    if request.method == "GET":
        search = request.args.get('search')

        result = db.engine.execute("SELECT Person_Name FROM People INNER JOIN Positions P on People.Person_Id = P.Person_Id INNER JOIN Offices O on P.Office_Id = O.Office_Id INNER JOIN Companies C on O.Company_Id = C.Company_Id WHERE Company_Name = %s",search)
    else:
        result = db.engine.execute("select * from DEST")
    names = []

    for row in result:
        name = {}
        name["Cust_Name"] = row[0]
        #name["City"] = row[1]
        #name["State"] = row[4]
        names.append(name)

    return render_template('show_f.html',customers=names)









@app.route("/customers", methods=["POST", "GET"])
def customers():
    if request.method == "GET":
        search = request.args.get('accomodations')
        result = db.engine.execute("SELECT Profession_Name, ROUND(AVG(Positions.Salary)) FROM Positions INNER JOIN Professions P on Positions.Profession_Id = P.Profession_Id WHERE Profession_Name = %s",search)
    else:
        result = db.engine.execute("select * from DEST")


    names = []

    for row in result:
        name = {}
        name["Dest_Name"] = row[0]
        name["Dest_Price"] = row[1]
        names.append(name)
    return render_template('show_e.html',customers=names)

@app.route("/customers/<string:name>/")
def getMember(name):
   return render_template(
   'show_c.html',customer=name)

if __name__ == "__main__":
   app.run(host="0.0.0.0", debug=True)
