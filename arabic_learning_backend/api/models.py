from django.db import models

class Lesson(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField()
    user_type = models.CharField(max_length=10)  # 'adult' or 'child'
    category = models.CharField(max_length=50)  # e.g., 'speaking', 'writing', 'vocabulary'

class User(models.Model):
    username = models.CharField(max_length=100)
    email = models.EmailField()
    user_type = models.CharField(max_length=10)  # 'adult' or 'child'

class Progress(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE)
    progress = models.IntegerField(default=0)  # e.g., percentage of completion
    points = models.IntegerField(default=0)