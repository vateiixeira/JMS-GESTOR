from rest_framework import serializers
from jms.core.models import Equipe, MotoPerfil, Cidade


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
    



