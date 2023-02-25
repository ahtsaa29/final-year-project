from django.shortcuts import render
from django.http import JsonResponse

from attend_statistics.generate_statistics import AttendanceData

# Create your views here.
def datajson(request):
    # data = AttendanceData.gen_dataset(request)
    # return HttpResponse('hello')
    statis = AttendanceData()
    data = statis.gen_dataset()
    return JsonResponse(data, safe=False)