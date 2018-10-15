###How to get appache running in OSX (El capitan)  
Notes from this website: http://coolestguidesontheplanet.com/get-apache-mysql-php-and-phpmyadmin-working-on-osx-10-11-el-capitan/  

###Step 1
**to start Apache web sharing**  
sudo apachectl start  

**to stop it**  
sudo apachectl stop  

**to restart it**  
sudo apachectl restart  

**To find the Apache version**  
httpd -v  

###Step 2
**go to this path:**  
finder -> go-> "/etc/apache2/"  

**Open this file in a text editor:**  
/etc/apache2/httpd.conf  
make sure these modules are uncommented (the first 2 should be on a clean install):  

LoadModule authz_core_module libexec/apache2/mod_authz_core.so   
LoadModule authz_host_module libexec/apache2/mod_authz_host.so     
LoadModule userdir_module libexec/apache2/mod_userdir.so   (this one is only needed if you are to use the USERNAME/sites folder later) 
LoadModule include_module libexec/apache2/mod_include.so    
LoadModule rewrite_module libexec/apache2/mod_rewrite.so 
LoadModule php5_module libexec/apache2/libphp5.so (so that php works)
Include /private/etc/apache2/extra/httpd-userdir.conf (this one is only needed if you are to use the USERNAME/sites folder later) 

Then set this: (circa line 256, this enables permalinks to look clean, localhost/project/1 etc)  
AllowOverride All  

**Your web-server files are located here:**  
finder -> go-> /Library/WebServer/Documents  
  
**Then just restart apache**
sudo apachectl restart    
And your web-server will work with pretty urls  

###Step 3 (using the users/USERNAME/Sites/ folder as your localhost)


WARNING:  
the following steps havent been tested, and is missing the ingredient that would redirect localhost/~USERNAME to the localhost


**go to this path:**   
finder -> go-> "/etc/apache2/users/"  

**Create a new file named: username-here.conf then add this text:**  (swap username with your osx account username,case sensitive)
<Directory "/Users/username-here/Sites/">  
AllowOverride All  
Options Indexes MultiViews FollowSymLinks  
Require all granted  
</Directory>  

**Check permisions of the file should be -rw-r--r--**  
right click the file to do this or do this in terminal:    
cd /etc/apache2/users    
sudo chmod 644 username.conf    



