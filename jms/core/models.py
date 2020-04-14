from django.db import models
from jms.account.models import REGIAO_CHOICE, Perfil
from django.contrib.auth.models import User


class PlanejadoRealizado(models.Model):
    planejado        = models.DecimalField('Planjeado',decimal_places=2, max_digits=7)    
    planejado_moto   = models.IntegerField('Planjeado Moto')    
    planejado_cota   = models.DecimalField('Planjeado cota',decimal_places=2, max_digits=7)    
    planejado_visita = models.IntegerField('Realizado visita')      
    cidade           = models.CharField('Cidade', max_length=50)
    regiao           = models.CharField('Regiao', max_length=50)
    mes              = models.IntegerField('Mes')
    ano              = models.IntegerField('Ano')

class Moto(models.Model):
    Empresa                 = models.CharField(max_length=30)
    Data                    = models.DateField()
    Nota_Fiscal             = models.IntegerField()
    Serie                   = models.IntegerField()
    Valor_da_Nota           = models.DecimalField(decimal_places=2, max_digits=7, default=0)
    Veiculo                 = models.CharField(max_length=100)
    Chassi                  = models.CharField(max_length=100)
    Forma_Pagamento         = models.CharField(max_length=100)
    Vendedor                = models.CharField(max_length=100)
    Cliente                 = models.CharField(max_length=100)
    Cpf_Cnpj_Cliente        = models.CharField(max_length=100)
    Novo                    = models.BooleanField()
    Quantidade              = models.IntegerField()
    Operacao_Interna        = models.CharField(max_length=100)
    Data_Compra             = models.DateField()
    Custo_Medio             = models.DecimalField(decimal_places=2, max_digits=7, default=0)
    Margem                  = models.DecimalField(decimal_places=2, max_digits=7, default=0)
    Margem_Porcentagem      = models.DecimalField(decimal_places=2, max_digits=7, default=0)
    Ano_Fab                 = models.IntegerField()
    Ano_Modelo              = models.IntegerField()
    Municipio               = models.CharField(max_length=100)
    Valor_Tabela            = models.DecimalField(decimal_places=2, max_digits=7, default=0)
    Emp_Funcionario         = models.CharField(max_length=100)
    Motivo_Devolucao        = models.CharField(max_length=250)
    Cor                     = models.CharField(max_length=100)
    Tipo                    = models.CharField(max_length=100)
    Telefone                = models.CharField(max_length=50)
    Celular                 = models.CharField(max_length=50)
    email                   = models.CharField(max_length=50)
    Placa                   = models.CharField(max_length=50)
    Despesa_Oficina         = models.DecimalField(decimal_places=2, max_digits=7, default=0)
    Despesa_Financeira      = models.DecimalField(decimal_places=2, max_digits=7, default=0)
    Valor_Venda_Gerencial   = models.DecimalField(decimal_places=2, max_digits=7, default=0)
    #Preço_PPS               = models.DecimalField(decimal_places=2, max_digits=7, default=0)
    Base_Comissao           = models.DecimalField(decimal_places=2, max_digits=7, default=0)
    Forma_Fabrica           = models.CharField(max_length=50)
    Sub_Forma_Fabrica       = models.CharField(max_length=50)
    Modalidade_Venda        = models.CharField(max_length=100)
    Grupo_Pessoa_Vendedor   = models.CharField(max_length=100)

class Cota(models.Model):
    Cpf_Vendedor            = models.CharField(max_length=100)
    Nome_Vendedor           = models.CharField(max_length=100)      
    Data_da_Venda           = models.DateField()      
    Prazo                   = models.IntegerField()
    Tipo_contrato           = models.CharField(max_length=100)            
    Modelo                  = models.CharField(max_length=100)      
    Status                  = models.CharField(max_length=100)
    Cliente                 = models.CharField(max_length=100)   
    Municipio               = models.CharField(max_length=100)  
    Telefone                = models.CharField(max_length=100, null=True)  
    Celular                 = models.CharField(max_length=100, null=True)  
    Ponto_de_Venda          = models.CharField(max_length=100, null=True)      
    Parcela                 = models.DecimalField(decimal_places=2, max_digits=7, default=0)  
    Data_de_Vencimento      = models.DateField()           
    Grupo                   = models.IntegerField()
    Cota                    = models.IntegerField()
    R                       = models.IntegerField() 
    D                       = models.IntegerField()
    Credito                 = models.IntegerField() 
    Data_da_Contemplacao    = models.DateField(null=True, blank=True)               
    Tipo_de_Contemplacao    = models.CharField(max_length=100, null=True)              
    Efetuou_Negociacao      = models.CharField(max_length=100, null=True)          
    Proposta                = models.IntegerField()  
    Digito_da_Proposta      = models.IntegerField()          
    Vl_total_amortizado     = models.DecimalField(decimal_places=2, max_digits=7, default=0)              
    Vl_Quitacao             = models.DecimalField(decimal_places=2, max_digits=7, default=0)      
    Plano                   = models.CharField(max_length=100, null=True)
    Porcentagem_Amortizado  = models.DecimalField(decimal_places=6, max_digits=8, default=0)              
    Porcentagem_Mensal      = models.DecimalField(decimal_places=6, max_digits=8, default=0)           
    Qtd_Parcelas            = models.IntegerField()      
    Seguro_de_Vida          = models.CharField(max_length=100, null=True)      

class Cidade(models.Model):
    nome = models.CharField('Cidade', max_length=100)
    regiao = models.CharField('Regiao', choices=REGIAO_CHOICE, max_length=100)

    class Meta:
        verbose_name = "Cidade"
        verbose_name_plural = "Cidades"
     
    def __str__(self):
        return str(self.nome)


class Equipe(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='usuario')
    perfil = models.ForeignKey(Perfil, on_delete=models.CASCADE)
    cidade = models.ForeignKey(Cidade, on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Equipe"
        verbose_name_plural = "Equipes"
    
    def __str__(self):
        return str(self.user)

class MotoPerfil(models.Model):
    nome = models.CharField('Nome', max_length=100)
    avatar = models.CharField('avatar', max_length=400)