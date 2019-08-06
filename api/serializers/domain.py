from rest_framework import serializers
from api.models import *


class MDomainListSerializers(serializers.ModelSerializer):
    class Meta:
        model = MasterDomainName
        fields = "__all__"


class DnsListSerializers(serializers.ModelSerializer):
    business_name = serializers.CharField(source='business.name',read_only=True)
    class Meta:
        model = Dns
        fields = "__all__"


class DnsUpdataSerializers(serializers.ModelSerializer):
    class Meta:
        model = Dns
        fields = "__all__"