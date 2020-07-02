from django.db import models
from ..core.models import Cidade,MotoPerfil,REGIAO_CHOICE

class SazonalidadeModeloCidade(models.Model):
    modelo = models.ForeignKey(MotoPerfil, on_delete=models.CASCADE)
    cidade = models.ForeignKey(Cidade, on_delete=models.CASCADE)
    regiao = models.CharField('Região', choices=REGIAO_CHOICE, max_length=100)
    mes = models.IntegerField("Mês")
    percentual = models.FloatField("Porcentual")
    vl_total_anual = models.IntegerField("Valor total no ano")
    ano_base = models.IntegerField("Ano Base")

class SazonalidadeModeloVendedor(models.Model):
    modelo = models.ForeignKey(MotoPerfil, on_delete=models.CASCADE)
    vendedor_nome = models.CharField('Nome', max_length=250)
    vendedor_cpf = models.CharField('CPF', max_length=100)
    mes = models.IntegerField("Mês")
    percentual = models.FloatField("Porcentual")
    vl_total_anual = models.IntegerField("Valor total no ano")
    ano_base = models.IntegerField("Ano Base")

class FirstEtapa(models.Model):
    regiao = models.CharField('Região', choices=REGIAO_CHOICE, max_length=100)
    modelo = models.ForeignKey(MotoPerfil, on_delete=models.CASCADE)
    aplicado = models.IntegerField(null=True) 
    previsto = models.IntegerField(null=True) 
    ano = models.IntegerField(null=True) 
    jan = models.IntegerField(null=True) 
    fev = models.IntegerField(null=True) 
    mar = models.IntegerField(null=True) 
    abr = models.IntegerField(null=True) 
    mai = models.IntegerField(null=True) 
    jun = models.IntegerField(null=True) 
    jul = models.IntegerField(null=True) 
    ago = models.IntegerField(null=True) 
    sete = models.IntegerField(null=True) 
    out = models.IntegerField(null=True) 
    nov = models.IntegerField(null=True) 
    dez = models.IntegerField(null=True) 