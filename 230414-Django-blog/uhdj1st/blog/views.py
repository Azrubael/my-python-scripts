from django.shortcuts import render
from django.http import Http404
from .models import Post
from django.shortcuts import render, get_object_or_404

def post_list(request):
    posts = Post.published.all()
    return render(request,
        'blog/post/list.html',
        {'posts': posts})

def post_detail(request, id):
    try:
        post = Post.published.get(id=id)
    except Post.DoesNotExist:
        raise Http404("No Post found.")
    
    return(request,
        'blog/post/detail.html',
        {'post': post})

def post_detail(request, id):
    post = get_object_or_404(Post,
        id=id,
        status=Post.Status.PUBLISHED)
    return render(request,
        'blog/post/detail.html',
        {'post': post})


# Create your views here (создайте свое представление тут).
