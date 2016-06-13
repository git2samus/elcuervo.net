build:
	hugo --theme=raven

serve:
	hugo --theme=raven --watch server

release: build
	rsync -rav public/ raven-01:/var/www/elcuervo.net
