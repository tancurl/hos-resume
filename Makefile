NAME = hossein-exmailzadeh
all:
	typst compile resume.typ

prod:
	make
	cp resume.pdf $(NAME)-resume.pdf
