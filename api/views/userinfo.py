from rest_framework.views import APIView
from django.contrib import auth

from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response

from api.serializers.userinfo import *
from api.pagination.page import MyPageNumberPagination


class UserInfoListViewSet(ModelViewSet):
    queryset = UserInfo.objects.all().order_by('id')
    pagination_class = MyPageNumberPagination
    serializer_class = UserInfoListSerializers


class UserInfoCreateViewSet(APIView):
    def post(self, request, *args, **kwargs):
        res = {"state_code": 200, 'msg': None}
        username = request.data.get('username')
        email = request.data.get('email')
        password = request.data.get('password')
        user_obj = UserInfo.objects.filter(username=username)
        if not user_obj:
            user = UserInfo.objects.create_user(username=username, email=email, password=password)
            if user:
                user.save()
                res['msg'] = 'success'
            else:
                res['state_code'] = 1001
                res['msg'] = '添加错误'
        else:
            res['state_code'] = 1002
            res['msg'] = '添加用户重复，请重新添加'
        return Response(res)


class UserInfoSetPwdViewSet(APIView):
    def post(self, request, *args, **kwargs):
        res = {"state_code": 200, 'msg': None}
        old_password = request.data.get('old_password')
        new_password = request.data.get('new_password')
        username = request.data.get('username')
        user = auth.authenticate(username=username, password=old_password)
        if user is not None:
            user.set_password(new_password)
            user.save()
            res['msg'] = 'success'
        else:
            res['state_code'] = 1003
            res['msg'] = '修改密码错误！'
        return Response(res)
