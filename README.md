
## ChayotePHP Framework 

# README #

how to setup the environment


ChayotePHP 3.0
----------------------------

PHP Framework an easy opportunity to start in the Framework World


1)
    127.0.0.8 		localhost.chayotephp

2)Add the entry on vhost

    <VirtualHost 127.0.0.8:80>
      DocumentRoot "/var/www/htdocs/chayotephp"
      ServerName localhost.chayotephp
      ServerAlias localhost.chayotephp
      ErrorLog "/var/log/httpd/localhost.chayotephp-error_log"
      CustomLog "/var/log/httpd/localhost.chayotephp-access_log" common    
    </VirtualHost>
  
  4)Configure o .htaccess da raiz do projeto

    <IfModule mod_rewrite.c>
        RewriteEngine on
        RewriteRule    ^$    public/    [L]
        RewriteRule    (.*) public/$1    [L]
    </IfModule>
    
    
5) Reinicie o servidor Apache
    
    $ sudo /etc/rc.d/rc.httpd stop                                                                                                                            
    $sudo /etc/rc.d/rc.httpd start  
    
    
    
6)Faça Checkout do Projeto no git
    
    $ cd var/www/htdocs
    
    $ git clone https://github.com/fabioalvaro/ChayotePHP.git teste1

ou utlize o composer

    $ composer create-project --prefer-dist fabioalvaro/chayotephp teste1
    $ cd teste1
    $ composer update

    
    
7)set the permissions:
    
    $ sudo chmod 777 teste1/ -R

    
8)Instale o banco de dados exemplo para voce poder utilizar o banco de dados, use seu gerenciador padrão de MYSQL.
    
        chayotedb.sql
        
        
9)Configure as diretivas de conexão no arquivo config.php (linha 27 +- )
    
    define('DBHOST', 'localhost');
    
    define('DBPORT', '3306');
    
    define('DBUSER', 'root');
    
    define('DBPASS', 'senhafake');
    
    define('DBNAME', 'chayotedb');
    
    define('DBENCODING', 'utf8');
        
        
        
    
    
    
