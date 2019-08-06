from rest_framework.viewsets import ModelViewSet

from api.serializers.application import *
from api.pagination.page import MyPageNumberPagination


class AppListViewSet(ModelViewSet):
    queryset = ApplicationInfo.objects.all().order_by('id')
    pagination_class = MyPageNumberPagination
    serializer_class = AppListSerializers



