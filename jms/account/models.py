from django.db import models
from django.contrib.auth.models import User
from cloudinary.models import CloudinaryField

CARGOS_CHOICE = (
    ('VENDEDOR','VENDEDOR',),
    ('GERENTE','GERENTE',),
    ('SUPERVISOR','SUPERVISOR',),
)

REGIAO_CHOICE = (
    ('JNB','JNB',),
    ('SFC','SFC',),
    ('JNR','JNR',),
)

class Perfil(models.Model):
    cargo = models.CharField(choices=CARGOS_CHOICE, max_length=100)
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    regiao = models.CharField(choices=REGIAO_CHOICE, max_length=100)
    avatar = CloudinaryField('avatar', null=True)

    class Meta:
        verbose_name = "Perfil"
        verbose_name_plural = "Perfis"
    
    def __str__(self):
        return str(self.usuario)


class PlanejadoUser(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    planejado        = models.DecimalField('Planjeado',decimal_places=2, max_digits=7)    
    planejado_moto   = models.IntegerField('Planjeado Moto')    
    planejado_cota   = models.IntegerField('Planjeado cota')    
    planejado_visita = models.IntegerField('Realizado visita')    

