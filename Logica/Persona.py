class Persona:
  def __init__(self, nombre, apellido,documento,direccion):
    self.nombre = nombre
    self.apellido = apellido
    self.documento = documento
    self.direccion = direccion
    self.roles = []

  def añadirRol(self,rol):
    self.roles.append(rol)
        