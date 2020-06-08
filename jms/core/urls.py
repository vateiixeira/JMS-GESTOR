from django.contrib import admin
from django.urls import path
from .views import *
from django.conf import settings
from django.conf.urls.static import static

app_name = 'core'

urlpatterns = [
    path('admin/', admin.site.urls, name='admin'),
    path('404', not_found, name='404'),
    path('cria_usuario', cria_usuarios, name='cria_usuario'),
    path('cria_cidade', cria_cidade, name='cria_cidade'),
    path('import/moto', import_moto, name='import_moto'),
    path('sync/moto', sync_moto, name='sync_moto'),
    path('sync/moto/completo', upload_moto_total, name='upload_moto_total'),
    path('import/cota', import_cota, name='import_cota'),
    path('gerente/<int:id>', gerente, name='gerente'),
    path('porcentagem_2019', porcentagem_2019, name='porcentagem_2019'),
    path('porcentagem_2019_tudo', porcentagem_2019_tudo, name='porcentagem_2019'),
    path('demonstrativo/produto', demonstrativo_produto, name='demonstrativo_produto'),
    path('atualiza/cidade/cota', atualiza_cidade_cota, name='atualiza_cidade_cota'),
    path('atualiza/cidade/moto', atualiza_cidade_moto, name='atualiza_cidade_moto'),
    path('atualiza/cidade/cota/outros', atualiza_cidade_cota_outro, name='atualiza_cidade_cota_outro')
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
