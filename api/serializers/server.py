from rest_framework import serializers
from api.models import *


class ServerListSerializers(serializers.ModelSerializer):
    class Meta:
        model = Server
        fields = "__all__"



