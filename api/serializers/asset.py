from rest_framework import serializers
from api.models import *


class AssetListSerializers(serializers.ModelSerializer):
    device_status_info = serializers.SerializerMethodField(read_only=True)

    provider_id = serializers.CharField(source='provider.id',read_only=True)
    provider_name = serializers.CharField(source='provider.name',read_only=True)

    server_id = serializers.CharField(source='server.id',read_only=True)
    server_hostname = serializers.CharField(source='server.hostname',read_only=True)
    server_outside_ip = serializers.CharField(source='server.outside_ip',read_only=True)
    server_cpu_core = serializers.CharField(source='server.cpu_core',read_only=True)
    server_memory_size = serializers.CharField(source='server.memory_size',read_only=True)
    server_os = serializers.CharField(source='server.os',read_only=True)
    server_expire_date = serializers.CharField(source='server.expire_date',read_only=True)
    server_os_version = serializers.SerializerMethodField(read_only=True)
    nic_info = serializers.SerializerMethodField(read_only=True)
    disk_info = serializers.SerializerMethodField(read_only=True)

    def get_device_status_info(self,obj):
        return obj.get_device_status_display()

    def get_server_os_version(self,obj):
        return obj.server.os+" "+obj.server.os_version

    def get_nic_info(self,obj):
        temp = []
        for nic_list in obj.server.nic.all():
            temp.append({
                'id': nic_list.id,
            })
        return temp

    def get_disk_info(self,obj):
        temp = []
        for disk_list in obj.server.disk.all():
            temp.append({
                'id': disk_list.id,
            })
        return temp

    class Meta:
        model = Asset
        fields = "__all__"
        extra_kwargs = {
            'modle': {'write_only': True},
            'cabinet': {'write_only': True},
            'cabinet_order': {'write_only': True},
            'provider': {'write_only': True},
            'device_status': {'write_only': True},
        }


class AssetInfoSerializers(serializers.ModelSerializer):
    class Meta:
        model = Asset
        fields = "__all__"
    device_status_info = serializers.SerializerMethodField(read_only=True)

    provider_name = serializers.CharField(source='provider.name')
    provider_address = serializers.CharField(source='provider.address')
    provider_contact = serializers.CharField(source='provider.contact')
    provider_phone = serializers.CharField(source='provider.phone')

    server_hostname = serializers.CharField(source='server.hostname')
    server_outside_ip = serializers.CharField(source='server.outside_ip')
    server_manager_ip = serializers.CharField(source='server.manager_ip')
    server_cpu_core = serializers.CharField(source='server.cpu_core')
    server_cpu_model = serializers.CharField(source='server.cpu_model')
    server_memory_size = serializers.CharField(source='server.memory_size')
    server_swap_size = serializers.CharField(source='server.swap_size')
    server_os = serializers.CharField(source='server.os')
    server_os_version = serializers.CharField(source='server.os_version')
    server_os_type = serializers.CharField(source='server.os_type')
    server_kernel_version = serializers.CharField(source='server.kernel_version')
    server_expire_date = serializers.CharField(source='server.expire_date')
    server_descriptions = serializers.CharField(source='server.descriptions')

    nic_info = serializers.SerializerMethodField(read_only=True)
    disk_info = serializers.SerializerMethodField(read_only=True)

    def get_device_status_info(self,obj):
        return obj.get_device_status_display()

    def get_nic_info(self,obj):
        temp = []
        for nic_list in obj.server.nic.all():
            temp.append({
                'id': nic_list.id,
                'name': nic_list.name,
                'ipaddr': nic_list.ipaddr,
                'netmask': nic_list.netmask,
                'hwaddr': nic_list.hwaddr,
                'speed': nic_list.speed,
                'bandwidth': nic_list.bandwidth,
            })
        return temp

    def get_disk_info(self,obj):
        temp = []
        for disk_list in obj.server.disk.all():
            temp.append({
                'id': disk_list.id,
                'name': disk_list.name,
                'size': disk_list.size,

            })
        return temp


class AssetUpdataSerializers(serializers.ModelSerializer):
    class Meta:
        model = Asset
        fields = "__all__"