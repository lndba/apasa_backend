from rest_framework.viewsets import ModelViewSet,GenericViewSet
from rest_framework.response import Response

from api.serializers.domain import *
from api.pagination.page import MyPageNumberPagination
from api.models import *


class MDomainListViewSet(ModelViewSet):
    queryset = MasterDomainName.objects.all().order_by('id')
    pagination_class = MyPageNumberPagination
    serializer_class = MDomainListSerializers


class DnsListViewSet(GenericViewSet):
    def list(self, request, *args, **kwargs):
        res = {"count": 0, 'results': None}
        domain_id = request.query_params.get('domain')
        dns_list = Dns.objects.all().filter(master_domain_name=domain_id)
        dns_count = Dns.objects.all().filter(master_domain_name=domain_id).count()
        page = MyPageNumberPagination()
        page_dns_list = page.paginate_queryset(dns_list,request,self)
        ser = DnsListSerializers(instance=page_dns_list,many=True)
        res['results'] = ser.data
        res['count'] = dns_count
        return Response(res)


class DnsUpdataViewSet(ModelViewSet):
    queryset = Dns.objects.all().order_by('id')
    serializer_class = DnsUpdataSerializers

