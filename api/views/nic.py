from rest_framework.viewsets import ModelViewSet

from api.serializers.nic import *


class NicViewSet(ModelViewSet):
    queryset = NIC.objects.all().order_by('id')
    serializer_class = NicSerializers


