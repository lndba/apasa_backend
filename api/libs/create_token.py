import time,hashlib


def get_token(user):
    ctime=str(time.time())
    md5=hashlib.md5(bytes(user,encoding="utf8"))
    md5.update(bytes(ctime,encoding="utf8"))
    return md5.hexdigest()