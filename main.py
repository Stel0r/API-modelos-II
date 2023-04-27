from fastapi import FastAPI
from BD.conexionBD import Conexion
from pydantic import BaseModel

class Solicitud(BaseModel):
    correo:str
    password:str

app = FastAPI()

@app.post("/validate/")
async def root(solicitud:Solicitud):
    resultados = Conexion.ejecutarConsulta("SELECT * FROM \"Usuario\" WHERE \"Correo\"='"+solicitud.correo+"'")
    if(len(resultados) == 0):
        return{"message": "no se ha encontrado ninguna cuenta vinculada al correo provisto"}
    else:
        #hay que introducir la verificacion de contraseña
        if resultados[0][1] == solicitud.password:
            return {"message": "Validacion exitosa, Bienvenido!"}
        else:
            return {"message": "La contraseña es incorrecta, intentelo nuevamente"}



