from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('', include('jms.core.urls')),
    path('account/', include('jms.account.urls')),
    path('admin/', admin.site.urls),
    path('api/', include('jms.api.urls')),
]
