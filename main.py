from fastapi import FastAPI
from BD.conexionBD import Conexion
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

class Solicitud(BaseModel):
    correo:str
    password:str

class RegistroUsuario(BaseModel):
    correo:str
    password:str
    nombre:str
    apellido:str
    documento:str
    direccion:str
    




app = FastAPI()

origins = [
    "http://localhost:4200"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)



@app.post("/validate/")
async def root(solicitud:Solicitud):
    resultados = Conexion.ejecutarConsulta("SELECT * FROM \"Usuario\" WHERE \"Correo\"='"+solicitud.correo+"'")
    if(len(resultados) == 0):
        return{"message": "no se ha encontrado ninguna cuenta vinculada al correo provisto",
                    "codigo":404}
    else:
        #hay que introducir la verificacion de contraseña
        if resultados[0][1] == solicitud.password:
            return {"message": "Validacion exitosa, Bienvenido!",
                    "codigo":200}
    
        else:
            return {"message": "La contraseña es incorrecta, intentelo nuevamente",
                    "codigo":404}


@app.post("/register/")
async def root(registro:RegistroUsuario):

    resultados = Conexion.ejecutarConsulta("SELECT * FROM \"Usuario\" WHERE \"Correo\"='"+registro.correo+"'")
    if len(resultados) == 0:
        consulta = "INSERT INTO public.\"Persona\"(\"Nombre\", \"Apellido\", \"Documento\", \"Direccion\") VALUES (%s, %s, %s, %s) RETURNING \"idPersona\";"
        arg = (registro.nombre,registro.apellido,registro.documento,registro.direccion)
        resultados = Conexion.insertarPersona(consulta,arg)
        
        if(len(resultados) == 0):
            return{"message": "no se ha podido registrar al usuario",
                "codigo":404}
        else:
            consulta = "INSERT INTO public.\"Usuario\"(\"Correo\", \"Contraseña\", \"idPersona\", \"idRol\") VALUES (%s, %s, %s, %s) ;"
            arg = (registro.correo,registro.password,resultados[0][0],2)
            Conexion.insertarUsuario(consulta,arg)
            return{"message": "El usuario se ha registrado exitosamente",
                "codigo":200}
    else:
        return{"message": "Este Correo ya esta Registrado",
                "codigo":404}