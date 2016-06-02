build:
	hugo --theme=raven

release: build
	rsync -rav public/ raven-01:/var/www/elcuervo.net
