import bottle
from bottle import  route, run, template, get, post, debug, static_file, request, redirect, response,error
import sqlite3

bottle.TEMPLATE_PATH.insert(0,'views')
app = bottle.default_app()
bottle.BaseTemplate.defaults['get_url'] = app.get_url
 

@app.route('/static/:path#.+#', name='static')
def static(path):
    return static_file(path, root='./static')


@app.route('')
@app.route('/')
def home():
    return template('index.tpl')

@app.route('/makeReport')
def get_data():
    conn =  sqlite3.connect('data.db')
    c = conn.cursor()
    c.execute("SELECT Platform FROM database WHERE Firm ='Nintendo'" )
    nintendo = c.fetchall()
    nintendo=[j[0] for j in nintendo]

    c.execute("SELECT Platform FROM database WHERE Firm ='Microsoft'" )
    microsoft = c.fetchall()
    microsoft=[j[0] for j in microsoft]

    c.execute("SELECT Platform FROM database WHERE Firm ='Sony'" )
    sony = c.fetchall()
    sony=[j[0] for j in sony]

    c.close()
    return template('makeReport', nintendo = nintendo, microsoft=microsoft, sony= sony)

@app.route('/createTable')
@app.route('/createTable/')
@app.route('/createTable', method ="POST")
@app.route('/createTable/', method ="POST")
def create_table():
    if request.POST.findData:
        list_table = request.POST.getlist('checksBox')
        conn =  sqlite3.connect('data.db')
        c = conn.cursor()
        c.execute(f"SELECT Firm, Platform, `Sale in million` FROM database WHERE Platform IN  ({','.join('?' for _ in list_table)}) ORDER BY Firm", (list_table))
        result = c.fetchall()
        c.execute(f"SELECT DISTINCT Firm FROM database WHERE Platform IN  ({','.join('?' for _ in list_table)}) ORDER BY Firm", (list_table))
        result2 = c.fetchall()
        firms=[j[0] for j in result2]
        c.execute(
            f'''
            WITH ds AS (SELECT Firm, Platform, `Sale in million` FROM database WHERE Platform IN  ({','.join('?' for _ in list_table)}) ORDER BY Firm)
            SELECT a.Firm, `Total Sale`, `Best selling platform`,`Best selling sales`
            FROM (
            (SELECT Firm, ROUND(SUM(`Sale in million`)) AS `Total Sale` FROM ds GROUP BY Firm) AS a
            JOIN
            (SELECT Firm, Platform AS `Best selling platform`, MAX(`Sale in million`) AS `Best selling sales` FROM ds GROUP BY Firm) AS b
            ON a.Firm=b.Firm)
            ''', (list_table))

        total = c.fetchall()
        c.close()
        output = template('createTable', rows= result, firms=firms, total=total)
        return output 
    
    
    elif request.POST.showAll:
        conn =  sqlite3.connect('data.db')
        c = conn.cursor()
        c.execute("SELECT Firm, Platform, `Sale in million` FROM database ORDER BY Firm" )
        result = c.fetchall()
        c.execute("SELECT DISTINCT Firm FROM database ORDER BY Firm")
        result2 = c.fetchall()
        firms = [j[0] for j in result2]
        c.execute('''
            SELECT a.Firm, `Total Sale`, `Best selling platform`,`Best selling sales` 
            FROM (
            (SELECT Firm, ROUND(SUM(`Sale in million`)) AS `Total Sale` FROM database GROUP BY Firm) AS a
            JOIN
            (SELECT Firm, Platform AS `Best selling platform`, MAX(`Sale in million`) AS `Best selling sales` FROM database GROUP BY Firm) AS b
            ON a.Firm=b.Firm)
            ''')
        total = c.fetchall()

        c.close()
        output = template('createTable', rows=result, firms=firms, total=total)
        return output 
    else:
        return template('createTable') 


@app.route('/modify')
@app.route('/modify',method= "POST")
def modify():
    if request.POST.insert:
        firm = request.POST.get('firm')
        platform = request.POST.platform.strip()
        sale = request.POST.get('sales', type= float)
        conn =  sqlite3.connect('data.db')
        c= conn.cursor()
        c.execute("INSERT INTO database (Firm, Platform, `Sale in million`) VALUES (?,?,?)", (firm, platform, sale))
        conn.commit()
        c.execute("SELECT Firm, Platform, `Sale in million` FROM database ORDER BY Firm" )
        result = c.fetchall()
        c.close()
        return template('modify', rows= result)
    elif request.POST.updateData:
        platform = request.POST.platform.strip()
        sale = request.POST.get('sales', type= float)
        conn =  sqlite3.connect('data.db')
        c= conn.cursor()
        c.execute("UPDATE database SET `Sale in million` = (?) WHERE Platform = (?)",(sale, platform))
        conn.commit()
        c.execute("SELECT Firm, Platform, `Sale in million` FROM database ORDER BY Firm" )
        result = c.fetchall()
        c.close()
        return template('modify', rows= result)
    elif request.POST.deleteData:
        list_delete = request.POST.getlist('checksBox')
        conn =  sqlite3.connect('data.db')
        c= conn.cursor()
        c.execute(f"DELETE FROM database WHERE Platform IN ({','.join('?' for _ in list_delete)})",(list_delete))
        conn.commit()
        c.execute("SELECT Firm, Platform, `Sale in million` FROM database ORDER BY Firm" )
        result = c.fetchall()
        c.close()
        return template('modify', rows= result)
    else:
        conn =  sqlite3.connect('data.db')
        c = conn.cursor()
        c.execute("SELECT Firm, Platform, `Sale in million` FROM database ORDER BY Firm" )
        result = c.fetchall()
        c.close()
        return template('modify', rows= result)  





@app.error(404)
@app.error(500)
def error(error):
    return template('error')


run(host='localhost', port=9999, debug=True, reloader=True)
