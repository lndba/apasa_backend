from rest_framework.viewsets import ModelViewSet

from api.serializers.business import *
from api.pagination.page import MyPageNumberPagination


class BusinessAllListViewSet(ModelViewSet):
    queryset = Business.objects.all().order_by('id')
    serializer_class = BusinessAllListSerializers


class BusinessListViewSet(ModelViewSet):
    queryset = Business.objects.all().order_by('id')
    pagination_class = MyPageNumberPagination
    serializer_class = BusinessListSerializers


