server
{
	listen	443;
	
	root /var/www/html;
}
