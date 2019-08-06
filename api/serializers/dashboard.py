from rest_framework import serializers
from api.models import *


class ServerDataSerializers(serializers.ModelSerializer):
    count = serializers.SerializerMethodField(read_only=True)
    class Meta:
        model = ProviderInfo
        fields = "__all__"

