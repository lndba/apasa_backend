from rest_framework import serializers
from api.models import *


class NicSerializers(serializers.ModelSerializer):
    class Meta:
        model = NIC
        fields = "__all__"
