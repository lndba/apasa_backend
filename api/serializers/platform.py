from rest_framework import serializers
from api.models import *


class PlatformListSerializers(serializers.ModelSerializer):
    provider_name = serializers.CharField(source='provider.name', read_only=True)
    class Meta:
        model = PlatformInfo
        fields = "__all__"

