from rest_framework import exceptions
from api.models import *
from rest_framework.authentication import BaseAuthentication


class MyAuthentication(BaseAuthentication):
    def authenticate(self, request):
        token = request._request.GET.get('token')
        user_token_obj = UserToken.objects.filter(token=token).first()
        if user_token_obj:
            return user_token_obj.user,token
        else:
            raise exceptions.AuthenticationFailed({'code': 4001, 'error': 'token认证失败'})

