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
define('AUTH_KEY',         'etGY.#l72RBPgTxR_sGcw(/1P/pp2?XKty4>0ATywT<^B:4wm[W<Mx!6-g]9IVf>');
define('SECURE_AUTH_KEY',  'x,p>Ix:-bfMX7KlhVM^gKSFOu$Up.KlGdF[n=6n+8NEc,J9pFTN@fRVA:9a>i~}#');
define('LOGGED_IN_KEY',    '|=Gzd>U]l/y6Xn*)[.SfLOSo22.|@ GR<akAg5+jX[?fOb5iXUl+ Dj.bHzP5^<E');
define('NONCE_KEY',        'K{EiZOp-Qw3E+9e(=L+DRNjVvnQIb6E#s@w-ywaqkM.r|(ZTM:;64tBf,[$;1y=c');
define('AUTH_SALT',        'o4%;X]*,HnhY+&[)I9)D4gw_555K65m~?D~^3Pe}/^!PA(Algx`@q$d+b }${93f');
define('SECURE_AUTH_SALT', '[/c=$,Zae]7B6Nmi& leh]3!&F]YV)c`U;o`xqrO&&RQZoWX0(&;Zv6`|G%z+a@^');
define('LOGGED_IN_SALT',   'eHVN5xQez!{CItA3P>); s45F,y<tWO6)0}/xu2~~lN?S5jeN#PG+Is7r`Xc|;u%');
define('NONCE_SALT',       'R/|Wj*{$<,A|@# #N#WUme&K|TkG_X2.N|cd<,vbwE(+^C7pw?||j|j#*HR`]r(^');

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
define('FS_METHOD', 'direct');
/* Isto é tudo, pode parar de editar! :) */

/** Caminho absoluto para o diretório WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
	
/** Configura as variáveis do WordPress e arquivos inclusos. */
require_once(ABSPATH . 'wp-settings.php');
