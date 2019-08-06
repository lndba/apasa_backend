from django.utils.deprecation import MiddlewareMixin
from django.conf import settings


class Cors(MiddlewareMixin):
    def process_response(self, request, response):
        response['Access-Control-Allow-Origin'] = ','.join(settings.CORS_ORIGIN_LIST)
        if request.method == 'OPTIONS':
            response['Access-Control-Allow-Methods'] = ','.join(settings.CORS_METHOD_LIST)
            response['Access-Control-Allow-Headers'] = ','.join(settings.CORS_HEADER_LIST)
            response['Access-Control-Allow-Credentials'] = 'true'

        return response