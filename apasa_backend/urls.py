from django.conf.urls import url,include
from django.contrib import admin
from api.views import login


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^api/(?P<version>[v1|v2]+)/', include('api.urls')),
    url(r'^login/$', login.LoginView.as_view()),
]
