import psycopg2

class Conexion:
    @staticmethod
    def ejecutarConsulta(query):
        #inicializar conexion
        conn = psycopg2.connect("dbname=baseUsuarios user=postgres password=basedatos")
        cur = conn.cursor()
        cur.execute(query)
        records = cur.fetchall()
        #cerrar la conexion como buena practica
        conn.close()
        return records
    
    def insertarPersona(query,argumentos):
        #inicializar conexion
        conn = psycopg2.connect("dbname=baseUsuarios user=postgres password=basedatos")
        cur = conn.cursor()
        cur.execute(query,argumentos)
        records = cur.fetchall()
        #cerrar la conexion como buena practica
        conn.commit()
        conn.close()
        return records
    
    def insertarUsuario(query,argumentos):
        #inicializar conexion
        conn = psycopg2.connect("dbname=baseUsuarios user=postgres password=basedatos")
        cur = conn.cursor()
        cur.execute(query,argumentos)
        #cerrar la conexion como buena practica
        conn.commit()
        conn.close()