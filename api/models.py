from django.db import models
from django.contrib.auth.models import AbstractUser


class UserInfo(AbstractUser):
    """
    用户登录信息表
    """
    # id = models.AutoField(primary_key=True)
    telephone = models.CharField(max_length=11, null=True, unique=True)
    avatar = models.FileField(upload_to='avatar_dir/', default="/avatar/default.png")
    # create_time = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)

    def __str__(self):
        return self.username


class UserToken(models.Model):
    """
    用户token信息
    """
    user = models.OneToOneField("UserInfo")
    token = models.CharField(max_length=128)


class Asset(models.Model):
    """
    资产信息表
    """
    device_status_choices = (
        (0, '上架'),
        (1, '在线'),
        (2, '离线'),
        (3, '下架'),
    )
    modle = models.CharField(max_length=255, verbose_name='实例类型', null=True, blank=True)
    region = models.CharField(max_length=255, verbose_name='地域')
    device_status = models.SmallIntegerField(choices=device_status_choices, default=1, verbose_name='设备状态')
    cabinet = models.CharField(max_length=30, null=True, blank=True, verbose_name='机柜号')
    cabinet_order = models.CharField(max_length=30, null=True, blank=True, verbose_name='位置序号')

    # server = models.OneToOneField('Server', related_name='asset')
    # nic = models.ManyToManyField('NIC', related_name='nic',default=1)
    # disk = models.ManyToManyField('Disk', related_name='disk',default=1)
    # provider = models.ForeignKey('ProviderInfo', on_delete=models.PROTECT, related_name='provider')
    provider = models.ForeignKey('ProviderInfo', on_delete=models.CASCADE, related_name='asset')

    def __str__(self):
        return self.region


class Server(models.Model):
    """
    服务器信息表
    """
    asset = models.OneToOneField('Asset', on_delete=models.CASCADE, related_name='server')
    hostname = models.CharField(max_length=128, verbose_name='主机名')
    # port = models.IntegerField(verbose_name='端口')
    # password = models.CharField(max_length=128, verbose_name='超级密码',null=True,blank=True)
    outside_ip = models.GenericIPAddressField(verbose_name='外网IP')
    manager_ip = models.CharField(verbose_name='管理IP', max_length=64, blank=True, null=True)
    cpu_model = models.CharField(max_length=128, verbose_name='CPU型号')
    cpu_core = models.IntegerField(verbose_name='CPU核数')
    memory_size = models.CharField(max_length=10, verbose_name='内存')
    swap_size = models.CharField(max_length=10, verbose_name='swap', blank=True, null=True)
    os = models.CharField(max_length=20, verbose_name='操作系统')
    os_version = models.CharField(max_length=20, verbose_name='操作系统版本')
    os_type = models.CharField(max_length=10, verbose_name='操作系统类型')
    kernel_version = models.CharField(max_length=128, verbose_name='内核版本')
    descriptions = models.TextField(verbose_name='描述', blank=True, null=True)
    expire_date = models.DateField(verbose_name='到期时间', blank=True, null=True)

    # disk = models.ManyToManyField('Disk', verbose_name='磁盘信息')




    def __str__(self):
        return self.hostname


class NIC(models.Model):
    """
    网卡信息表
    """
    name = models.CharField(max_length=128, verbose_name='网卡名称')
    ipaddr = models.GenericIPAddressField(verbose_name='IP地址')
    netmask = models.CharField(max_length=64, null=True, blank=True, verbose_name='子网掩码')
    hwaddr = models.CharField(max_length=64, null=True, blank=True, verbose_name='mac地址')
    speed = models.CharField(max_length=20, null=True, blank=True, verbose_name='网卡速率')
    bandwidth = models.CharField(max_length=20, null=True, blank=True, verbose_name='带宽')
    server = models.ForeignKey('Server', on_delete=models.CASCADE, related_name='nic')

    def __str__(self):
        return self.name


