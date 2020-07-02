from rest_framework import serializers
from jms.core.models import *


class EquipeSerializer(serializers.ModelSerializer):
    user  = serializers.CharField(source='user.username', read_only=True)
    cidade  = serializers.CharField(source='cidade.nome', read_only=True)
    avatar  = serializers.CharField(source='perfil.avatar.url', read_only=True)

    class Meta:
        model = Equipe
        fields = '__all__'

class MotoSerializer(serializers.ModelSerializer):
    class Meta:
        model = MotoPerfil
        fields = '__all__'

class CidadeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cidade
        fields = '__all__'

class SazonalidadeModeloSerializer(serializers.ModelSerializer):
    modelo = serializers.StringRelatedField()
    class Meta:
        model = SazonalidadeModelo
        exclude = ['id']

class SazonalidadeVendedorSerializer(serializers.ModelSerializer):
    class Meta:
        model = SazonalidadeVendedor
        exclude = ['id']

class SazonalidadeCidadeSerializer(serializers.ModelSerializer):
    class Meta:
        model = SazonalidadeCidade
        exclude = ['id']

class SazonalidadeRegiaoSerializer(serializers.ModelSerializer):
    class Meta:
        model = SazonalidadeRegiao
        exclude = ['id']
    




