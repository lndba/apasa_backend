from rest_framework.viewsets import ModelViewSet

from api.serializers.server import *


class ServerListViewSet(ModelViewSet):
    queryset = Server.objects.all().order_by('id')
    serializer_class = ServerListSerializers



