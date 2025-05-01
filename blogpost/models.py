from django.contrib.auth.models import User
from django.db import models

# Create your models here.

#classe article
class Article(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField()
    image = models.ImageField(upload_to='images/')
    STATUS_CHOICES = (
    ("draft", "Brouillon"),
    ("published", "Publié"),
    )
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default="draft")
    pub_date = models.DateTimeField(auto_now_add=True)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    category = models.ForeignKey("Category", on_delete=models.CASCADE)
    author = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.title

#classe category
class Category(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name