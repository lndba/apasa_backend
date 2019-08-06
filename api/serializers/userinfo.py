from rest_framework import serializers
from api.models import *


class UserInfoListSerializers(serializers.ModelSerializer):
    class Meta:
        model = UserInfo
        fields = ['id','username','email']


class UserSerializers(serializers.ModelSerializer):
    class Meta:
        model = UserInfo
        fields = "__all__"