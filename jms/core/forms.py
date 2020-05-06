from django import forms
from .models import *

class DocumentMotoForm(forms.ModelForm):
    class Meta:
        model = DocumentMoto
        fields = ('document',)

class DocumentCotaForm(forms.ModelForm):
    class Meta:
        model = DocumentCota
        fields = ('document',)

class CidadesForm(forms.ModelForm):
    nome = forms.ModelChoiceField(queryset=Cidade.objects.all().values_list('nome', flat=True).distinct())
    class Meta:
        model = Cidade
        fields = ('nome',)