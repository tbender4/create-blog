# create-blog
Quickly create a new jekyll blog post with this bash script.

## What is does
This script will do the following:
* Asks for title of the blog post
* Creates timestamped markdown file for the post.
* Creates directory for your images in the assets folder.
* Fills post with standard formatting.
* Enter user's favorite editor with the new blog post.

## Installation

Here's a couple methods of installation:

* wget
	cd ~/my-blog.github.io/_posts/
	wget https://raw.githubusercontent.com/tbender4/create-blog/master/create-post.sh
	chmod +x create-post.sh

* git
	git clone https://github.com/tbender4/create-blog.git
	mv ./create-blog/create-post.sh ~/my-blog.github.io/_posts
	chmod +x ~/my-blog.github.io/_posts

## Usage
When working in your `_posts` directory:
	./create-post.sh
	Title: Enter Title Here

That's it!
