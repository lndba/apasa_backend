from rest_framework.views import APIView
from api.models import *
from django.http import JsonResponse
from api.libs.create_token import get_token
from django.contrib import auth



class LoginView(APIView):
    authentication_classes = []
    permission_classes = []

    def post(self, request, *args, **kwargs):
        username = request.data.get("username")
        password = request.data.get("password")
        user_obj = auth.authenticate(username=username,password=password)
        res = {"state_code": 200, 'msg': None}
        if user_obj:
            user_token_obj = UserToken.objects.update_or_create(user=user_obj,defaults={"token":get_token(user_obj.username)})
            res['msg'] = "success"
            res['token'] = user_token_obj[0].token
        else:
            res['msg'] = "用户名或密码错误"
            res["state_code"] = 110
        return JsonResponse(res)
