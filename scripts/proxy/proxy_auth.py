#!/usr/bin/python
import os, sys,re,MySQLdb




def authenticate(u,p):
    # Establich a connection
    
   
    db = MySQLdb.connection(host="localhost",
    user="xxx",
    passwd="xxx",
    db="xxx")
    

    result = 0
    
    # Run a MySQL query from Python and get the result set
    query="""SELECT squid_user, squid_pass FROM surfwijzer_users WHERE squid_enabled='1' AND squid_user='"""+u+"""' AND squid_pass='"""+p+"""'"""
    db.query(query)
    r = db.store_result()
    
    # Iterate through the result set
    # Example calls back up to 100 rows
    result=0
    for row in r.fetch_row(1):
        #print row[0]
        #print row[1]
        #print row[2]
    	 if row[1]==p:
            result=1
    
    
    return result

    

LINE_PAT = re.compile("(.*) (.*)\n")

u = sys.stdin.readline()
while u:
    m = LINE_PAT.match(u)
    if m:
        (user,pw) = m.groups()
        if authenticate(user,pw)==1:
            print "OK"
        else:
            print "ERR"
    else:
        print "ERR"
    #print u
    sys.stdout.flush()
    u = sys.stdin.readline()

sys.exit(0)
