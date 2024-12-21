from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import LessonViewSet, UserViewSet, ProgressViewSet

router = DefaultRouter()
router.register(r'lessons', LessonViewSet)
router.register(r'users', UserViewSet)
router.register(r'progress', ProgressViewSet)

urlpatterns = [
    path('', include(router.urls)),
]