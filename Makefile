send:
	jekyll
	rsync -avz _site/ nfsn:/home/public
test: 
	jekyll --base-url http://localhost/homepage/_site/ --url http://localhost/homepage/_site/

