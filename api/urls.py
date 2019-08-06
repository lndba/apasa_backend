from django.conf.urls import url
from api.views import asset
from api.views import providerinfo
from api.views import server
from api.views import disk
from api.views import nic
from api.views import application
from api.views import business
from api.views import domain
from api.views import platform
from api.views import userinfo
from api.views import dashboard


urlpatterns = [
    url(r'^assets/$', asset.AssetListViewSet.as_view({'get': 'list'})),
    url(r'^assets/(?P<pk>\d+)/$', asset.AssetInfoViewSet.as_view({'get': 'retrieve', 'put': 'update', 'patch': 'partial_update', 'delete': 'destroy'})),

    url(r'^asset_updata/$', asset.AssetUpdataViewSet.as_view({'get': 'list', 'post': 'create'})),
    url(r'^asset_updata/(?P<pk>\d+)/$', asset.AssetUpdataViewSet.as_view({'get': 'retrieve', 'put': 'update', 'patch': 'partial_update', 'delete': 'destroy'})),

    url(r'^servers/$', server.ServerListViewSet.as_view({'get': 'list', 'post': 'create'})),
    url(r'^servers/(?P<pk>\d+)/$', server.ServerListViewSet.as_view({'get': 'retrieve', 'put': 'update', 'patch': 'partial_update', 'delete': 'destroy'})),

    url(r'^disks/$', disk.DiskViewSet.as_view({'get': 'list', 'post': 'create'})),
    url(r'^disks/(?P<pk>\d+)/$', disk.DiskViewSet.as_view({'get': 'retrieve', 'put': 'update', 'patch': 'partial_update', 'delete': 'destroy'})),

    url(r'^providers_all/$', providerinfo.ProviderAllViewSet.as_view({'get': 'list'})),
    url(r'^providers/$', providerinfo.ProviderViewSet.as_view({'get': 'list', 'post': 'create'})),
    url(r'^providers/(?P<pk>\d+)/$', providerinfo.ProviderViewSet.as_view({'get': 'retrieve', 'put': 'update', 'patch': 'partial_update', 'delete': 'destroy'})),

    url(r'^nics/$', nic.NicViewSet.as_view({'get': 'list', 'post': 'create'})),
    url(r'^nics/(?P<pk>\d+)/$', nic.NicViewSet.as_view({'get': 'retrieve', 'put': 'update', 'patch': 'partial_update', 'delete': 'destroy'})),

    url(r'^apps/$', application.AppListViewSet.as_view({'get': 'list', 'post': 'create'})),
    url(r'^apps/(?P<pk>\d+)/$', application.AppListViewSet.as_view({'get': 'retrieve', 'put': 'update', 'patch': 'partial_update', 'delete': 'destroy'})),

    url(r'^business_all/$', business.BusinessAllListViewSet.as_view({'get': 'list'})),
    url(r'^business/$', business.BusinessListViewSet.as_view({'get': 'list', 'post': 'create'})),
    url(r'^business/(?P<pk>\d+)/$', business.BusinessListViewSet.as_view({'get': 'retrieve', 'put': 'update', 'patch': 'partial_update', 'delete': 'destroy'})),

    url(r'^domain/$', domain.MDomainListViewSet.as_view({'get': 'list', 'post': 'create'})),
    url(r'^domain/(?P<pk>\d+)/$', domain.MDomainListViewSet.as_view({'get': 'retrieve', 'put': 'update', 'patch': 'partial_update', 'delete': 'destroy'})),

    url(r'^dns/$', domain.DnsListViewSet.as_view({'get': 'list'})),
    url(r'^dns_updata/$', domain.DnsUpdataViewSet.as_view({'get': 'list', 'post': 'create'})),
    url(r'^dns_updata/(?P<pk>\d+)/$', domain.DnsUpdataViewSet.as_view({'get': 'retrieve', 'put': 'update', 'patch': 'partial_update', 'delete': 'destroy'})),

    url(r'^platform/$', platform.PlatformListViewSet.as_view({'get': 'list', 'post': 'create'})),
    url(r'^platform/(?P<pk>\d+)/$', platform.PlatformListViewSet.as_view({'get': 'retrieve', 'put': 'update', 'patch': 'partial_update', 'delete': 'destroy'})),

    url(r'^users/$', userinfo.UserInfoListViewSet.as_view({'get': 'list'})),
    url(r'^user_create/$', userinfo.UserInfoCreateViewSet.as_view()),
    url(r'^user_setpwd/$', userinfo.UserInfoSetPwdViewSet.as_view()),
    url(r'^users/(?P<pk>\d+)/$', userinfo.UserInfoListViewSet.as_view({'get': 'retrieve', 'put': 'update', 'patch': 'partial_update', 'delete': 'destroy'})),

    url(r'^server_data/$', dashboard.ServerData.as_view()),
    url(r'^domain_data/$', dashboard.DomainData.as_view()),
]