class Disk(models.Model):
    """
    硬盘信息表
    """
    name = models.CharField(max_length=10, verbose_name='硬盘设备名称')
    size = models.CharField(max_length=20, verbose_name='硬盘容量')
    server = models.ForeignKey('Server', on_delete=models.CASCADE, related_name='disk')

    # disk_mount = models.ManyToManyField('DiskMount',related_name='disk_mount',verbose_name='磁盘挂载信息')


    def __str__(self):
        return self.name


class ProviderInfo(models.Model):
    """
    服务器提供商表
    """
    name = models.CharField(max_length=32, verbose_name='服务器提供商')
    address = models.CharField(max_length=512, verbose_name='地址')
    contact = models.CharField(max_length=10, verbose_name='联系人', null=True, blank=True)
    phone = models.CharField(max_length=11, verbose_name='联系人电话', null=True, blank=True)
    # api_addr = models.CharField(max_length=512, verbose_name='api地址', null=True, blank=True)
    # api_user = models.CharField(max_length=32, verbose_name='api用户', null=True, blank=True)
    # api_pwd = models.CharField(max_length=128, verbose_name='api密码', null=True, blank=True)

    def __str__(self):
        return self.name


class Business(models.Model):
    """
    业务应用表
    """
    name = models.CharField(max_length=128, verbose_name='项目名称')
    contact = models.CharField(max_length=10, verbose_name='项目开发负责人')
    administrator = models.CharField(max_length=10, verbose_name='项目运维负责人')
    descriptions = models.TextField(blank=True, null=True, verbose_name='描述')


    def __str__(self):
        return self.name


class ApplicationInfo(models.Model):
    """
    应用部署信息表
    """
    name = models.CharField(max_length=64, verbose_name='应用名称')
    usage = models.CharField(max_length=128, verbose_name='用途')
    port = models.IntegerField(verbose_name='端口')
    outside_ip = models.CharField(max_length=64,null=True, blank=True, verbose_name='外网地址')
    inside_ip = models.CharField(max_length=64, verbose_name='内网地址')
    path_install = models.CharField(max_length=512, verbose_name='部署路径')
    path_configure = models.CharField(max_length=512, verbose_name='配置路径')
    path_data = models.CharField(max_length=512, verbose_name='数据路径',null=True,blank=True)
    path_log = models.CharField(max_length=512, verbose_name='日志路径',null=True,blank=True)
    descriptions = models.TextField(blank=True, null=True, verbose_name='描述')
    business = models.ForeignKey('Business', related_name='appBusiness')

    def __str__(self):
        return self.name


class MasterDomainName(models.Model):
    """
    域名信息表
    """
    name = models.CharField(max_length=128, verbose_name='主域名', unique=True)
    record = models.CharField(max_length=128,verbose_name='备案主体')
    holder = models.CharField(max_length=20,verbose_name='持有人')
    creation_date = models.DateField(verbose_name='注册时间')
    expire_date = models.DateField(verbose_name='到期时间')

    def __str__(self):
        return self.name


class Dns(models.Model):
    name = models.CharField(max_length=128, verbose_name='子域名', unique=True)
    ipaddr = models.GenericIPAddressField(verbose_name='解析IP')
    usage = models.CharField(max_length=512, verbose_name='域名用途')
    master_domain_name = models.ForeignKey('MasterDomainName',on_delete=models.CASCADE)
    business = models.ForeignKey('Business', related_name='domain',on_delete=models.SET_NULL, null=True, blank=True)
    # application = models.ForeignKey('ApplicationInfo', related_name='appDomain',on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.name


class PlatformInfo(models.Model):
    provider = models.ForeignKey('ProviderInfo', on_delete=models.CASCADE,null=True,blank=True, related_name='platform')
    name = models.CharField(max_length=32, verbose_name='平台名称')
    addr = models.CharField(max_length=128, verbose_name='链接地址')
    username = models.CharField(max_length=32, verbose_name='用户名',null=True,blank=True)
    password = models.CharField(max_length=128, verbose_name='登录密码',null=True,blank=True)


