share:
	cp -r _layouts blog/
	cp -r _includes blog/
	cp -r css blog/
	cp -r humans.txt blog/
	cp -r _layouts travels/
	cp -r _includes travels/
	cp -r css travels/
	cp -r humans.txt travels/

blog: share
	cd blog && jekyll build .

travels: share
	cd travels && jekyll build .

sync:
	mkdir -p _site
	mv blog/_site _site/blog
	mv travels/_site _site/travels
	rsync -azP _site/ www@elcuervo.net:~/elcuervo.net/
