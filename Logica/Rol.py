from BD.conexionBD import Conexion


class Rol:
  def __init__(self,nombre):
    self.nombre = nombre
    self.permisos = []

  @staticmethod
  def inicializarRoles():
    resultado = Conexion.ejecutarConsulta("xd")