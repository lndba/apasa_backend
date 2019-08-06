from rest_framework import serializers
from api.models import *


class AppListSerializers(serializers.ModelSerializer):
    business_name = serializers.CharField(source='business.name', read_only=True)
    class Meta:
        model = ApplicationInfo
        fields = "__all__"