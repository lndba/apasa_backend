from rest_framework import serializers
from api.models import *


class DiskSerializers(serializers.ModelSerializer):
    class Meta:
        model = Disk
        fields = "__all__"
