from django.contrib import admin
from django.urls import path
from .views import *
from django.conf import settings
from django.conf.urls.static import static

app_name = 'core'

urlpatterns = [
    path('admin/', admin.site.urls, name='admin'),
    path('404', not_found, name='404'),
    path('import/moto', import_moto, name='import_moto'),
    path('sync/moto', sync_moto, name='sync_moto'),
    path('sync/moto/completo', upload_moto_total, name='upload_moto_total'),
    path('import/cota', import_cota, name='import_cota'),
    path('gerente/<int:id>', gerente, name='gerente'),
    path('porcentagem_2019', porcentagem_2019, name='porcentagem_2019'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
