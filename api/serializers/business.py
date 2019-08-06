from rest_framework import serializers
from api.models import *


class BusinessAllListSerializers(serializers.ModelSerializer):
    class Meta:
        model = Business
        fields = "__all__"
        extra_kwargs = {
            'contact': {'write_only': True},
            'administrator': {'write_only': True},
            'descriptions': {'write_only': True},
            'asset': {'write_only': True},
        }


class BusinessListSerializers(serializers.ModelSerializer):
    class Meta:
        model = Business
        fields = "__all__"
