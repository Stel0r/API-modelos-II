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
        return{"message": "no se ha encontrado ninguna cuenta vinculada al correo provisto"}
    else:
        #hay que introducir la verificacion de contraseña
        if resultados[0][1] == solicitud.password:
            return {"message": "Validacion exitosa, Bienvenido!"}
        else:
            return {"message": "La contraseña es incorrecta, intentelo nuevamente"}


@app.post("/register/")
async def root(registro:RegistroUsuario):
    consulta = "INSERT INTO public.\"Persona\"(\"Nombre\", \"Apellido\", \"Documento\", \"Direccion\") VALUES (%s, %s, %s, %s) RETURNING \"idPersona\";"
    arg = (registro.nombre,registro.apellido,registro.documento,registro.direccion)
    resultados = Conexion.insertarPersona(consulta,arg)
    
    if(len(resultados) == 0):
        return{"message": "no se ha encontrado ninguna cuenta vinculada al correo provisto"}
    else:
        print(resultados)
        consulta = "INSERT INTO public.\"Usuario\"(\"Correo\", \"Contraseña\", \"idPersona\", \"idRol\") VALUES (%s, %s, %s, %s) ;"
        arg = (registro.correo,registro.password,resultados[0][0],2)
        Conexion.insertarUsuario(consulta,arg)
