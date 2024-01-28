

class Fila:

    c_fila = []

    def c_entrar(cls, nome):
        cls.c_fila.append(nome)

    def __init__(self):
        self.s_fila = []
    
    def s_entrar(self, nome):
        self.s_fila.append(nome)
