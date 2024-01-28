

class Pizza:

    pedacos = 8
    
    def __init__(self):
        self.sabor = "Mussarela"

    def pegar_pedaco(self):
        self.pedacos = self.pedacos - 1

    @classmethod
    def mudar_tamanho(cls, tamanho):
        cls.pedacos = tamanho