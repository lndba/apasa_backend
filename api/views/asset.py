from rest_framework.viewsets import ModelViewSet

from api.models import *
from api.serializers.asset import *
from api.pagination.page import MyPageNumberPagination


class AssetListViewSet(ModelViewSet):
    queryset = Asset.objects.all().order_by('id')
    pagination_class = MyPageNumberPagination
    serializer_class = AssetListSerializers


class AssetInfoViewSet(ModelViewSet):
    queryset = Asset.objects.all().order_by('id')
    serializer_class = AssetInfoSerializers


class AssetUpdataViewSet(ModelViewSet):
    queryset = Asset.objects.all().order_by('id')
    serializer_class = AssetUpdataSerializers



