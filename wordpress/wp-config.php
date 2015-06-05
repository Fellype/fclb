<?php
/** 
 * As configurações básicas do WordPress.
 *
 * Esse arquivo contém as seguintes configurações: configurações de MySQL, Prefixo de Tabelas,
 * Chaves secretas, Idioma do WordPress, e ABSPATH. Você pode encontrar mais informações
 * visitando {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. Você pode obter as configurações de MySQL de seu servidor de hospedagem.
 *
 * Esse arquivo é usado pelo script ed criação wp-config.php durante a
 * instalação. Você não precisa usar o site, você pode apenas salvar esse arquivo
 * como "wp-config.php" e preencher os valores.
 *
 * @package WordPress
 */

// ** Configurações do MySQL - Você pode pegar essas informações com o serviço de hospedagem ** //
/** O nome do banco de dados do WordPress */
define('DB_NAME', 'wordpress');

/** Usuário do banco de dados MySQL */
define('DB_USER', 'fellype');

/** Senha do banco de dados MySQL */
define('DB_PASSWORD', 'fellype123');

/** nome do host do MySQL */
define('DB_HOST', 'localhost');

/** Conjunto de caracteres do banco de dados a ser usado na criação das tabelas. */
define('DB_CHARSET', 'utf8mb4');

/** O tipo de collate do banco de dados. Não altere isso se tiver dúvidas. */
define('DB_COLLATE', '');

/**#@+
 * Chaves únicas de autenticação e salts.
 *
 * Altere cada chave para um frase única!
 * Você pode gerá-las usando o {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * Você pode alterá-las a qualquer momento para desvalidar quaisquer cookies existentes. Isto irá forçar todos os usuários a fazerem login novamente.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '}RbP{BO!9}5^Y d)}e/dI+^4Yndk_d/FUes+u;tl^[i8Q<?dY-kC$.e;AF^]K./x');
define('SECURE_AUTH_KEY',  's71Z*WEL)sFnq3J}&qa)w4T_1vIy *bJ?fjTg{v+M>WH^pvsx >B`|O8_LfM3%|U');
define('LOGGED_IN_KEY',    '#`GtJY:OM+h|*2f$ .*eY#1+jOuDAM[+ED1e[4J7O(1@%{iP}lY7KbMq;C|:ZoYY');
define('NONCE_KEY',        's7~ONV-j&YqNZttC8>%5M<vr,n=!?I}Z%`j,[<%KP ] XBhq82J(l}R]sm^l1-rC');
define('AUTH_SALT',        'C`:V]fC/1h_G]L!ioi#a^bZ]eIx8I/9s?KU11n<e7]|kp:;_Crk%XHj{lhxcqojV');
define('SECURE_AUTH_SALT', 's+>-(dw?bl*lM/yT31zF5P5v(`o{F#|w9*bSxZZ}~#+tZ4m*n~8Qp;~7X^mTwBk*');
define('LOGGED_IN_SALT',   'YcL;-I-G-+/B+/14~(fc4QhF*.,`rCr(dVA,Wi9EQ+zZ%3Z$j{S9_Eg|gc]^Ann%');
define('NONCE_SALT',       'djX1JSukNPv1!);n44+5o0x9$w_f*~_BnrN;mk;!yI$B(qJzx8$lY|);10.{<-;z');
define('FS_METHOD','direct');

/**#@-*/

/**
 * Prefixo da tabela do banco de dados do WordPress.
 *
 * Você pode ter várias instalações em um único banco de dados se você der para cada um um único
 * prefixo. Somente números, letras e sublinhados!
 */
$table_prefix  = 'wp_';


/**
 * Para desenvolvedores: Modo debugging WordPress.
 *
 * altere isto para true para ativar a exibição de avisos durante o desenvolvimento.
 * é altamente recomendável que os desenvolvedores de plugins e temas usem o WP_DEBUG
 * em seus ambientes de desenvolvimento.
 */
define('WP_DEBUG', false);

/* Isto é tudo, pode parar de editar! :) */

/** Caminho absoluto para o diretório WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
	
/** Configura as variáveis do WordPress e arquivos inclusos. */
require_once(ABSPATH . 'wp-settings.php');