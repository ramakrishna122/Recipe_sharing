# Store this code in 'app.py' file

from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import random


app = Flask(__name__)
app.secret_key = 'your secret key'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'recipe_sharing'

mysql = MySQL(app)

@app.route('/')
@app.route('/login', methods =['GET', 'POST'])
def login():
	print("Inside login")
	msg = ''
	if request.method == 'POST' :
		email = request.form['email']
		print("email",email)
		password = request.form['password']
		db = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		db.execute('SELECT * FROM users WHERE Email_Id = % s AND password = % s', (email, password, ))
		account = db.fetchone()
				
		print("account",account)
		if account:
			session['loggedin'] = True
			session['User_Id'] = account['User_Id']
			session['Email_Id'] = account['Email_Id']
			msg = 'Welcome !'+str(session['Email_Id'])
			return render_template('successful.html', msg = msg)
		else:
			msg = 'Incorrect username / password !'
		return render_template('successful.html', msg = msg)
	else:
		return render_template('login.html',msg = msg)
  

@app.route('/display')
def display():
	return render_template('recipe.html')

@app.route('/logout')
def logout():
	session.pop('loggedin', None)
	session.pop('User_Id', None)
	session.pop('Email_Id', None)
	return redirect(url_for('login'))

@app.route('/recipe',methods=['GET','POST'])
def recipe():
	msg=''
	if request.method == 'POST':
		
		recipename = request.form['recipename']
		recipedescription = request.form['recipedescription']
		recipeingredients = request.form['recipeingredients']
		numberofcalories= request.form['number_of_calories']
		print("1",numberofcalories)
		
		fatcontent=request.form['fat_content']
		print("fatcontent",fatcontent)
		protein =request.form['protein']
		print("1",recipedescription)
		print("1",recipeingredients)
		print("1",numberofcalories)
		print("1",protein)
		db = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		recipeid=random.sample(range(10, 99), 1)
		userid=session['User_Id']
		recipe_calorie_id = random.sample(range(10, 99), 1)
		print(userid)
		db.execute('INSERT INTO recipe VALUES (%s, %s, %s, %s, %s)', (recipeid,recipename,recipedescription,recipeingredients,userid, ))
		mysql.connection.commit()
		db.execute('INSERT INTO recipe_calorie VALUES (%s, %s, %s, %s, %s)', (recipe_calorie_id,numberofcalories,fatcontent,protein,recipeid, ))
		mysql.connection.commit()
		msg = 'You have successfully added recipe   !'
		return render_template('recipe.html', msg = msg)
		

@app.route('/recipefeed', methods =['GET', 'POST'])
def recipefeed():
	list_dict=list()
	db = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
	userid=session['User_Id']
	db.execute('SELECT * FROM recipe LIMIT 10')
	mysql.connection.commit()
	data = db.fetchall()
	print(data,type(data))
	for item in data:
		list_dict.append(item)
	return render_template('feed.html',msg=list_dict)
		

@app.route('/rating', methods =['GET', 'POST'])
def rating():
	return render_template('recipe.html')

@app.route('/rate', methods =['GET', 'POST'])
def rate():
	return render_template('rating.html')
		


@app.route('/register', methods =['GET', 'POST'])
def register():
	msg = ''
	print("inside register")
	if request.method == 'POST':
		firstname = request.form['firstname']
		lastname = request.form['lastname']
		email = request.form['email']
		phonenumber = request.form['phonenumber']
		password = request.form['password']
		db = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		print("curser",db)
		db.execute('SELECT * FROM users WHERE Email_Id = %s', (email, ))
		account = db.fetchone()
		if account:
			msg = 'Account already exists !'
		# elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
		# 	msg = 'Invalid email address !'
		# elif not re.match(r'[A-Za-z0-9]+', username):
		# 	msg = 'Username must contain only characters and numbers !'
		# elif not username or not password or not email:
		# 	msg = 'Please fill out the form !'
		else:
			userid = random.sample(range(10, 999), 1)
			roleid = random.sample(range(10, 999), 1)
			db.execute('INSERT INTO users VALUES (%s, %s, %s, %s, %s, %s)', (userid,firstname,lastname,phonenumber, email, password, ))
			mysql.connection.commit()
			db.execute('INSERT INTO role VALUES (%s, %s)', (roleid,userid, ))
			mysql.connection.commit()
			msg = 'You have successfully registered !'
		return render_template('register.html', msg = msg)

	elif request.method == 'GET':
		msg = 'Please fill out the form !'
		return render_template('register.html', msg = msg)

	