from rest_framework import serializers

from api.models import *


class ProviderAllSerializers(serializers.ModelSerializer):
    class Meta:
        model = ProviderInfo
        fields = ['id','name']


class ProviderSerializers(serializers.ModelSerializer):
    class Meta:
        model = ProviderInfo
        fields = "__all__"
