from rest_framework.viewsets import ModelViewSet

from api.serializers.provider import *
from api.pagination.page import MyPageNumberPagination


class ProviderAllViewSet(ModelViewSet):
    queryset = ProviderInfo.objects.all().order_by('id')
    serializer_class = ProviderAllSerializers


class ProviderViewSet(ModelViewSet):
    queryset = ProviderInfo.objects.all().order_by('id')
    pagination_class = MyPageNumberPagination
    serializer_class = ProviderSerializers