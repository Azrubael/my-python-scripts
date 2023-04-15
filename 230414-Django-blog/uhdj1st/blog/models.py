"""Это модель данных для постов блога.
Посты будут иметь заголовок,
короткую метку под названием slug и тело поста.
"""
# Create your models here.

from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

class PublishedManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset()\
            .filter(status=Post.Status.PUBLISHED)

class Post(models.Model):

    class Status(models.TextChoices):
        DRAFT = 'DF', 'Draft'
        PUBLISHED = 'PD', 'Published'
        
    # CharField транслируется в столбец VARCHAR в БД SQL
    title = models.CharField(max_length=250)
    # SlugField транслируется в столбец VARCHAR в БД SQL.
    slug = models.SlugField(max_length=250)
    author = models.ForeignKey(User,
            on_delete=models.CASCADE,
            related_name='blog_posts')
    # TextField транслируется в столбец Text в БД SQL
    body = models.TextField()
    # DateTimeField транслируется в столбец DATETIME  в БД SQL
    publish = models.DateTimeField(default=timezone.now)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=2,
            choices=Status.choices,
            default=Status.DRAFT)

    objects = models.Manager() # менеджер, применяемый по умолчанию
    published = PublishedManager() # конкретно- прикладной менеджер 

    class Meta:
        """Этот класс определяет метаданные модели.
        Aтрибут ordering сообщает, что следует сортировать результаты по полю publish,
        от новых к старым (обратный порядок).
        """
        ordering = ['-publish']
        # Добавлен индекс БД по полю publish, добавления в убывающем порядке
        indexes = [
                models.Index(fields=['-publish']),
        ]


def __str__(self):
    """ Метод, который по умолчанию возвращает строковый литерал с представлением объекта.
    """
    return self.title
