from django.contrib import admin
from django.urls import path
from .views import import_moto, import_cota, gerente, not_found

app_name = 'core'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('404', not_found, name='404'),
    path('import/moto', import_moto, name='import_moto'),
    path('import/cota', import_cota, name='import_cota'),
    path('gerente/<int:id>', gerente, name='gerente'),
]
