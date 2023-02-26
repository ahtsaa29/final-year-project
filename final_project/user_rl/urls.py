from django.urls import path, include
from user_rl.views import HrmsUserRegistrationView, HrmsUserLoginView, HrmsUserProfileView, HrmsUserChangePasswordView, HrmsUserPasswordResetView, SendPasswordResetEmailView
# from user_rl.views import UserViewSet
# from rest_framework import routers


# router = routers.DefaultRouter()
# router.register(r'user-data', UserViewSet)


urlpatterns = [
    # path('', include(router.urls)),
    path('register/',HrmsUserRegistrationView.as_view(), name='register'),
    path('login/',HrmsUserLoginView.as_view(), name='login'),
    path('profile/',HrmsUserProfileView.as_view(), name='profile'),
    path('changepassword/', HrmsUserChangePasswordView.as_view(), name='changepassword'),
    path('send-reset-password-email/', SendPasswordResetEmailView.as_view(), name='send-reset-password-email'),
    path('reset-password/<uid>/<token>/', HrmsUserPasswordResetView.as_view(), name='reset-password'),
    # path('user-data/', UserView.as_view(), name='user-data'),
]