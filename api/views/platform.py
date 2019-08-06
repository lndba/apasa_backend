from rest_framework.viewsets import ModelViewSet

from api.serializers.platform import *
from api.pagination.page import MyPageNumberPagination


class PlatformListViewSet(ModelViewSet):
    queryset = PlatformInfo.objects.all().order_by('id')
    pagination_class = MyPageNumberPagination
    serializer_class = PlatformListSerializers


