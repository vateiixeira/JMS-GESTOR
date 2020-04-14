from datetime import datetime

def get_data_final_mes():
    mes = datetime.now().month
    ano = datetime.now().year
    tamanho = monthrange(ano, mes)
    dia = tamanho[1]
    return dia,mes,ano

def get_mes_ano():
    mes = datetime.now().month
    ano = datetime.now().year
    return mes,ano
