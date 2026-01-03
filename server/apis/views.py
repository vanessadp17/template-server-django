from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from info.models import *
from .serializers import *

class AuthorListView(APIView):
    def get(self, request):
        authors = Author.objects.all()
        serializer = AuthorSerializer(authors, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

class BookListView(APIView):
    def get(self, request):
        books = Book.objects.select_related("author").all()
        serializer = BookSerializer(books, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

