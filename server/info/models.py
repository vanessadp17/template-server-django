from django.db import models


class Author(models.Model):
    name = models.CharField(max_length=100)
    country = models.CharField(max_length=50, null=True, blank=True)

    class Meta:
        db_table = "authors"

    def __str__(self):
        return self.name


class Book(models.Model):
    title = models.CharField(max_length=255)
    isbn = models.CharField(max_length=20, unique=True, null=True, blank=True)
    publication_year = models.IntegerField(null=True, blank=True)
    author = models.ForeignKey(Author, on_delete=models.CASCADE, db_column="author_id", related_name="books")

    class Meta:
        db_table = "books"

    def __str__(self):
        return self.title
