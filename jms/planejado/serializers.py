from rest_framework import serializers
from .models import *

class SazonalidadeModeloCidadeSerializer(serializers.ModelSerializer):
    class Meta:
        model = SazonalidadeModeloCidade
        exclude = ['id']

class SazonalidadeModeloVendedorSerializer(serializers.ModelSerializer):
    class Meta:
        model = SazonalidadeModeloVendedor
        exclude = ['id']