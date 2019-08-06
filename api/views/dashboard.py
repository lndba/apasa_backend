from rest_framework.views import APIView
from api.models import *
from rest_framework.response import Response


class ServerData(APIView):
    def get(self, request, *args, **kwargs):
        res = {"state_code": 200, 'msg': None}
        try:
            data_list = []
            provider_list = ProviderInfo.objects.all().only('id','name')
            if provider_list:
                for item in provider_list:
                    asset_count = Asset.objects.filter(provider=item.id).count()
                    data_list.append({'name':item.name,'value':asset_count})
                res['results'] = data_list
                res['msg'] = 'success'
            else:
                res['state_code'] = 1101
                res['results'] = [{'name': '未查询到数据', 'value': 0}]
                res['msg'] = '获取数据失败'
        except Exception as e:
            res['state_code'] = 1101
            res['results'] = [{'name': '未查询到数据','value':0}]
            res['msg'] = '获取数据失败'
        return Response(res)


class DomainData(APIView):
    def get(self, request, *args, **kwargs):
        res = {"state_code": 200, 'msg': None}
        try:
            data_list = []
            domain_list =  MasterDomainName.objects.all().only('id','name')
            if domain_list:
                for item in domain_list:
                    dns_count = Dns.objects.filter(master_domain_name=item.id).count()
                    data_list.append({'name':item.name,'value':dns_count})
                res['results'] = data_list
                res['msg'] = 'success'
            else:
                res['state_code'] = 1101
                res['results'] = [{'name': '未查询到数据', 'value': 0}]
                res['msg'] = '获取数据失败'
        except Exception as e:
            res['state_code'] = 1101
            res['results'] = [{'name': '未查询到数据','value':0}]
            res['msg'] = '获取数据失败'
        return Response(res)





