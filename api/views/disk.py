from rest_framework.viewsets import ModelViewSet

from api.serializers.disk import *


class DiskViewSet(ModelViewSet):
    queryset = Disk.objects.all().order_by('id')
    serializer_class = DiskSerializers