-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 10-Jun-2015 às 01:54
-- Versão do servidor: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wordpress`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Sr. WordPress', '', 'https://wordpress.org/', '', '2015-06-05 17:26:31', '2015-06-05 17:26:31', 'Olá, Isto é um comentário.\nPara excluir um comentário, faça o login e veja os comentários de posts. Lá você terá a opção de editá-los ou excluí-los.', 0, '1', '', '', 0, 0),
(2, 14, 'John Doe', 'nicolae@europadns.com', 'http://www.europadns.com', '86.123.150.190', '2015-03-06 12:31:59', '2015-03-06 12:31:59', 'Nunc a imperdiet nisl, eu gravida erat. Nam eget nisi elit.', 0, '1', '', '', 0, 1),
(3, 14, 'john smith', 'johnsmith@email.com', '', '86.123.150.190', '2015-03-06 12:33:25', '2015-03-06 12:33:25', 'Sed sed maximus dolor, sed pulvinar tellus. Donec in mi nisi. Aliquam urna erat, luctus lobortis vehicula vitae, vestibulum pulvinar urna.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/fclb/wordpress', 'yes'),
(2, 'home', 'http://localhost/fclb/wordpress', 'yes'),
(3, 'blogname', 'Fórum de Comunicação no Legislativo Brasileiro', 'yes'),
(4, 'blogdescription', 'Só mais um site WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'fellypenc@gmail.com', 'yes'),
(7, 'start_of_week', '0', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j \\d\\e F \\d\\e Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'j \\d\\e F \\d\\e Y, H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:4:{i:0;s:36:"contact-form-7/wp-contact-form-7.php";i:1;s:27:"js_composer/js_composer.php";i:2;s:23:"revslider/revslider.php";i:3;s:41:"wordpress-importer/wordpress-importer.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '0', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', 'a:2:{i:0;s:72:"/opt/lampp/htdocs/fclb/wordpress/wp-content/themes/firstone-wp/style.css";i:2;s:0:"";}', 'no'),
(41, 'template', 'firstone-wp', 'yes'),
(42, 'stylesheet', 'firstone-wp', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '31535', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'page', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:0:{}', 'yes'),
(81, 'widget_rss', 'a:0:{}', 'yes'),
(82, 'uninstall_plugins', 'a:0:{}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '103', 'yes'),
(85, 'page_on_front', '50', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '31535', 'yes'),
(89, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(90, 'WPLANG', 'pt_BR', 'yes'),
(91, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'sidebars_widgets', 'a:7:{s:19:"wp_inactive_widgets";a:0:{}s:19:"nfw-default-sidebar";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:24:"nfw-footer-top-sidebar-1";N;s:24:"nfw-footer-top-sidebar-2";N;s:24:"nfw-footer-top-sidebar-3";N;s:24:"nfw-footer-top-sidebar-4";N;s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:6:{i:1433913992;a:1:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1433913993;a:2:{s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1433921160;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1433960130;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1433960288;a:1:{s:14:"redux_tracking";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(109, '_transient_random_seed', '6abbbe9e61b03fa546d27ce593a386c7', 'yes'),
(110, '_site_transient_timeout_browser_047444e31f77394349a21c86c2430497', '1434130006', 'yes'),
(111, '_site_transient_browser_047444e31f77394349a21c86c2430497', 'a:8:{s:4:"name";s:6:"Chrome";s:7:"version";s:12:"42.0.2311.90";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(112, 'can_compress_scripts', '1', 'yes'),
(132, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1433528198;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(133, 'current_theme', 'FirstOne OnePage WordPress Theme (shared on themelot.net)', 'yes'),
(134, 'theme_mods_firstone-wp', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:17:"nfw-firstone-menu";i:20;}}', 'yes'),
(135, 'theme_switched', '', 'yes'),
(136, 'redux-framework-tracking', 'a:3:{s:8:"dev_mode";b:0;s:4:"hash";s:32:"46b5bfa64c0c3075a8cbbbd42d56f493";s:14:"allow_tracking";s:3:"yes";}', 'yes'),
(137, 'nfw_theme_options', 'a:24:{s:8:"last_tab";s:0:"";s:20:"nfw-favicon-selector";a:5:{s:3:"url";s:95:"http://localhost/fclb/wordpress/wp-content/themes/firstone-wp/layout/images/default/favicon.png";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:22:"nfw-appleicon-selector";a:5:{s:3:"url";s:120:"http://localhost/fclb/wordpress/wp-content/themes/firstone-wp/layout/images/default/apple-touch-icon-144-precomposed.png";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:20:"nfw-backtotop-toggle";s:1:"1";s:19:"nfw-preloader-image";a:5:{s:3:"url";s:86:"http://localhost/fclb/wordpress/wp-content/themes/firstone-wp/layout/images/loader.gif";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:17:"nfw-404-selection";s:7:"default";s:14:"nfw-custom-css";s:0:"";s:20:"nfw-custom-analytics";s:0:"";s:15:"nfw-header-logo";a:5:{s:3:"url";s:67:"http://localhost/fclb/wordpress/wp-content/uploads/2015/06/logo.png";s:2:"id";s:1:"6";s:6:"height";s:3:"226";s:5:"width";s:3:"256";s:9:"thumbnail";s:75:"http://localhost/fclb/wordpress/wp-content/uploads/2015/06/logo-150x150.png";}s:22:"nfw-header-sticky-logo";a:5:{s:3:"url";s:89:"http://localhost/fclb/wordpress/wp-content/themes/firstone-wp/layout/images/logo-dark.png";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:27:"nfw-header-background-image";a:5:{s:3:"url";s:96:"http://localhost/fclb/wordpress/wp-content/uploads/2015/06/Congresso_Nacional_-_Bras¡lia-bg.png";s:2:"id";s:1:"5";s:6:"height";s:4:"1152";s:5:"width";s:4:"1728";s:9:"thumbnail";s:104:"http://localhost/fclb/wordpress/wp-content/uploads/2015/06/Congresso_Nacional_-_Bras¡lia-bg-150x150.png";}s:21:"nfw-footer-top-switch";s:1:"1";s:21:"nfw-footer-top-layout";s:1:"2";s:24:"nfw-accent-colors-enable";s:1:"2";s:23:"nfw-color-scheme-accent";s:7:"#ffb400";s:27:"nfw-color-scheme-accent-alt";s:7:"#bebebe";s:21:"nfw-color-scheme-font";s:7:"#4b4b4b";s:25:"nfw-color-scheme-headline";s:7:"#4b4b4b";s:14:"nfw-color-menu";s:7:"#ffffff";s:21:"nfw-color-sticky-menu";s:7:"#ffffff";s:22:"nfw-color-sticky-color";s:7:"#4b4b4b";s:34:"nfw-color-scheme-footer-background";s:7:"#1b1b1b";s:28:"nfw-color-scheme-footer-font";s:7:"#ffffff";s:19:"nfw-sidebars-custom";a:0:{}}', 'yes'),
(138, 'nfw_theme_options-transients', 'a:2:{s:14:"changed_values";a:1:{s:8:"last_tab";s:1:"0";}s:9:"last_save";i:1433891669;}', 'yes'),
(140, '_transient_timeout_redux_tracking_cache', '1434133089', 'no'),
(141, '_transient_redux_tracking_cache', '1', 'no'),
(142, 'ftp_credentials', 'a:3:{s:8:"hostname";s:9:"localhost";s:8:"username";s:7:"fellype";s:15:"connection_type";s:3:"ftp";}', 'yes'),
(146, 'recently_activated', 'a:0:{}', 'yes'),
(147, 'vc_version', '4.3.5', 'yes'),
(148, 'revslider_checktables', '1', 'yes'),
(149, 'revslider-static-css', '.tp-caption a {\ncolor:#ff7302;\ntext-shadow:none;\n-webkit-transition:all 0.2s ease-out;\n-moz-transition:all 0.2s ease-out;\n-o-transition:all 0.2s ease-out;\n-ms-transition:all 0.2s ease-out;\n}\n\n.tp-caption a:hover {\ncolor:#ffa902;\n}', 'yes'),
(150, 'revslider-update-check-short', '1433889000', 'yes'),
(151, 'wpcf7', 'a:1:{s:7:"version";s:5:"4.1.2";}', 'yes'),
(158, 'revslider-valid-notice', 'false', 'yes'),
(159, 'wpb_js_content_types', 'a:2:{i:0;s:4:"page";i:1;s:9:"portfolio";}', 'yes'),
(160, 'wpb_js_groups_access_rules', 'a:4:{s:13:"administrator";a:1:{s:4:"show";s:3:"all";}s:6:"editor";a:1:{s:4:"show";s:3:"all";}s:6:"author";a:1:{s:4:"show";s:3:"all";}s:11:"contributor";a:1:{s:4:"show";s:3:"all";}}', 'yes'),
(161, 'wpb_js_not_responsive_css', '', 'yes'),
(162, 'wpb_js_google_fonts_subsets', 'a:1:{i:0;s:5:"latin";}', 'yes'),
(165, '_site_transient_timeout_popular_importers_pt_BR', '1433703744', 'yes'),
(166, '_site_transient_popular_importers_pt_BR', 'a:2:{s:9:"importers";a:8:{s:7:"blogger";a:4:{s:4:"name";s:7:"Blogger";s:11:"description";s:86:"Install the Blogger importer to import posts, comments, and users from a Blogger blog.";s:11:"plugin-slug";s:16:"blogger-importer";s:11:"importer-id";s:7:"blogger";}s:9:"wpcat2tag";a:4:{s:4:"name";s:29:"Categories and Tags Converter";s:11:"description";s:109:"Install the category/tag converter to convert existing categories to tags or tags to categories, selectively.";s:11:"plugin-slug";s:18:"wpcat2tag-importer";s:11:"importer-id";s:9:"wpcat2tag";}s:11:"livejournal";a:4:{s:4:"name";s:11:"LiveJournal";s:11:"description";s:82:"Install the LiveJournal importer to import posts from LiveJournal using their API.";s:11:"plugin-slug";s:20:"livejournal-importer";s:11:"importer-id";s:11:"livejournal";}s:11:"movabletype";a:4:{s:4:"name";s:24:"Movable Type and TypePad";s:11:"description";s:99:"Install the Movable Type importer to import posts and comments from a Movable Type or TypePad blog.";s:11:"plugin-slug";s:20:"movabletype-importer";s:11:"importer-id";s:2:"mt";}s:4:"opml";a:4:{s:4:"name";s:8:"Blogroll";s:11:"description";s:61:"Install the blogroll importer to import links in OPML format.";s:11:"plugin-slug";s:13:"opml-importer";s:11:"importer-id";s:4:"opml";}s:3:"rss";a:4:{s:4:"name";s:3:"RSS";s:11:"description";s:58:"Install the RSS importer to import posts from an RSS feed.";s:11:"plugin-slug";s:12:"rss-importer";s:11:"importer-id";s:3:"rss";}s:6:"tumblr";a:4:{s:4:"name";s:6:"Tumblr";s:11:"description";s:84:"Install the Tumblr importer to import posts &amp; media from Tumblr using their API.";s:11:"plugin-slug";s:15:"tumblr-importer";s:11:"importer-id";s:6:"tumblr";}s:9:"wordpress";a:4:{s:4:"name";s:9:"WordPress";s:11:"description";s:130:"Install the WordPress importer to import posts, pages, comments, custom fields, categories, and tags from a WordPress export file.";s:11:"plugin-slug";s:18:"wordpress-importer";s:11:"importer-id";s:9:"wordpress";}}s:10:"translated";b:0;}', 'yes'),
(183, 'category_children', 'a:0:{}', 'yes'),
(184, 'portfolio_categories_children', 'a:0:{}', 'yes'),
(189, 'rewrite_rules', 'a:92:{s:12:"portfolio/?$";s:29:"index.php?post_type=portfolio";s:42:"portfolio/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?post_type=portfolio&feed=$matches[1]";s:37:"portfolio/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?post_type=portfolio&feed=$matches[1]";s:29:"portfolio/page/([0-9]{1,})/?$";s:47:"index.php?post_type=portfolio&paged=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:51:"categories/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:59:"index.php?portfolio_categories=$matches[1]&feed=$matches[2]";s:46:"categories/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:59:"index.php?portfolio_categories=$matches[1]&feed=$matches[2]";s:39:"categories/([^/]+)/page/?([0-9]{1,})/?$";s:60:"index.php?portfolio_categories=$matches[1]&paged=$matches[2]";s:21:"categories/([^/]+)/?$";s:42:"index.php?portfolio_categories=$matches[1]";s:37:"portfolio/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"portfolio/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"portfolio/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"portfolio/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"portfolio/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"portfolio/([^/]+)/trackback/?$";s:36:"index.php?portfolio=$matches[1]&tb=1";s:50:"portfolio/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?portfolio=$matches[1]&feed=$matches[2]";s:45:"portfolio/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?portfolio=$matches[1]&feed=$matches[2]";s:38:"portfolio/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?portfolio=$matches[1]&paged=$matches[2]";s:45:"portfolio/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?portfolio=$matches[1]&cpage=$matches[2]";s:30:"portfolio/([^/]+)(/[0-9]+)?/?$";s:48:"index.php?portfolio=$matches[1]&page=$matches[2]";s:26:"portfolio/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"portfolio/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:56:"portfolio/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"portfolio/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"portfolio/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:39:"index.php?&page_id=50&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(191, '_site_transient_timeout_theme_roots', '1433890818', 'yes'),
(192, '_site_transient_theme_roots', 'a:4:{s:11:"firstone-wp";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes'),
(193, '_transient_timeout_plugin_slugs', '1433975456', 'no'),
(194, '_transient_plugin_slugs', 'a:6:{i:0;s:19:"akismet/akismet.php";i:1;s:36:"contact-form-7/wp-contact-form-7.php";i:2;s:9:"hello.php";i:3;s:23:"revslider/revslider.php";i:4;s:41:"wordpress-importer/wordpress-importer.php";i:5;s:27:"js_composer/js_composer.php";}', 'no'),
(195, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1433932256', 'no'),
(196, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>Erro de RSS</strong>: WP HTTP Error: Failed connect to wordpress.org:80; Operation now in progress</p></div><div class="rss-widget"><p><strong>Erro de RSS</strong>: WP HTTP Error: Failed connect to planet.wordpress.org:443; Operation now in progress</p></div><div class="rss-widget"><ul></ul></div>', 'no'),
(200, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:0:{}s:15:"version_checked";s:5:"4.2.2";s:12:"last_checked";i:1433889379;}', 'yes'),
(201, '_site_transient_update_themes', 'O:8:"stdClass":1:{s:12:"last_checked";i:1433890366;}', 'yes'),
(202, '_site_transient_update_plugins', 'O:8:"stdClass":1:{s:12:"last_checked";i:1433889495;}', 'yes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 4, '_form', '<p>Seu nome (obrigatório)<br />\n    [text* your-name] </p>\n\n<p>Seu e-mail (obrigatório)<br />\n    [email* your-email] </p>\n\n<p>Assunto<br />\n    [text your-subject] </p>\n\n<p>Sua mensagem<br />\n    [textarea your-message] </p>\n\n<p>[submit "Enviar"]</p>'),
(3, 4, '_mail', 'a:8:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:33:"[your-name] <fellypenc@gmail.com>";s:4:"body";s:233:"De: [your-name] <[your-email]>\nAssunto: [your-subject]\n\nCorpo da mensagem:\n[your-message]\n\n--\nEste e-mail foi enviado de um formulário de contato em Fórum de Comunicação no Legislativo Brasileiro (http://localhost/fclb/wordpress)";s:9:"recipient";s:19:"fellypenc@gmail.com";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(4, 4, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:71:"Fórum de Comunicação no Legislativo Brasileiro <fellypenc@gmail.com>";s:4:"body";s:177:"Corpo da mensagem:\n[your-message]\n\n--\nEste e-mail foi enviado de um formulário de contato em Fórum de Comunicação no Legislativo Brasileiro (http://localhost/fclb/wordpress)";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:29:"Reply-To: fellypenc@gmail.com";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(5, 4, '_messages', 'a:8:{s:12:"mail_sent_ok";s:47:"Sua mensagem foi enviada com sucesso. Obrigado.";s:12:"mail_sent_ng";s:115:"Não foi possível enviar a sua mensagem. Por favor, tente mais tarde ou contate o administrador por outro método.";s:16:"validation_error";s:77:"Ocorreram erros de validação. Por favor confira os dados e envie novamente.";s:4:"spam";s:115:"Não foi possível enviar a sua mensagem. Por favor, tente mais tarde ou contate o administrador por outro método.";s:12:"accept_terms";s:43:"Por favor aceite os termos para prosseguir.";s:16:"invalid_required";s:34:"Please fill in the required field.";s:16:"invalid_too_long";s:23:"This input is too long.";s:17:"invalid_too_short";s:24:"This input is too short.";}'),
(6, 4, '_additional_settings', ''),
(7, 4, '_locale', 'pt_BR'),
(8, 5, '_wp_attached_file', '2015/06/Congresso_Nacional_-_Bras¡lia-bg.png'),
(9, 5, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1728;s:6:"height";i:1152;s:4:"file";s:45:"2015/06/Congresso_Nacional_-_Bras¡lia-bg.png";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:45:"Congresso_Nacional_-_Bras¡lia-bg-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:45:"Congresso_Nacional_-_Bras¡lia-bg-300x200.png";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:46:"Congresso_Nacional_-_Bras¡lia-bg-1024x683.png";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:46:"Congresso_Nacional_-_Bras¡lia-bg-1170x780.png";s:5:"width";i:1170;s:6:"height";i:780;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:43:"Congresso_Nacional_-_Bras¡lia-bg-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:45:"Congresso_Nacional_-_Bras¡lia-bg-400x400.png";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:45:"Congresso_Nacional_-_Bras¡lia-bg-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:45:"Congresso_Nacional_-_Bras¡lia-bg-570x680.png";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:45:"Congresso_Nacional_-_Bras¡lia-bg-860x540.png";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(10, 6, '_wp_attached_file', '2015/06/logo.png'),
(11, 6, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:256;s:6:"height";i:226;s:4:"file";s:16:"2015/06/logo.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:16:"logo-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:14:"logo-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(14, 33, '_wp_attached_file', '2015/02/400x400-8.png'),
(15, 33, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:400;s:4:"file";s:21:"2015/02/400x400-8.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"400x400-8-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"400x400-8-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"400x400-8-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"400x400-8-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(16, 34, '_wp_attached_file', '2015/02/400x400-1.png'),
(17, 34, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:400;s:4:"file";s:21:"2015/02/400x400-1.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"400x400-1-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"400x400-1-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"400x400-1-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"400x400-1-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(18, 35, '_wp_attached_file', '2015/02/400x400-2.png'),
(19, 35, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:400;s:4:"file";s:21:"2015/02/400x400-2.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"400x400-2-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"400x400-2-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"400x400-2-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"400x400-2-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(20, 36, '_wp_attached_file', '2015/02/400x400-3.png'),
(21, 36, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:400;s:4:"file";s:21:"2015/02/400x400-3.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"400x400-3-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"400x400-3-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"400x400-3-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"400x400-3-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(22, 37, '_wp_attached_file', '2015/02/400x400-4.png'),
(23, 37, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:400;s:4:"file";s:21:"2015/02/400x400-4.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"400x400-4-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"400x400-4-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"400x400-4-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"400x400-4-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(24, 38, '_wp_attached_file', '2015/02/400x400-5.png'),
(25, 38, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:400;s:4:"file";s:21:"2015/02/400x400-5.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"400x400-5-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"400x400-5-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"400x400-5-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"400x400-5-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(26, 39, '_wp_attached_file', '2015/02/400x400-6.png'),
(27, 39, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:400;s:4:"file";s:21:"2015/02/400x400-6.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"400x400-6-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"400x400-6-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"400x400-6-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"400x400-6-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(28, 40, '_wp_attached_file', '2015/02/400x400-7.png'),
(29, 40, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:400;s:4:"file";s:21:"2015/02/400x400-7.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"400x400-7-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"400x400-7-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"400x400-7-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"400x400-7-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(30, 52, '_wp_attached_file', '2015/02/270x270-4.png'),
(31, 52, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:660;s:6:"height";i:660;s:4:"file";s:21:"2015/02/270x270-4.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"270x270-4-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"270x270-4-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"270x270-4-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"270x270-4-400x400.png";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"270x270-4-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"270x270-4-570x660.png";s:5:"width";i:570;s:6:"height";i:660;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:21:"270x270-4-660x540.png";s:5:"width";i:660;s:6:"height";i:540;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(32, 53, '_wp_attached_file', '2015/02/270x270-1.png'),
(33, 53, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:660;s:6:"height";i:660;s:4:"file";s:21:"2015/02/270x270-1.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"270x270-1-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"270x270-1-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"270x270-1-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"270x270-1-400x400.png";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"270x270-1-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"270x270-1-570x660.png";s:5:"width";i:570;s:6:"height";i:660;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:21:"270x270-1-660x540.png";s:5:"width";i:660;s:6:"height";i:540;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(34, 54, '_wp_attached_file', '2015/02/270x270-2.png'),
(35, 54, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:660;s:6:"height";i:660;s:4:"file";s:21:"2015/02/270x270-2.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"270x270-2-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"270x270-2-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"270x270-2-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"270x270-2-400x400.png";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"270x270-2-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"270x270-2-570x660.png";s:5:"width";i:570;s:6:"height";i:660;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:21:"270x270-2-660x540.png";s:5:"width";i:660;s:6:"height";i:540;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(36, 55, '_wp_attached_file', '2015/02/270x270-3.png'),
(37, 55, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:660;s:6:"height";i:660;s:4:"file";s:21:"2015/02/270x270-3.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"270x270-3-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"270x270-3-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"270x270-3-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"270x270-3-400x400.png";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"270x270-3-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"270x270-3-570x660.png";s:5:"width";i:570;s:6:"height";i:660;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:21:"270x270-3-660x540.png";s:5:"width";i:660;s:6:"height";i:540;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(38, 58, '_wp_attached_file', '2015/02/1920x750-3.jpg'),
(39, 58, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:750;s:4:"file";s:22:"2015/02/1920x750-3.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"1920x750-3-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"1920x750-3-300x117.jpg";s:5:"width";i:300;s:6:"height";i:117;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:23:"1920x750-3-1024x400.jpg";s:5:"width";i:1024;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:23:"1920x750-3-1170x457.jpg";s:5:"width";i:1170;s:6:"height";i:457;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:20:"1920x750-3-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:22:"1920x750-3-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:22:"1920x750-3-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:22:"1920x750-3-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:22:"1920x750-3-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(40, 59, '_wp_attached_file', '2015/02/1920x1000-2.jpg'),
(41, 59, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1000;s:4:"file";s:23:"2015/02/1920x1000-2.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"1920x1000-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:23:"1920x1000-2-300x156.jpg";s:5:"width";i:300;s:6:"height";i:156;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:24:"1920x1000-2-1024x533.jpg";s:5:"width";i:1024;s:6:"height";i:533;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:24:"1920x1000-2-1170x609.jpg";s:5:"width";i:1170;s:6:"height";i:609;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:21:"1920x1000-2-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:23:"1920x1000-2-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:23:"1920x1000-2-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:23:"1920x1000-2-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:23:"1920x1000-2-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(42, 60, '_wp_attached_file', '2015/02/1920x1080.jpg'),
(43, 60, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1080;s:4:"file";s:21:"2015/02/1920x1080.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"1920x1080-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"1920x1080-300x169.jpg";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:22:"1920x1080-1024x576.jpg";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:22:"1920x1080-1170x658.jpg";s:5:"width";i:1170;s:6:"height";i:658;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"1920x1080-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"1920x1080-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"1920x1080-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"1920x1080-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:21:"1920x1080-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(44, 66, '_wp_attached_file', '2015/02/1920x1280.jpg'),
(45, 66, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1280;s:4:"file";s:21:"2015/02/1920x1280.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"1920x1280-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"1920x1280-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:22:"1920x1280-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:22:"1920x1280-1170x780.jpg";s:5:"width";i:1170;s:6:"height";i:780;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"1920x1280-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"1920x1280-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"1920x1280-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"1920x1280-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:21:"1920x1280-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(46, 87, '_wp_attached_file', '2015/02/180x80-1.png'),
(47, 87, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:180;s:6:"height";i:80;s:4:"file";s:20:"2015/02/180x80-1.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"180x80-1-150x80.png";s:5:"width";i:150;s:6:"height";i:80;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:18:"180x80-1-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(48, 88, '_wp_attached_file', '2015/02/180x80-2.png'),
(49, 88, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:180;s:6:"height";i:80;s:4:"file";s:20:"2015/02/180x80-2.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"180x80-2-150x80.png";s:5:"width";i:150;s:6:"height";i:80;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:18:"180x80-2-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(50, 89, '_wp_attached_file', '2015/02/180x80-3.png'),
(51, 89, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:180;s:6:"height";i:80;s:4:"file";s:20:"2015/02/180x80-3.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"180x80-3-150x80.png";s:5:"width";i:150;s:6:"height";i:80;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:18:"180x80-3-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(52, 90, '_wp_attached_file', '2015/02/180x80-4.png'),
(53, 90, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:180;s:6:"height";i:80;s:4:"file";s:20:"2015/02/180x80-4.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"180x80-4-150x80.png";s:5:"width";i:150;s:6:"height";i:80;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:18:"180x80-4-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(54, 91, '_wp_attached_file', '2015/02/180x80-5.png'),
(55, 91, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:180;s:6:"height";i:80;s:4:"file";s:20:"2015/02/180x80-5.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"180x80-5-150x80.png";s:5:"width";i:150;s:6:"height";i:80;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:18:"180x80-5-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(56, 95, '_wp_attached_file', '2015/02/860x540-6.png'),
(57, 95, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:860;s:6:"height";i:540;s:4:"file";s:21:"2015/02/860x540-6.png";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"860x540-6-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"860x540-6-300x188.png";s:5:"width";i:300;s:6:"height";i:188;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"860x540-6-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"860x540-6-400x400.png";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"860x540-6-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"860x540-6-570x540.png";s:5:"width";i:570;s:6:"height";i:540;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(58, 96, '_wp_attached_file', '2015/02/860x540-1.png'),
(59, 96, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:860;s:6:"height";i:540;s:4:"file";s:21:"2015/02/860x540-1.png";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"860x540-1-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"860x540-1-300x188.png";s:5:"width";i:300;s:6:"height";i:188;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"860x540-1-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"860x540-1-400x400.png";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"860x540-1-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"860x540-1-570x540.png";s:5:"width";i:570;s:6:"height";i:540;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(60, 97, '_wp_attached_file', '2015/02/860x540-2.png'),
(61, 97, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:860;s:6:"height";i:540;s:4:"file";s:21:"2015/02/860x540-2.png";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"860x540-2-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"860x540-2-300x188.png";s:5:"width";i:300;s:6:"height";i:188;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"860x540-2-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"860x540-2-400x400.png";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"860x540-2-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"860x540-2-570x540.png";s:5:"width";i:570;s:6:"height";i:540;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(62, 98, '_wp_attached_file', '2015/02/860x540-3.png'),
(63, 98, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:860;s:6:"height";i:540;s:4:"file";s:21:"2015/02/860x540-3.png";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"860x540-3-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"860x540-3-300x188.png";s:5:"width";i:300;s:6:"height";i:188;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"860x540-3-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"860x540-3-400x400.png";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"860x540-3-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"860x540-3-570x540.png";s:5:"width";i:570;s:6:"height";i:540;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(64, 99, '_wp_attached_file', '2015/02/860x540-4.png'),
(65, 99, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:860;s:6:"height";i:540;s:4:"file";s:21:"2015/02/860x540-4.png";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"860x540-4-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"860x540-4-300x188.png";s:5:"width";i:300;s:6:"height";i:188;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"860x540-4-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"860x540-4-400x400.png";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"860x540-4-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"860x540-4-570x540.png";s:5:"width";i:570;s:6:"height";i:540;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(66, 100, '_wp_attached_file', '2015/02/860x540-5.png'),
(67, 100, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:860;s:6:"height";i:540;s:4:"file";s:21:"2015/02/860x540-5.png";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"860x540-5-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"860x540-5-300x188.png";s:5:"width";i:300;s:6:"height";i:188;s:9:"mime-type";s:9:"image/png";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"860x540-5-70x70.png";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"860x540-5-400x400.png";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"860x540-5-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"860x540-5-570x540.png";s:5:"width";i:570;s:6:"height";i:540;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(68, 106, '_wp_attached_file', '2015/02/1920x750-4.jpg'),
(69, 106, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:750;s:4:"file";s:22:"2015/02/1920x750-4.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"1920x750-4-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"1920x750-4-300x117.jpg";s:5:"width";i:300;s:6:"height";i:117;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:23:"1920x750-4-1024x400.jpg";s:5:"width";i:1024;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:23:"1920x750-4-1170x457.jpg";s:5:"width";i:1170;s:6:"height";i:457;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:20:"1920x750-4-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:22:"1920x750-4-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:22:"1920x750-4-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:22:"1920x750-4-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:22:"1920x750-4-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(70, 113, '_wp_attached_file', '2015/02/1680885692_dc9c00dba4_o.jpg'),
(71, 113, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:4000;s:6:"height";i:3000;s:4:"file";s:35:"2015/02/1680885692_dc9c00dba4_o.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"1680885692_dc9c00dba4_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"1680885692_dc9c00dba4_o-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:36:"1680885692_dc9c00dba4_o-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"1680885692_dc9c00dba4_o-1170x878.jpg";s:5:"width";i:1170;s:6:"height";i:878;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:33:"1680885692_dc9c00dba4_o-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:35:"1680885692_dc9c00dba4_o-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:35:"1680885692_dc9c00dba4_o-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:35:"1680885692_dc9c00dba4_o-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:35:"1680885692_dc9c00dba4_o-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";d:4;s:6:"credit";s:10:"Picasa 2.7";s:6:"camera";s:18:"Canon PowerShot G9";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1191584680;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"7.4";s:3:"iso";s:2:"80";s:13:"shutter_speed";s:5:"0.001";s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(72, 114, '_wp_attached_file', '2015/02/6804091227_a8791aeeb5_o.jpg'),
(73, 114, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3882;s:4:"file";s:35:"2015/02/6804091227_a8791aeeb5_o.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"6804091227_a8791aeeb5_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"6804091227_a8791aeeb5_o-300x207.jpg";s:5:"width";i:300;s:6:"height";i:207;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:36:"6804091227_a8791aeeb5_o-1024x708.jpg";s:5:"width";i:1024;s:6:"height";i:708;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"6804091227_a8791aeeb5_o-1170x809.jpg";s:5:"width";i:1170;s:6:"height";i:809;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:33:"6804091227_a8791aeeb5_o-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:35:"6804091227_a8791aeeb5_o-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:35:"6804091227_a8791aeeb5_o-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:35:"6804091227_a8791aeeb5_o-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:35:"6804091227_a8791aeeb5_o-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";d:1.8000000000000000444089209850062616169452667236328125;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1328115140;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"85";s:3:"iso";s:3:"320";s:13:"shutter_speed";s:5:"0.004";s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(74, 115, '_wp_attached_file', '2015/02/8110870840_e04ea28b02_o.jpg'),
(75, 115, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:35:"2015/02/8110870840_e04ea28b02_o.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"8110870840_e04ea28b02_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"8110870840_e04ea28b02_o-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:36:"8110870840_e04ea28b02_o-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"8110870840_e04ea28b02_o-1170x780.jpg";s:5:"width";i:1170;s:6:"height";i:780;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:33:"8110870840_e04ea28b02_o-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:35:"8110870840_e04ea28b02_o-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:35:"8110870840_e04ea28b02_o-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:35:"8110870840_e04ea28b02_o-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:35:"8110870840_e04ea28b02_o-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";d:6.29999999999999982236431605997495353221893310546875;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1350823206;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"135";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:4:"0.01";s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(76, 117, '_wp_attached_file', '2015/02/5927466661_09f793c33b_o.jpg'),
(77, 117, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1442;s:6:"height";i:1224;s:4:"file";s:35:"2015/02/5927466661_09f793c33b_o.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"5927466661_09f793c33b_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"5927466661_09f793c33b_o-300x255.jpg";s:5:"width";i:300;s:6:"height";i:255;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:36:"5927466661_09f793c33b_o-1024x869.jpg";s:5:"width";i:1024;s:6:"height";i:869;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"5927466661_09f793c33b_o-1170x993.jpg";s:5:"width";i:1170;s:6:"height";i:993;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:33:"5927466661_09f793c33b_o-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:35:"5927466661_09f793c33b_o-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:35:"5927466661_09f793c33b_o-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:35:"5927466661_09f793c33b_o-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:35:"5927466661_09f793c33b_o-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";d:4.70000000000000017763568394002504646778106689453125;s:6:"credit";s:0:"";s:6:"camera";s:11:"COOLPIX L18";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1310223717;s:9:"copyright";s:0:"";s:12:"focal_length";s:4:"17.1";s:3:"iso";s:2:"64";s:13:"shutter_speed";s:18:"0.0038461538461538";s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(78, 128, '_wp_attached_file', '2015/02/8194619272_00e363a682_o.jpg'),
(79, 128, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5504;s:6:"height";i:3146;s:4:"file";s:35:"2015/02/8194619272_00e363a682_o.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"8194619272_00e363a682_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"8194619272_00e363a682_o-300x171.jpg";s:5:"width";i:300;s:6:"height";i:171;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:36:"8194619272_00e363a682_o-1024x585.jpg";s:5:"width";i:1024;s:6:"height";i:585;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"8194619272_00e363a682_o-1170x669.jpg";s:5:"width";i:1170;s:6:"height";i:669;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:33:"8194619272_00e363a682_o-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:35:"8194619272_00e363a682_o-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:35:"8194619272_00e363a682_o-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:35:"8194619272_00e363a682_o-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:35:"8194619272_00e363a682_o-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";d:1.8000000000000000444089209850062616169452667236328125;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1353157110;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"85";s:3:"iso";s:3:"100";s:13:"shutter_speed";s:6:"0.0005";s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(80, 130, '_wp_attached_file', '2015/02/7709199338_e99a64eb22_o.jpg'),
(81, 130, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2364;s:6:"height";i:1766;s:4:"file";s:35:"2015/02/7709199338_e99a64eb22_o.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"7709199338_e99a64eb22_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"7709199338_e99a64eb22_o-300x224.jpg";s:5:"width";i:300;s:6:"height";i:224;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:36:"7709199338_e99a64eb22_o-1024x765.jpg";s:5:"width";i:1024;s:6:"height";i:765;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"7709199338_e99a64eb22_o-1170x874.jpg";s:5:"width";i:1170;s:6:"height";i:874;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:33:"7709199338_e99a64eb22_o-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:35:"7709199338_e99a64eb22_o-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:35:"7709199338_e99a64eb22_o-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:35:"7709199338_e99a64eb22_o-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:35:"7709199338_e99a64eb22_o-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(82, 138, '_wp_attached_file', '2015/02/6978490723_4e0c837e34_o.jpg');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(83, 138, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:4752;s:6:"height";i:3168;s:4:"file";s:35:"2015/02/6978490723_4e0c837e34_o.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"6978490723_4e0c837e34_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"6978490723_4e0c837e34_o-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:36:"6978490723_4e0c837e34_o-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"6978490723_4e0c837e34_o-1170x780.jpg";s:5:"width";i:1170;s:6:"height";i:780;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:33:"6978490723_4e0c837e34_o-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:35:"6978490723_4e0c837e34_o-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:35:"6978490723_4e0c837e34_o-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:35:"6978490723_4e0c837e34_o-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:35:"6978490723_4e0c837e34_o-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";d:7.0999999999999996447286321199499070644378662109375;s:6:"credit";s:11:"Tim Sackton";s:6:"camera";s:19:"Canon EOS REBEL T1i";s:7:"caption";s:87:"The Chicago Loop and the Michigan Ave bridge, seen from the plaza near the Trump Tower.";s:17:"created_timestamp";i:1331133583;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"11";s:3:"iso";s:3:"100";s:13:"shutter_speed";s:5:"0.008";s:5:"title";s:26:"Chicago in Black and White";s:11:"orientation";i:0;}}'),
(84, 140, '_wp_attached_file', '2015/02/4745573116_83f9abc0a0_o.jpg'),
(85, 140, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:4752;s:6:"height";i:3168;s:4:"file";s:35:"2015/02/4745573116_83f9abc0a0_o.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"4745573116_83f9abc0a0_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"4745573116_83f9abc0a0_o-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:36:"4745573116_83f9abc0a0_o-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"4745573116_83f9abc0a0_o-1170x780.jpg";s:5:"width";i:1170;s:6:"height";i:780;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:33:"4745573116_83f9abc0a0_o-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:35:"4745573116_83f9abc0a0_o-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:35:"4745573116_83f9abc0a0_o-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:35:"4745573116_83f9abc0a0_o-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:35:"4745573116_83f9abc0a0_o-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";d:11;s:6:"credit";s:0:"";s:6:"camera";s:13:"Canon EOS 50D";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1262349072;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"18";s:3:"iso";s:3:"100";s:13:"shutter_speed";s:6:"0.0025";s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(86, 141, '_wp_attached_file', '2015/02/9532053314_c80598f19d_o.jpg'),
(87, 141, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:4478;s:6:"height";i:3358;s:4:"file";s:35:"2015/02/9532053314_c80598f19d_o.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"9532053314_c80598f19d_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"9532053314_c80598f19d_o-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:36:"9532053314_c80598f19d_o-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"9532053314_c80598f19d_o-1170x877.jpg";s:5:"width";i:1170;s:6:"height";i:877;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:33:"9532053314_c80598f19d_o-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:35:"9532053314_c80598f19d_o-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:35:"9532053314_c80598f19d_o-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:35:"9532053314_c80598f19d_o-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:35:"9532053314_c80598f19d_o-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";d:7.0999999999999996447286321199499070644378662109375;s:6:"credit";s:0:"";s:6:"camera";s:4:"E-M5";s:7:"caption";s:22:"OLYMPUS DIGITAL CAMERA";s:17:"created_timestamp";i:1376739600;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"19";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:7:"0.00625";s:5:"title";s:22:"OLYMPUS DIGITAL CAMERA";s:11:"orientation";i:0;}}'),
(88, 142, '_wp_attached_file', '2015/02/4468871811_dabb0eda45_o.jpg'),
(89, 142, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:3888;s:6:"height";i:2592;s:4:"file";s:35:"2015/02/4468871811_dabb0eda45_o.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"4468871811_dabb0eda45_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"4468871811_dabb0eda45_o-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:36:"4468871811_dabb0eda45_o-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"4468871811_dabb0eda45_o-1170x780.jpg";s:5:"width";i:1170;s:6:"height";i:780;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:33:"4468871811_dabb0eda45_o-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:35:"4468871811_dabb0eda45_o-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:35:"4468871811_dabb0eda45_o-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:35:"4468871811_dabb0eda45_o-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:35:"4468871811_dabb0eda45_o-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";d:5.5999999999999996447286321199499070644378662109375;s:6:"credit";s:7:"unknown";s:6:"camera";s:22:"Canon EOS 400D DIGITAL";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1267805556;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"19";s:3:"iso";s:3:"100";s:13:"shutter_speed";s:4:"0.01";s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(90, 154, '_wp_attached_file', '2015/02/tweet.jpg'),
(91, 154, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:946;s:4:"file";s:17:"2015/02/tweet.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"tweet-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:17:"tweet-300x148.jpg";s:5:"width";i:300;s:6:"height";i:148;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:18:"tweet-1024x505.jpg";s:5:"width";i:1024;s:6:"height";i:505;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:18:"tweet-1170x576.jpg";s:5:"width";i:1170;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:15:"tweet-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:17:"tweet-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:17:"tweet-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:17:"tweet-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:17:"tweet-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(92, 41, '_edit_last', '1'),
(93, 41, '_thumbnail_id', '34'),
(94, 41, 'slide_template', 'default'),
(95, 41, 'nfw_sidebar_position', 'none'),
(96, 41, 'nfw_sidebar_source', 'Default Sidebar'),
(97, 41, 'nfw_header_toggle', 'on'),
(98, 41, '_wpb_vc_js_status', 'true'),
(99, 41, '_wpb_vc_js_interface_version', '0'),
(100, 41, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(101, 42, '_edit_last', '1'),
(102, 42, '_thumbnail_id', '33'),
(103, 42, '_wpb_vc_js_status', 'true'),
(104, 42, '_wpb_vc_js_interface_version', '2'),
(105, 42, 'slide_template', 'default'),
(106, 42, 'nfw_sidebar_position', 'none'),
(107, 42, 'nfw_sidebar_source', 'Default Sidebar'),
(108, 42, 'nfw_header_toggle', 'on'),
(109, 42, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(110, 43, '_edit_last', '1'),
(111, 43, '_wpb_vc_js_status', 'true'),
(112, 43, '_wpb_vc_js_interface_version', '2'),
(113, 43, 'slide_template', 'default'),
(114, 43, 'nfw_sidebar_position', 'none'),
(115, 43, 'nfw_sidebar_source', 'Default Sidebar'),
(116, 43, 'nfw_header_toggle', 'on'),
(117, 43, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(118, 43, '_thumbnail_id', '141'),
(119, 44, '_edit_last', '1'),
(120, 44, '_wpb_vc_js_status', 'true'),
(121, 44, '_wpb_vc_js_interface_version', '2'),
(122, 44, 'slide_template', 'default'),
(123, 44, 'nfw_sidebar_position', 'none'),
(124, 44, 'nfw_sidebar_source', 'Default Sidebar'),
(125, 44, 'nfw_header_toggle', 'on'),
(126, 44, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(127, 44, '_thumbnail_id', '142'),
(128, 45, '_edit_last', '1'),
(129, 45, '_thumbnail_id', '38'),
(130, 45, '_wpb_vc_js_status', 'true'),
(131, 45, '_wpb_vc_js_interface_version', '2'),
(132, 45, 'slide_template', 'default'),
(133, 45, 'nfw_sidebar_position', 'none'),
(134, 45, 'nfw_sidebar_source', 'Default Sidebar'),
(135, 45, 'nfw_header_toggle', 'on'),
(136, 45, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(137, 46, '_edit_last', '1'),
(138, 46, '_thumbnail_id', '37'),
(139, 46, '_wpb_vc_js_status', 'true'),
(140, 46, '_wpb_vc_js_interface_version', '2'),
(141, 46, 'slide_template', 'default'),
(142, 46, 'nfw_sidebar_position', 'none'),
(143, 46, 'nfw_sidebar_source', 'Default Sidebar'),
(144, 46, 'nfw_header_toggle', 'on'),
(145, 46, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(146, 47, '_edit_last', '1'),
(147, 47, '_thumbnail_id', '39'),
(148, 47, '_wpb_vc_js_status', 'true'),
(149, 47, '_wpb_vc_js_interface_version', '2'),
(150, 47, 'slide_template', 'default'),
(151, 47, 'nfw_sidebar_position', 'none'),
(152, 47, 'nfw_sidebar_source', 'Default Sidebar'),
(153, 47, 'nfw_header_toggle', 'on'),
(154, 47, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(155, 48, '_thumbnail_id', '40'),
(156, 48, '_edit_last', '1'),
(157, 48, '_wpb_vc_js_status', 'true'),
(158, 48, '_wpb_vc_js_interface_version', '2'),
(159, 48, 'slide_template', 'default'),
(160, 48, 'nfw_sidebar_position', 'none'),
(161, 48, 'nfw_sidebar_source', 'Default Sidebar'),
(162, 48, 'nfw_header_toggle', 'on'),
(163, 48, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(164, 50, '_edit_last', '1'),
(165, 50, '_wp_page_template', 'default'),
(166, 50, '_wpb_vc_js_status', 'true'),
(167, 50, '_wpb_vc_js_interface_version', '2'),
(168, 50, 'slide_template', 'default'),
(169, 50, 'nfw_sidebar_position', 'none'),
(170, 50, 'nfw_sidebar_source', 'Default Sidebar'),
(171, 50, 'nfw_header_toggle', 'off'),
(172, 50, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(173, 50, '_wpb_shortcodes_custom_css', '.vc_custom_1425032807263{padding-top: 45px !important;}.vc_custom_1425036078974{padding-bottom: 100px !important;}.vc_custom_1425044314575{padding-top: 70px !important;background-image: url(http://firstone.europadns.net/wp-content/uploads/2015/02/1920x1080.jpg?id=60) !important;}.vc_custom_1425288905080{padding-top: 80px !important;}.vc_custom_1425034086816{padding-top: 45px !important;}.vc_custom_1425033934503{padding-top: 80px !important;}.vc_custom_1425032689915{padding-top: 45px !important;}.vc_custom_1425033902127{padding-bottom: 80px !important;}.vc_custom_1424958436602{padding-top: 80px !important;padding-bottom: 110px !important;background-image: url(http://firstone.europadns.net/wp-content/uploads/2015/02/1920x750-3.jpg?id=58) !important;}.vc_custom_1425288865429{padding-top: 80px !important;}.vc_custom_1425033868346{padding-bottom: 80px !important;}.vc_custom_1426156489493{padding-top: 80px !important;padding-bottom: 80px !important;background-image: url(http://firstone.europadns.net/wp-content/uploads/2015/02/1920x1000-2.jpg?id=59) !important;}.vc_custom_1425288834781{padding-top: 80px !important;}.vc_custom_1426233315984{padding-bottom: 85px !important;}.vc_custom_1426166788401{padding-bottom: 60px !important;}.vc_custom_1426233606645{padding-top: 120px !important;padding-bottom: 85px !important;background-image: url(http://firstone.europadns.net/wp-content/uploads/2015/02/1920x750-4.jpg?id=106) !important;}'),
(174, 155, '_menu_item_type', 'custom'),
(175, 155, '_menu_item_menu_item_parent', '0'),
(176, 155, '_menu_item_object_id', '155'),
(177, 155, '_menu_item_object', 'custom'),
(178, 155, '_menu_item_target', ''),
(179, 155, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(180, 155, '_menu_item_xfn', ''),
(181, 155, '_menu_item_url', '#home_section'),
(182, 156, '_menu_item_type', 'custom'),
(183, 156, '_menu_item_menu_item_parent', '0'),
(184, 156, '_menu_item_object_id', '156'),
(185, 156, '_menu_item_object', 'custom'),
(186, 156, '_menu_item_target', ''),
(187, 156, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(188, 156, '_menu_item_xfn', ''),
(189, 156, '_menu_item_url', '#services_section'),
(190, 157, '_menu_item_type', 'custom'),
(191, 157, '_menu_item_menu_item_parent', '0'),
(192, 157, '_menu_item_object_id', '157'),
(193, 157, '_menu_item_object', 'custom'),
(194, 157, '_menu_item_target', ''),
(195, 157, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(196, 157, '_menu_item_xfn', ''),
(197, 157, '_menu_item_url', '#about_us_section'),
(198, 158, '_menu_item_type', 'custom'),
(199, 158, '_menu_item_menu_item_parent', '0'),
(200, 158, '_menu_item_object_id', '158'),
(201, 158, '_menu_item_object', 'custom'),
(202, 158, '_menu_item_target', ''),
(203, 158, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(204, 158, '_menu_item_xfn', ''),
(205, 158, '_menu_item_url', '#portfolio_section'),
(206, 159, '_menu_item_type', 'custom'),
(207, 159, '_menu_item_menu_item_parent', '0'),
(208, 159, '_menu_item_object_id', '159'),
(209, 159, '_menu_item_object', 'custom'),
(210, 159, '_menu_item_target', ''),
(211, 159, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(212, 159, '_menu_item_xfn', ''),
(213, 159, '_menu_item_url', '#blog_section'),
(214, 160, '_menu_item_type', 'custom'),
(215, 160, '_menu_item_menu_item_parent', '0'),
(216, 160, '_menu_item_object_id', '160'),
(217, 160, '_menu_item_object', 'custom'),
(218, 160, '_menu_item_target', ''),
(219, 160, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(220, 160, '_menu_item_xfn', ''),
(221, 160, '_menu_item_url', '#contact_section'),
(222, 103, '_edit_last', '1'),
(223, 103, '_wp_page_template', 'default'),
(224, 103, '_wpb_vc_js_status', 'true'),
(225, 103, '_wpb_vc_js_interface_version', '2'),
(226, 103, 'slide_template', 'default'),
(227, 103, 'nfw_sidebar_position', 'right'),
(228, 103, 'nfw_sidebar_source', 'Default Sidebar'),
(229, 103, 'nfw_header_toggle', 'on'),
(230, 103, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(231, 131, '_edit_last', '1'),
(232, 131, '_wpb_vc_js_status', 'true'),
(233, 131, '_wpb_vc_js_interface_version', '2'),
(234, 131, 'slide_template', 'default'),
(235, 131, 'nfw_sidebar_position', 'none'),
(236, 131, 'nfw_sidebar_source', 'Contact Sidebar'),
(237, 131, 'nfw_header_toggle', 'on'),
(238, 131, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(239, 131, '_thumbnail_id', '138'),
(240, 132, '_edit_last', '1'),
(241, 132, '_wpb_vc_js_status', 'true'),
(242, 132, '_wpb_vc_js_interface_version', '2'),
(243, 132, 'slide_template', 'default'),
(244, 132, 'nfw_sidebar_position', 'none'),
(245, 132, 'nfw_sidebar_source', 'Contact Sidebar'),
(246, 132, 'nfw_header_toggle', 'on'),
(247, 132, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(248, 132, '_thumbnail_id', '140'),
(249, 144, '_edit_last', '1'),
(250, 144, '_wpb_vc_js_status', 'true'),
(251, 144, '_wpb_vc_js_interface_version', '2'),
(252, 144, 'slide_template', 'default'),
(253, 144, 'nfw_sidebar_position', 'none'),
(254, 144, 'nfw_sidebar_source', 'Contact Sidebar'),
(255, 144, 'nfw_header_toggle', 'on'),
(256, 144, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(257, 144, '_thumbnail_id', '36'),
(258, 161, '_edit_last', '1'),
(259, 161, '_vc_post_settings', 'a:1:{s:7:"vc_grid";a:0:{}}'),
(260, 161, '_thumbnail_id', '117'),
(261, 161, 'slide_template', 'default'),
(262, 8, '_edit_last', '1'),
(263, 8, '_vc_post_settings', 'a:1:{s:7:"vc_grid";a:0:{}}'),
(264, 8, 'slide_template', 'default'),
(265, 8, '_thumbnail_id', '128'),
(266, 10, '_edit_last', '1'),
(267, 10, '_vc_post_settings', 'a:1:{s:7:"vc_grid";a:0:{}}'),
(268, 10, '_thumbnail_id', '115'),
(269, 10, 'slide_template', 'default'),
(270, 12, '_edit_last', '1'),
(271, 12, '_vc_post_settings', 'a:1:{s:7:"vc_grid";a:0:{}}'),
(272, 12, '_thumbnail_id', '114'),
(273, 12, 'slide_template', 'default'),
(274, 14, '_edit_last', '1'),
(275, 14, '_vc_post_settings', 'a:1:{s:7:"vc_grid";a:0:{}}'),
(276, 14, '_thumbnail_id', '113'),
(277, 14, 'slide_template', 'default'),
(278, 63, '_form', '<h3><strong>Leave a message</strong></h3>\n\n[text* your-name placeholder "name"] \n\n[email* your-email  placeholder "address"]\n\n[text* your-subject  placeholder "subject"]\n\n[textarea* your-message placeholder "message"]\n\n[submit class:btn "Send"]'),
(279, 63, '_mail', 'a:8:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:46:"[your-name] <wordpress@firstone.europadns.net>";s:4:"body";s:176:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on First One (http://firstone.europadns.net)";s:9:"recipient";s:18:"alex@europadns.com";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";b:0;s:13:"exclude_blank";b:0;}'),
(280, 63, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:44:"First One <wordpress@firstone.europadns.net>";s:4:"body";s:118:"Message Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on First One (http://firstone.europadns.net)";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:28:"Reply-To: alex@europadns.com";s:11:"attachments";s:0:"";s:8:"use_html";b:0;s:13:"exclude_blank";b:0;}'),
(281, 63, '_messages', 'a:23:{s:12:"mail_sent_ok";s:43:"Your message was sent successfully. Thanks.";s:12:"mail_sent_ng";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:16:"validation_error";s:74:"Validation errors occurred. Please confirm the fields and submit it again.";s:4:"spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:16:"invalid_required";s:34:"Please fill in the required field.";s:16:"invalid_too_long";s:23:"This input is too long.";s:17:"invalid_too_short";s:24:"This input is too short.";s:17:"captcha_not_match";s:31:"Your entered code is incorrect.";s:14:"invalid_number";s:28:"Number format seems invalid.";s:16:"number_too_small";s:25:"This number is too small.";s:16:"number_too_large";s:25:"This number is too large.";s:13:"invalid_email";s:28:"Email address seems invalid.";s:11:"invalid_url";s:18:"URL seems invalid.";s:11:"invalid_tel";s:31:"Telephone number seems invalid.";s:23:"quiz_answer_not_correct";s:27:"Your answer is not correct.";s:12:"invalid_date";s:26:"Date format seems invalid.";s:14:"date_too_early";s:23:"This date is too early.";s:13:"date_too_late";s:22:"This date is too late.";s:13:"upload_failed";s:22:"Failed to upload file.";s:24:"upload_file_type_invalid";s:30:"This file type is not allowed.";s:21:"upload_file_too_large";s:23:"This file is too large.";s:23:"upload_failed_php_error";s:38:"Failed to upload file. Error occurred.";}'),
(282, 63, '_additional_settings', ''),
(283, 63, '_locale', 'en_US'),
(284, 145, '_edit_last', '1'),
(285, 145, '_wpb_vc_js_status', 'true'),
(286, 145, '_wpb_vc_js_interface_version', '2'),
(287, 145, 'slide_template', 'default'),
(288, 145, 'nfw_sidebar_position', 'none'),
(289, 145, 'nfw_sidebar_source', 'Contact Sidebar'),
(290, 145, 'nfw_header_toggle', 'on'),
(291, 145, 'vc_teaser', 'a:2:{s:4:"data";s:115:"[{"name":"title","link":"post"},{"name":"image","image":"featured","link":"none"},{"name":"text","mode":"excerpt"}]";s:7:"bgcolor";s:0:"";}'),
(292, 145, '_thumbnail_id', '35'),
(293, 162, '_wp_attached_file', 'revslider/home-slider/1920x1280.jpg'),
(294, 162, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1280;s:4:"file";s:35:"revslider/home-slider/1920x1280.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"1920x1280-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"1920x1280-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:22:"1920x1280-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:22:"1920x1280-1170x780.jpg";s:5:"width";i:1170;s:6:"height";i:780;s:9:"mime-type";s:10:"image/jpeg";}s:15:"nfw_image_70_70";a:4:{s:4:"file";s:19:"1920x1280-70x70.jpg";s:5:"width";i:70;s:6:"height";i:70;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_400_400";a:4:{s:4:"file";s:21:"1920x1280-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_270_270";a:4:{s:4:"file";s:21:"1920x1280-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_570_680";a:4:{s:4:"file";s:21:"1920x1280-570x680.jpg";s:5:"width";i:570;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:17:"nfw_image_860_540";a:4:{s:4:"file";s:21:"1920x1280-860x540.jpg";s:5:"width";i:860;s:6:"height";i:540;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(295, 50, '_edit_lock', '1433893225:1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-06-05 17:26:31', '2015-06-05 17:26:31', 'Bem-vindo ao WordPress. Esse é o seu primeiro post. Edite-o ou exclua-o, e então comece a publicar!', 'Olá, mundo!', '', 'publish', 'open', 'open', '', 'ola-mundo', '', '', '2015-06-05 17:26:31', '2015-06-05 17:26:31', '', 0, 'http://localhost/fclb/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2015-06-05 17:26:31', '2015-06-05 17:26:31', 'Esta é uma página de exemplo. É diferente de um post porque ela ficará em um local e será exibida na navegação do seu site (na maioria dos temas). A maioria das pessoas começa com uma página de introdução aos potenciais visitantes do site. Ela pode ser assim:\n\n<blockquote>Olá! Eu sou um bike courrier de dia, ator amador à noite e este é meu blog. Eu moro em São Paulo, tenho um cachorro chamado Tonico e eu gosto de caipirinhas. (E de ser pego pela chuva.)</blockquote>\n\nou assim:\n\n<blockquote>A XYZ foi fundada em 1971 e desde então vem proporcionando produtos de qualidade a seus clientes. Localizada em Valinhos, XYZ emprega mais de 2.000 pessoas e faz várias contribuições para a comunidade local.</blockquote>\nComo um novo usuário do WordPress, você deve ir até o <a href="http://localhost/fclb/wordpress/wp-admin/">seu painel</a> para excluir essa página e criar novas páginas com seu próprio conteúdo. Divirta-se!', 'Página de Exemplo', '', 'publish', 'open', 'open', '', 'pagina-exemplo', '', '', '2015-06-05 17:26:31', '2015-06-05 17:26:31', '', 0, 'http://localhost/fclb/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2015-06-05 17:26:46', '0000-00-00 00:00:00', '', 'Rascunho automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-05 17:26:46', '0000-00-00 00:00:00', '', 0, 'http://localhost/fclb/wordpress/?p=3', 0, 'post', '', 0),
(4, 1, '2015-06-05 18:34:58', '2015-06-05 18:34:58', '<p>Seu nome (obrigatório)<br />\n    [text* your-name] </p>\n\n<p>Seu e-mail (obrigatório)<br />\n    [email* your-email] </p>\n\n<p>Assunto<br />\n    [text your-subject] </p>\n\n<p>Sua mensagem<br />\n    [textarea your-message] </p>\n\n<p>[submit "Enviar"]</p>\n[your-subject]\n[your-name] <fellypenc@gmail.com>\nDe: [your-name] <[your-email]>\nAssunto: [your-subject]\n\nCorpo da mensagem:\n[your-message]\n\n--\nEste e-mail foi enviado de um formulário de contato em Fórum de Comunicação no Legislativo Brasileiro (http://localhost/fclb/wordpress)\nfellypenc@gmail.com\nReply-To: [your-email]\n\n0\n0\n\n[your-subject]\nFórum de Comunicação no Legislativo Brasileiro <fellypenc@gmail.com>\nCorpo da mensagem:\n[your-message]\n\n--\nEste e-mail foi enviado de um formulário de contato em Fórum de Comunicação no Legislativo Brasileiro (http://localhost/fclb/wordpress)\n[your-email]\nReply-To: fellypenc@gmail.com\n\n0\n0\nSua mensagem foi enviada com sucesso. Obrigado.\nNão foi possível enviar a sua mensagem. Por favor, tente mais tarde ou contate o administrador por outro método.\nOcorreram erros de validação. Por favor confira os dados e envie novamente.\nNão foi possível enviar a sua mensagem. Por favor, tente mais tarde ou contate o administrador por outro método.\nPor favor aceite os termos para prosseguir.\nPlease fill in the required field.\nThis input is too long.\nThis input is too short.', 'Formulário de contato 1', '', 'publish', 'open', 'open', '', 'formulario-de-contato-1', '', '', '2015-06-05 18:34:58', '2015-06-05 18:34:58', '', 0, 'http://localhost/fclb/wordpress/?post_type=wpcf7_contact_form&p=4', 0, 'wpcf7_contact_form', '', 0),
(5, 1, '2015-06-05 18:42:47', '2015-06-05 18:42:47', '', 'Congresso_Nacional_-_Bras¡lia-bg', '', 'inherit', 'open', 'open', '', 'congresso_nacional_-_braslia-bg', '', '', '2015-06-05 18:42:47', '2015-06-05 18:42:47', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/06/Congresso_Nacional_-_Bras¡lia-bg.png', 0, 'attachment', 'image/png', 0),
(6, 1, '2015-06-05 18:43:41', '2015-06-05 18:43:41', '', 'logo', '', 'inherit', 'open', 'open', '', 'logo', '', '', '2015-06-05 18:43:41', '2015-06-05 18:43:41', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/06/logo.png', 0, 'attachment', 'image/png', 0),
(8, 1, '2015-02-25 12:42:06', '2015-02-25 12:42:06', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer vestibulum suscipit augue, ac condimentum quam faucibus sit amet. Sed elit urna, semper at libero non, auctor aliquet nisi. Suspendisse leo arcu, eleifend in laoreet ut, scelerisque quis nulla. Nunc lacinia et enim id ultricies. Donec vel tristique dui. Phasellus vel vehicula sapien. Duis aliquam purus vitae erat cursus, nec pellentesque purus finibus. Fusce mi sem, ullamcorper quis dignissim in, mattis ut ante. Fusce vitae enim sit amet lacus tempus faucibus. Mauris convallis sollicitudin ligula, a tincidunt libero malesuada sed. Donec posuere quam ut nulla congue gravida. Mauris venenatis arcu vel eros elementum, eu condimentum mi suscipit. Vivamus erat felis, imperdiet a purus eu, sollicitudin dapibus metus. Nulla facilisi. Maecenas ut risus porttitor, consectetur lorem maximus, aliquam felis.\n\nDuis porta lorem vel sem tristique iaculis. Aliquam commodo nisl eget consequat vehicula. Suspendisse condimentum tempor augue, ac rhoncus nisi laoreet sed. Morbi eget finibus mi. Donec facilisis suscipit nibh, in egestas enim lacinia non. Quisque et orci vitae dui vestibulum bibendum et eu massa. Sed dignissim neque id dignissim venenatis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus tellus turpis, vestibulum quis quam porta, eleifend finibus nulla. Aliquam dictum sapien eu tincidunt fringilla. Vivamus vel leo eu felis aliquet tempus.', 'Lorem ipsum dolor sit amet, non mollis ante semper elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer convallis, mauris in placerat congue, tellus urna faucibus tellus eu molestie.', 'publish', 'open', 'open', '', 'lorem-ipsum-dolor-sit-amet-non-mollis-ante-semper-elit', '', '', '2015-02-25 12:42:06', '2015-02-25 12:42:06', '', 0, 'http://firstone.europadns.net/?p=8', 0, 'post', '', 0),
(10, 1, '2015-02-25 12:43:47', '2015-02-25 12:43:47', 'Curabitur vulputate sed metus ut fringilla. Donec quis mauris vel urna sollicitudin mollis nec sed turpis. Phasellus nec auctor odio. Fusce pellentesque, ipsum quis lacinia ultricies, nunc arcu maximus velit, eget consectetur quam augue sed tellus. Curabitur mattis turpis eu interdum egestas. Vivamus eleifend ornare justo, id condimentum arcu lobortis eu. Nunc lacinia odio non pulvinar posuere. Nullam auctor sed erat sed sodales. Aenean mauris nisl, scelerisque non urna vitae, pulvinar imperdiet nisi. Duis quis elit eu velit cursus tempus. Quisque id sapien ligula. Nunc efficitur luctus ligula vitae malesuada.\n\nPraesent vestibulum eros pretium rutrum tristique. Proin vel lacus ipsum. Mauris at orci maximus, elementum erat vestibulum, aliquam nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce egestas, nisi quis rutrum aliquet, justo nulla molestie tortor, at consectetur dolor est ac risus. Nam at ornare ante. Sed purus diam, porta eget nisi vitae, varius mattis dolor. Pellentesque lacinia metus quis purus ornare, nec fermentum ex aliquet. Pellentesque aliquet, dui eu bibendum condimentum, velit est accumsan nisi, sed lobortis sapien justo vitae mauris. Curabitur ante massa, cursus eget ipsum non, consectetur consequat est. Cras ut orci nec velit iaculis feugiat. Proin eu libero pretium, consectetur magna et, pellentesque leo. Integer nunc mi, accumsan sed velit a, luctus fermentum ligula. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum sit amet venenatis elit, vel posuere lorem.', 'Maecenas iaculis arcu in egestas porttitor vel sagittis lectus', 'Donec adipiscing, lectus ut venenatis egestas, augue risus imperdiet sem, sit amet posuere tortor tellus vitae mauris in velit.', 'publish', 'open', 'open', '', 'maecenas-iaculis-arcu-in-egestas-porttitor-vel-sagittis-lectus', '', '', '2015-02-25 12:43:47', '2015-02-25 12:43:47', '', 0, 'http://firstone.europadns.net/?p=10', 0, 'post', '', 0),
(12, 1, '2015-02-25 12:45:15', '2015-02-25 12:45:15', 'Sed sed lectus pharetra dui lobortis porta. Nullam eget ultricies sem. Maecenas hendrerit nisi nec facilisis tempus. Suspendisse potenti. Suspendisse non leo quis arcu semper tempor vel quis libero. Phasellus non dolor non arcu tempor eleifend at vitae ante. Vestibulum vitae tempor dolor. Suspendisse eu venenatis urna. Donec vel est at nunc ultricies vehicula eu eget ante. Nunc et elit pretium, ullamcorper libero et, suscipit mi. Morbi in dui a quam viverra pulvinar.\n\nDuis tincidunt quis sapien non efficitur. Aenean ut eros et mauris blandit vehicula sit amet vitae nisl. Etiam maximus eros ante, ac viverra libero dictum vitae. Phasellus dictum quam tellus. Vestibulum nec pellentesque est. Nam sed sapien nec lectus suscipit vestibulum. Morbi lacinia porta nibh, ac scelerisque orci molestie vel. Nulla eget elit condimentum magna vestibulum hendrerit. Nunc vel ante egestas, porttitor erat vitae, mollis orci. Fusce elementum ornare libero at bibendum. Pellentesque mattis metus non suscipit efficitur. Cras eget arcu enim. Etiam posuere sapien in dictum scelerisque. In lorem purus, scelerisque non leo nec, accumsan porta turpis.', 'Donec sit amet enim a purus euismod cursus accumsan vitae erat', 'Donec pellentesque commodo ligula vel feugiat. Nunc at lorem pulvinar est hendrerit cursus. Phasellus interdum nec nisi vel commodo.', 'publish', 'open', 'open', '', 'donec-sit-amet-enim-a-purus-euismod-cursus-accumsan-vitae-erat', '', '', '2015-02-25 12:45:15', '2015-02-25 12:45:15', '', 0, 'http://firstone.europadns.net/?p=12', 0, 'post', '', 0),
(14, 1, '2015-02-25 12:46:16', '2015-02-25 12:46:16', 'Morbi ac nisl ac augue blandit tincidunt ut a arcu. Sed molestie ipsum id turpis sodales varius. Phasellus fermentum nunc massa, euismod luctus magna efficitur eget. Mauris a dictum eros. Ut ac ante sit amet risus faucibus semper eget nec augue. Ut posuere dictum erat sed elementum. Pellentesque a lectus eu mauris dapibus commodo a ut sem. Praesent tempus turpis in quam lobortis, ut rhoncus augue consequat.\n\nNulla eget massa enim. Vivamus sagittis non massa sit amet fermentum. Nulla iaculis erat nec mauris pretium, at molestie erat condimentum. Sed ac eros mollis mauris tincidunt egestas in quis ipsum. Nunc nec quam quis nulla imperdiet euismod non eu arcu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sed neque finibus, facilisis purus lobortis, tincidunt sem.\n\nAliquam ac eros nisi. Vestibulum eget posuere nisl, ac volutpat justo. Fusce consectetur dapibus mi, sit amet aliquam lorem imperdiet eu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id mi vehicula, congue neque vel, mollis tortor. Nunc dapibus tempus arcu ac volutpat. Sed sed maximus dolor, sed pulvinar tellus. Donec in mi nisi. Aliquam urna erat, luctus lobortis vehicula vitae, vestibulum pulvinar urna. Aenean consequat purus et scelerisque pulvinar. Donec non tortor vitae odio porttitor aliquam.', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 'Nunc a imperdiet nisl, eu gravida erat. Nam eget nisi elit. Nam ultricies turpis id magna mattis varius. Nam at condimentum sem.', 'publish', 'open', 'open', '', 'vestibulum-ante-ipsum-primis-in-faucibus-orci-luctus-et-ultrices', '', '', '2015-02-25 12:46:16', '2015-02-25 12:46:16', '', 0, 'http://firstone.europadns.net/?p=14', 0, 'post', '', 2),
(33, 1, '2015-02-26 11:15:54', '2015-02-26 11:15:54', '', '400x400-8', '', 'inherit', 'open', 'open', '', '400x400-8', '', '', '2015-02-26 11:15:54', '2015-02-26 11:15:54', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/400x400-8.png', 0, 'attachment', 'image/png', 0),
(34, 1, '2015-02-26 11:15:54', '2015-02-26 11:15:54', '', '400x400-1', '', 'inherit', 'open', 'open', '', '400x400-1', '', '', '2015-02-26 11:15:54', '2015-02-26 11:15:54', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/400x400-1.png', 0, 'attachment', 'image/png', 0),
(35, 1, '2015-02-26 11:15:55', '2015-02-26 11:15:55', '', '400x400-2', '', 'inherit', 'open', 'open', '', '400x400-2', '', '', '2015-02-26 11:15:55', '2015-02-26 11:15:55', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/400x400-2.png', 0, 'attachment', 'image/png', 0),
(36, 1, '2015-02-26 11:15:56', '2015-02-26 11:15:56', '', '400x400-3', '', 'inherit', 'open', 'open', '', '400x400-3', '', '', '2015-02-26 11:15:56', '2015-02-26 11:15:56', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/400x400-3.png', 0, 'attachment', 'image/png', 0),
(37, 1, '2015-02-26 11:15:57', '2015-02-26 11:15:57', '', '400x400-4', '', 'inherit', 'open', 'open', '', '400x400-4', '', '', '2015-02-26 11:15:57', '2015-02-26 11:15:57', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/400x400-4.png', 0, 'attachment', 'image/png', 0),
(38, 1, '2015-02-26 11:15:57', '2015-02-26 11:15:57', '', '400x400-5', '', 'inherit', 'open', 'open', '', '400x400-5', '', '', '2015-02-26 11:15:57', '2015-02-26 11:15:57', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/400x400-5.png', 0, 'attachment', 'image/png', 0),
(39, 1, '2015-02-26 11:15:58', '2015-02-26 11:15:58', '', '400x400-6', '', 'inherit', 'open', 'open', '', '400x400-6', '', '', '2015-02-26 11:15:58', '2015-02-26 11:15:58', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/400x400-6.png', 0, 'attachment', 'image/png', 0),
(40, 1, '2015-02-26 11:15:59', '2015-02-26 11:15:59', '', '400x400-7', '', 'inherit', 'open', 'open', '', '400x400-7', '', '', '2015-02-26 11:15:59', '2015-02-26 11:15:59', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/400x400-7.png', 0, 'attachment', 'image/png', 0),
(41, 1, '2015-02-26 11:16:46', '2015-02-26 11:16:46', '[vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="BROCHURE"][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_images_carousel images="95,97,100,96,99" onclick="custom_link" custom_links_target="_self" mode="horizontal" speed="5000" slides_per_view="1" autoplay="yes" hide_prev_next_buttons="yes" wrap="yes" custom_links="#,#,#,#,#" img_size="full"][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>General Description</h3>\nDonec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula. Pellentesque id elementum orci.\n<h3>Client</h3>\nFor: Diamond Inc.\nCategory: Print Design\nDate Start: 28 - 01 - 2014\nDate Finished: 15 - 02 - 2014\nURL: www.yourclientsite.com[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3>Skills Used</h3>\n[/vc_column_text][nfw_progress_bar nfw_progress_bar_data_width="76"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>What the client say.</h3>\n[/vc_column_text][nfw_testimonial nfw_testimonial_name="John Wilson Doe" nfw_testimonial_image="55"]Quisque ullamcorper pretium turpis, iaculis lectus euismod alea phasellus at quam fringilla, rutrum nisl ac dia, porta arcu. Pellentesque ac venenatis leo nec odio dignissim eros eu.[/nfw_testimonial][/vc_column][/vc_row]', 'Lorem ipsum dolor', '', 'publish', 'closed', 'closed', '', 'lorem-ipsum-dolor', '', '', '2015-02-26 11:16:46', '2015-02-26 11:16:46', '', 0, 'http://firstone.europadns.net/?post_type=portfolio&amp;p=41', 0, 'portfolio', '', 0),
(42, 1, '2015-02-26 11:17:19', '2015-02-26 11:17:19', '[vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="BROCHURE"][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_images_carousel images="95,97,100,96,99" onclick="custom_link" custom_links_target="_self" mode="horizontal" speed="5000" slides_per_view="1" autoplay="yes" hide_prev_next_buttons="yes" wrap="yes" custom_links="#,#,#,#,#" img_size="full"][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>General Description</h3>\nDonec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula. Pellentesque id elementum orci.\n<h3>Client</h3>\nFor: Diamond Inc.\nCategory: Print Design\nDate Start: 28 - 01 - 2014\nDate Finished: 15 - 02 - 2014\nURL: www.yourclientsite.com[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3>Skills Used</h3>\n[/vc_column_text][nfw_progress_bar nfw_progress_bar_data_width="76"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>What the client say.</h3>\n[/vc_column_text][nfw_testimonial nfw_testimonial_name="John Wilson Doe" nfw_testimonial_image="55"]Quisque ullamcorper pretium turpis, iaculis lectus euismod alea phasellus at quam fringilla, rutrum nisl ac dia, porta arcu. Pellentesque ac venenatis leo nec odio dignissim eros eu.[/nfw_testimonial][/vc_column][/vc_row]', 'Vestibulum posuere', '', 'publish', 'closed', 'closed', '', 'vestibulum-posuere', '', '', '2015-02-26 11:17:19', '2015-02-26 11:17:19', '', 0, 'http://firstone.europadns.net/?post_type=portfolio&amp;p=42', 0, 'portfolio', '', 0),
(43, 1, '2015-02-26 11:17:41', '2015-02-26 11:17:41', '[vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="BROCHURE"][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_images_carousel images="95,97,100,96,99" onclick="custom_link" custom_links_target="_self" mode="horizontal" speed="5000" slides_per_view="1" autoplay="yes" hide_prev_next_buttons="yes" wrap="yes" custom_links="#,#,#,#,#" img_size="full"][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>General Description</h3>\nDonec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula. Pellentesque id elementum orci.\n<h3>Client</h3>\nFor: Diamond Inc.\nCategory: Print Design\nDate Start: 28 - 01 - 2014\nDate Finished: 15 - 02 - 2014\nURL: www.yourclientsite.com[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3>Skills Used</h3>\n[/vc_column_text][nfw_progress_bar nfw_progress_bar_data_width="76"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>What the client say.</h3>\n[/vc_column_text][nfw_testimonial nfw_testimonial_name="John Wilson Doe" nfw_testimonial_image="55"]Quisque ullamcorper pretium turpis, iaculis lectus euismod alea phasellus at quam fringilla, rutrum nisl ac dia, porta arcu. Pellentesque ac venenatis leo nec odio dignissim eros eu.[/nfw_testimonial][/vc_column][/vc_row]', 'Phasellus vitae justo', '', 'publish', 'closed', 'closed', '', 'phasellus-vitae-justo', '', '', '2015-02-26 11:17:41', '2015-02-26 11:17:41', '', 0, 'http://firstone.europadns.net/?post_type=portfolio&amp;p=43', 0, 'portfolio', '', 0),
(44, 1, '2015-02-26 11:18:06', '2015-02-26 11:18:06', '[vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="BROCHURE"][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_images_carousel images="95,97,100,96,99" onclick="custom_link" custom_links_target="_self" mode="horizontal" speed="5000" slides_per_view="1" autoplay="yes" hide_prev_next_buttons="yes" wrap="yes" custom_links="#,#,#,#,#" img_size="full"][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>General Description</h3>\nDonec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula. Pellentesque id elementum orci.\n<h3>Client</h3>\nFor: Diamond Inc.\nCategory: Print Design\nDate Start: 28 - 01 - 2014\nDate Finished: 15 - 02 - 2014\nURL: www.yourclientsite.com[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3>Skills Used</h3>\n[/vc_column_text][nfw_progress_bar nfw_progress_bar_data_width="76"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>What the client say.</h3>\n[/vc_column_text][nfw_testimonial nfw_testimonial_name="John Wilson Doe" nfw_testimonial_image="55"]Quisque ullamcorper pretium turpis, iaculis lectus euismod alea phasellus at quam fringilla, rutrum nisl ac dia, porta arcu. Pellentesque ac venenatis leo nec odio dignissim eros eu.[/nfw_testimonial][/vc_column][/vc_row]', 'Curabitur non orci', '', 'publish', 'closed', 'closed', '', 'curabitur-non-orci', '', '', '2015-02-26 11:18:06', '2015-02-26 11:18:06', '', 0, 'http://firstone.europadns.net/?post_type=portfolio&amp;p=44', 0, 'portfolio', '', 0),
(45, 1, '2015-02-26 11:18:43', '2015-02-26 11:18:43', '[vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="BROCHURE"][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_images_carousel images="95,97,100,96,99" onclick="custom_link" custom_links_target="_self" mode="horizontal" speed="5000" slides_per_view="1" autoplay="yes" hide_prev_next_buttons="yes" wrap="yes" custom_links="#,#,#,#,#" img_size="full"][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>General Description</h3>\nDonec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula. Pellentesque id elementum orci.\n<h3>Client</h3>\nFor: Diamond Inc.\nCategory: Print Design\nDate Start: 28 - 01 - 2014\nDate Finished: 15 - 02 - 2014\nURL: www.yourclientsite.com[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3>Skills Used</h3>\n[/vc_column_text][nfw_progress_bar nfw_progress_bar_data_width="76"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>What the client say.</h3>\n[/vc_column_text][nfw_testimonial nfw_testimonial_name="John Wilson Doe" nfw_testimonial_image="55"]Quisque ullamcorper pretium turpis, iaculis lectus euismod alea phasellus at quam fringilla, rutrum nisl ac dia, porta arcu. Pellentesque ac venenatis leo nec odio dignissim eros eu.[/nfw_testimonial][/vc_column][/vc_row]', 'Aliquam erat volutpat', '', 'publish', 'closed', 'closed', '', 'aliquam-erat-volutpat', '', '', '2015-02-26 11:18:43', '2015-02-26 11:18:43', '', 0, 'http://firstone.europadns.net/?post_type=portfolio&amp;p=45', 0, 'portfolio', '', 0),
(46, 1, '2015-02-26 11:19:23', '2015-02-26 11:19:23', '[vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="BROCHURE"][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_images_carousel images="95,97,100,96,99" onclick="custom_link" custom_links_target="_self" mode="horizontal" speed="5000" slides_per_view="1" autoplay="yes" hide_prev_next_buttons="yes" wrap="yes" custom_links="#,#,#,#,#" img_size="full"][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>General Description</h3>\nDonec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula. Pellentesque id elementum orci.\n<h3>Client</h3>\nFor: Diamond Inc.\nCategory: Print Design\nDate Start: 28 - 01 - 2014\nDate Finished: 15 - 02 - 2014\nURL: www.yourclientsite.com[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3>Skills Used</h3>\n[/vc_column_text][nfw_progress_bar nfw_progress_bar_data_width="76"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>What the client say.</h3>\n[/vc_column_text][nfw_testimonial nfw_testimonial_name="John Wilson Doe" nfw_testimonial_image="55"]Quisque ullamcorper pretium turpis, iaculis lectus euismod alea phasellus at quam fringilla, rutrum nisl ac dia, porta arcu. Pellentesque ac venenatis leo nec odio dignissim eros eu.[/nfw_testimonial][/vc_column][/vc_row]', 'Nulla egestas ligula', '', 'publish', 'closed', 'closed', '', 'nulla-egestas-ligula', '', '', '2015-02-26 11:19:23', '2015-02-26 11:19:23', '', 0, 'http://firstone.europadns.net/?post_type=portfolio&amp;p=46', 0, 'portfolio', '', 0),
(47, 1, '2015-02-26 11:19:46', '2015-02-26 11:19:46', '[vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="BROCHURE"][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_images_carousel images="95,97,100,96,99" onclick="custom_link" custom_links_target="_self" mode="horizontal" speed="5000" slides_per_view="1" autoplay="yes" hide_prev_next_buttons="yes" wrap="yes" custom_links="#,#,#,#,#" img_size="full"][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>General Description</h3>\nDonec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula. Pellentesque id elementum orci.\n<h3>Client</h3>\nFor: Diamond Inc.\nCategory: Print Design\nDate Start: 28 - 01 - 2014\nDate Finished: 15 - 02 - 2014\nURL: www.yourclientsite.com[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3>Skills Used</h3>\n[/vc_column_text][nfw_progress_bar nfw_progress_bar_data_width="76"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>What the client say.</h3>\n[/vc_column_text][nfw_testimonial nfw_testimonial_name="John Wilson Doe" nfw_testimonial_image="55"]Quisque ullamcorper pretium turpis, iaculis lectus euismod alea phasellus at quam fringilla, rutrum nisl ac dia, porta arcu. Pellentesque ac venenatis leo nec odio dignissim eros eu.[/nfw_testimonial][/vc_column][/vc_row]', 'Sed placerat felis', 'Donec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula.', 'publish', 'closed', 'closed', '', 'sed-placerat-felis', '', '', '2015-02-26 11:19:46', '2015-02-26 11:19:46', '', 0, 'http://firstone.europadns.net/?post_type=portfolio&amp;p=47', 0, 'portfolio', '', 0),
(48, 1, '2015-02-26 11:20:06', '2015-02-26 11:20:06', '[vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="BROCHURE"][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_images_carousel images="95,97,100,96,99" onclick="custom_link" custom_links_target="_self" mode="horizontal" speed="5000" slides_per_view="1" autoplay="yes" hide_prev_next_buttons="yes" wrap="yes" custom_links="#,#,#,#,#" img_size="full"][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>General Description</h3>\nDonec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula. Pellentesque id elementum orci.\n<h3>Client</h3>\nFor: Diamond Inc.\nCategory: Print Design\nDate Start: 28 - 01 - 2014\nDate Finished: 15 - 02 - 2014\nURL: www.yourclientsite.com[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3>Skills Used</h3>\n[/vc_column_text][nfw_progress_bar nfw_progress_bar_data_width="76"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>What the client say.</h3>\n[/vc_column_text][nfw_testimonial nfw_testimonial_name="John Wilson Doe" nfw_testimonial_image="55"]Quisque ullamcorper pretium turpis, iaculis lectus euismod alea phasellus at quam fringilla, rutrum nisl ac dia, porta arcu. Pellentesque ac venenatis leo nec odio dignissim eros eu.[/nfw_testimonial][/vc_column][/vc_row]', 'Curabitur dolor purus', '', 'publish', 'closed', 'closed', '', 'curabitur-dolor-purus', '', '', '2015-02-26 11:20:06', '2015-02-26 11:20:06', '', 0, 'http://firstone.europadns.net/?post_type=portfolio&amp;p=48', 0, 'portfolio', '', 0),
(50, 1, '2015-02-26 12:37:40', '2015-02-26 12:37:40', '[vc_row nfw_row_full_width="yes" nfw_row_anchor="home_section"][vc_column width="1/1"][rev_slider_vc alias="home-slider"][/vc_column][/vc_row][vc_row nfw_row_anchor="services_section" css=".vc_custom_1425032807263{padding-top: 45px !important;}"][vc_column width="1/1"][nfw_headlines nfw_headline_title="SERVICES" nfw_headline_details="LOREM IPSUM DOLOR SIT AMET CONSECTETUR ADIPISCING ELIT MAECENAS VEL\nLIBERO NON METUS SODALES PORTA ID EGET DIAM MAURIS ALIQUET."][/vc_column][/vc_row][vc_row][vc_column width="1/2"][nfw_icon_boxes nfw_icon_box_title="Custom Tailored Visual Composer" nfw_icon_box_link="url:%23|title:read%20more|" nfw_icon_box_icon="ifc-month_view"]Ut mollis semper ante, nec fringilla nisi sempert ellus. Nam congue, quam at tempor feugiat, turpis tellus egestas sem, et porttitor dui nisl non netus et arcu.[/nfw_icon_boxes][/vc_column][vc_column width="1/2"][nfw_icon_boxes nfw_icon_box_title="Flexible Page and Sidebar Manger" nfw_icon_box_link="url:%23|title:read%20more|" nfw_icon_box_icon="ifc-expand"]Donec varius condimentum felis, quis sagittis elit posuere posuere. Mauris sit amet aliquam leo. Nam vel pulvinar sem. Sed eu ligula netus et odio quis.[/nfw_icon_boxes][/vc_column][/vc_row][vc_row][vc_column width="1/2"][nfw_icon_boxes nfw_icon_box_title="Powerful Theme Options Panel" nfw_icon_box_link="url:%23|title:read%20more|" nfw_icon_box_icon="ifc-settings3"]Etiam pulvinar leo velit, at elementum odio varius et. Proin ut ultricies massa, non lacinia metus. Pellentesque habitant morbi tristique senectus et net.[/nfw_icon_boxes][/vc_column][vc_column width="1/2"][nfw_icon_boxes nfw_icon_box_title="Demo Content included" nfw_icon_box_link="url:%23|title:read%20more|" nfw_icon_box_icon="ifc-download"]Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In interdum ante netus et gravida iaculis habitant morbi.[/nfw_icon_boxes][/vc_column][/vc_row][vc_row css=".vc_custom_1425036078974{padding-bottom: 100px !important;}"][vc_column width="1/1"][nfw_button_formats nfw_button_formats_center="center" nfw_button_formats_link="url:%23|title:DISCOVER%20MORE|" nfw_button_formats_alt="alt"][/vc_column][/vc_row][vc_row font_color="#000000" css=".vc_custom_1425044314575{padding-top: 70px !important;background-image: url(http://localhost/fclb/wordpress/wp-content/uploads/2015/02/1920x1080.jpg?id=60) !important;}" nfw_row_parallax="yes"][vc_column width="1/1"][nfw_headlines nfw_headline_title="WHAT WILL YOU GET"][nfw_previewer_container][nfw_previewer_element nfw_previewer_title="WordPress Theme" nfw_previewer_image="96"][nfw_previewer_element nfw_previewer_title="Theme Documentation" nfw_previewer_image="97"][nfw_previewer_element nfw_previewer_title="Demo content" nfw_previewer_image="98"][nfw_previewer_element nfw_previewer_title="Visual Composer" nfw_previewer_image="99"][nfw_previewer_element nfw_previewer_title="Revolution Slider" nfw_previewer_image="100"][nfw_previewer_element nfw_previewer_title="Html and Psd Sources" nfw_previewer_image="95"][/nfw_previewer_container][/vc_column][/vc_row][vc_row nfw_row_anchor="about_us_section" css=".vc_custom_1425288905080{padding-top: 80px !important;}"][vc_column width="1/1"][nfw_headlines nfw_headline_title="ABOUT US" nfw_headline_details="LOREM IPSUM DOLOR SIT AMET CONSECTETUR ADIPISCING ELIT MAECENAS VEL\nLIBERO NON METUS SODALES PORTA ID EGET DIAM MAURIS ALIQUET."][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3 class="text-uppercase"><strong>WHAT WE BELIVE</strong></h3>\n<h1 class="text-uppercase">SUCCESS IS NOT FINAL, FAILURE IS NOT FATAL. IT IS THE COURAGE TO CONTINUE THAT COUNTS.</h1>\n[/vc_column_text][/vc_column][vc_column width="1/2"][vc_column_text]Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada elementum neque, ornare tincidunt libero venenatis id. Morbi quis elit eget ante malesuada volutpat eget iaculis nulla. Proin varius lacinia nunc, vel consequat diam dignissim ac. Aliquam eleifend eros eget massa porttitor.\n\n<strong>Aliquam pharetra, leo rutrum viverra iaculis</strong>\nAliquam pharetra, leo rutrum viverra iaculis, eros magna vestibulum leo, nec accumsan purus enim fermentum leo. Pellentesque faucibus eros luctus euismod suscipit. Donec leo mauris, iaculis id sagittis sed, facilisis ut ligula. Vestibulum non leo sit amet lacus posuere molestie vel non risus. Nunc porta erat in tempor viverra. Vivamus non nulla sed turpis pretium aliquet.[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/4"][nfw_milestones nfw_milestone_stop="292" nfw_milestone_speed="2000" nfw_milestone_icon="ifc-user_male3"]TEAM MEMBER[/nfw_milestones][/vc_column][vc_column width="1/4"][nfw_milestones nfw_milestone_stop="844" nfw_milestone_speed="2000" nfw_milestone_icon="ifc-business"]PROJECTS[/nfw_milestones][/vc_column][vc_column width="1/4"][nfw_milestones nfw_milestone_stop="1385" nfw_milestone_speed="2000" nfw_milestone_icon="ifc-message"]SUBSCRIBED USERS[/nfw_milestones][/vc_column][vc_column width="1/4"][nfw_milestones nfw_milestone_stop="6" nfw_milestone_speed="2000" nfw_milestone_icon="ifc-map_marker"]OFFICES[/nfw_milestones][/vc_column][/vc_row][vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="WE GOT SKILLS" nfw_headline_details="LOREM IPSUM DOLOR SIT AMET CONSECTETUR ADIPISCING ELIT MAECENAS VEL\nLIBERO NON METUS SODALES PORTA ID EGET DIAM MAURIS ALIQUET."][/vc_column][/vc_row][vc_row][vc_column width="6/12"][nfw_progress_bar nfw_progress_bar_data_width="70"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="3/12"][nfw_pie_chart nfw_pie_chart_text="CSS3" nfw_pie_chart_percent="76" nfw_pie_chart_linewidth="8" nfw_pie_chart_barsize="270" nfw_data_barcolor="#2a2a2a" nfw_data_trackcolor="#e0e0e0"][/vc_column][vc_column width="3/12"][nfw_pie_chart nfw_pie_chart_text="HTML5" nfw_pie_chart_percent="93" nfw_pie_chart_linewidth="8" nfw_pie_chart_barsize="270" nfw_data_barcolor="#2a2a2a" nfw_data_trackcolor="#e0e0e0"][/vc_column][/vc_row][vc_row css=".vc_custom_1425034086816{padding-top: 45px !important;}"][vc_column width="1/1"][nfw_headlines nfw_headline_title="MEET OUR TEAM" nfw_headline_details="LOREM IPSUM DOLOR SIT AMET CONSECTETUR ADIPISCING ELIT MAECENAS VEL\nLIBERO NON METUS SODALES PORTA ID EGET DIAM MAURIS ALIQUET."][/vc_column][/vc_row][vc_row][vc_column width="1/4"][nfw_team_member nfw_team_member_name="John Doe" nfw_team_member_job="Graphic Designer" nfw_team_member_facebook="https://www.youtube.com/" nfw_team_member_twitter="https://www.youtube.com/" nfw_team_member_google_plus="https://www.youtube.com/" nfw_team_member_image="53"][/vc_column][vc_column width="1/4"][nfw_team_member nfw_team_member_name="Jessica Smith" nfw_team_member_job="Acount Manager" nfw_team_member_image="54" nfw_team_member_linkedin="https://www.youtube.com/" nfw_team_member_youtube="https://www.youtube.com/" nfw_team_member_pinteres="https://www.youtube.com/"][/vc_column][vc_column width="1/4"][nfw_team_member nfw_team_member_name="John Simpson" nfw_team_member_job="General Manager" nfw_team_member_facebook="https://www.youtube.com/" nfw_team_member_twitter="https://www.youtube.com/" nfw_team_member_google_plus="https://www.youtube.com/" nfw_team_member_image="55"][/vc_column][vc_column width="1/4"][nfw_team_member nfw_team_member_name="Michelle Smith" nfw_team_member_job="Web Designer" nfw_team_member_image="52" nfw_team_member_linkedin="https://www.youtube.com/" nfw_team_member_youtube="https://www.youtube.com/" nfw_team_member_pinteres="https://www.youtube.com/"][/vc_column][/vc_row][vc_row css=".vc_custom_1425033934503{padding-top: 80px !important;}"][vc_column width="1/1"][nfw_headlines nfw_headline_title="PORTFOLIO"][/vc_column][/vc_row][vc_row nfw_row_full_width="yes" nfw_row_anchor="portfolio_section"][vc_column width="1/1"][nfw_portfolio nfw_portfolio_max_number="8" nfw_portfolio_all_text="All" nfw_portfolio_loadmore="yes" nfw_portfolio_loadmore_text="Load More" nfw_portfolio_load_number="4"][/vc_column][/vc_row][vc_row nfw_row_anchor="blog_section" css=".vc_custom_1425032689915{padding-top: 45px !important;}"][vc_column width="1/1"][nfw_headlines nfw_headline_title="BLOG" nfw_headline_details="LOREM IPSUM DOLOR SIT AMET CONSECTETUR ADIPISCING ELIT MAECENAS VEL\nLIBERO NON METUS SODALES PORTA ID EGET DIAM MAURIS ALIQUET."][/vc_column][/vc_row][vc_row css=".vc_custom_1425033902127{padding-bottom: 80px !important;}"][vc_column width="1/1"][nfw_portfolio_latest nfw_latest_posts_count="5"][/vc_column][/vc_row][vc_row css=".vc_custom_1424958436602{padding-top: 80px !important;padding-bottom: 110px !important;background-image: url(http://localhost/fclb/wordpress/wp-content/uploads/2015/02/1920x750-3.jpg?id=58) !important;}" nfw_row_parallax="yes"][vc_column width="1/1"][vc_row_inner][vc_column_inner width="1/1"][nfw_testimonial_slider_container][nfw_testimonial_element nfw_testimonial_name="JOHN MERCADOR" nfw_testimonial_image="53"]"Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut vitae metus magna. Integer ac viverra nunc. Duis eu eleifend nulla. Nunc vel pellentesque turpis. Suspendisse faucibus rutrum mi, non posuere mauris porttitor et. Praesent ipsum eros, congue a dapibus vitae, suscipit nec magna. Nullam sodales turpis sit amet dolor vulputate, nec ornare elit dapibus. Etiam facilisis, dolor at ornare porttitor, urna quam volutpat nibh"[/nfw_testimonial_element][nfw_testimonial_element nfw_testimonial_name="JESSICA SMITH" nfw_testimonial_image="54"]"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean id commodo urna, nec tempor nibh. Duis est est, suscipit non ipsum a, pellentesque porttitor risus. Vivamus velit magna, tincidunt ut fermentum sed, fringilla eu massa. Duis in tortor tortor. Morbi id rutrum eros. Praesent nulla leo, volutpat eget magna euismod, iaculis placerat massa augue metus porttitor eros."[/nfw_testimonial_element][nfw_testimonial_element nfw_testimonial_name="HOMER SMITH" nfw_testimonial_image="55"]"Etiam eros nisi, tincidunt non consequat in, tristique vitae nibh. Proin molestie hendrerit orci eu porta. Fusce at nunc varius, molestie ligula at, faucibus ante. Suspendisse magna turpis, pharetra id luctus sit amet, ultricies eu neque. Pellentesque aliquam, tortor ut egestas suscipit, nisl urna mattis diam, et consectetur turpis lorem et metus. Aliquam convallis ac nisi et tristique."[/nfw_testimonial_element][nfw_testimonial_element nfw_testimonial_name="MICHELLE SIMPSON" nfw_testimonial_image="52"]"Suspendisse vel mi eu diam vestibulum ultrices. Sed tempus quam tellus, et ultrices urna fringilla at. Nulla condimentum convallis sem, non pretium felis dignissim vitae. Aenean sit amet blandit eros. Morbi non tristique neque. Aliquam tincidunt elementum lectus, quis venenatis nunc ullamcorper at. Aliquam ut diam lorem. Etiam blandit elit vel enim viverra, ut sodales urna blandit."[/nfw_testimonial_element][/nfw_testimonial_slider_container][/vc_column_inner][/vc_row_inner][/vc_column][/vc_row][vc_row css=".vc_custom_1425288865429{padding-top: 80px !important;}"][vc_column width="1/1"][nfw_headlines nfw_headline_title="PRICING" nfw_headline_details="LOREM IPSUM DOLOR SIT AMET CONSECTETUR ADIPISCING ELIT MAECENAS VEL\nLIBERO NON METUS SODALES PORTA ID EGET DIAM MAURIS ALIQUET."][/vc_column][/vc_row][vc_row css=".vc_custom_1425033868346{padding-bottom: 80px !important;}"][vc_column width="1/4"][nfw_pricing_table nfw_pricing_table_name="BASIC" nfw_pricing_table_price="$29.99" nfw_pricing_table_specifications="FIRST DESCRIPTION LINE\nSECOND DESCRIPTION LINE\nANOTHER DESCRIPTION LINE\nLAST DESCRIPTION LINE" nfw_pricing_table_link="url:%23|title:ORDER%20NOW|"][/vc_column][vc_column width="1/4"][nfw_pricing_table nfw_pricing_table_name="MEDIUM" nfw_pricing_table_price="$49.99" nfw_pricing_table_link="url:%23|title:ORDER%20NOW|" nfw_pricing_table_specifications="FIRST DESCRIPTION LINE\nSECOND DESCRIPTION LINE\nANOTHER DESCRIPTION LINE\nLAST DESCRIPTION LINE"][/vc_column][vc_column width="1/4"][nfw_pricing_table nfw_pricing_table_name="ADVANCE" nfw_pricing_table_price="$69.99" nfw_pricing_table_link="url:%23|title:ORDER%20NOW|" nfw_pricing_table_specifications="FIRST DESCRIPTION LINE\nSECOND DESCRIPTION LINE\nANOTHER DESCRIPTION LINE\nLAST DESCRIPTION LINE"][/vc_column][vc_column width="1/4"][nfw_pricing_table nfw_pricing_table_name="PROMO" nfw_pricing_table_price="$19.99" nfw_pricing_table_link="url:%23|title:ORDER%20NOW|" nfw_pricing_table_specifications="FIRST DESCRIPTION LINE\nSECOND DESCRIPTION LINE\nANOTHER DESCRIPTION LINE\nLAST DESCRIPTION LINE"][/vc_column][/vc_row][vc_row css=".vc_custom_1426156489493{padding-top: 80px !important;padding-bottom: 80px !important;background-image: url(http://localhost/fclb/wordpress/wp-content/uploads/2015/02/1920x1000-2.jpg?id=59) !important;}" nfw_row_parallax="yes"][vc_column width="1/1"][vc_row_inner][vc_column_inner width="1/1"][nfw_headlines nfw_headline_title="CLIENTS" nfw_headline_details="LOREM IPSUM DOLOR SIT AMET CONSECTETUR ADIPISCING ELIT MAECENAS VEL\nLIBERO NON METUS SODALES PORTA ID EGET DIAM MAURIS ALIQUET."][/vc_column_inner][/vc_row_inner][vc_row_inner][vc_column_inner width="3/12"][vc_single_image image="91" border_color="grey" img_link_target="_self" img_size="full" alignment="center"][/vc_column_inner][vc_column_inner width="2/12"][vc_single_image image="87" border_color="grey" img_link_target="_self" img_size="full" alignment="center"][/vc_column_inner][vc_column_inner width="2/12"][vc_single_image image="88" border_color="grey" img_link_target="_self" img_size="full" alignment="center"][/vc_column_inner][vc_column_inner width="2/12"][vc_single_image image="89" border_color="grey" img_link_target="_self" img_size="full" alignment="center"][/vc_column_inner][vc_column_inner width="3/12"][vc_single_image image="90" border_color="grey" img_link_target="_self" img_size="full" alignment="center"][/vc_column_inner][/vc_row_inner][/vc_column][/vc_row][vc_row nfw_row_anchor="contact_section" css=".vc_custom_1425288834781{padding-top: 80px !important;}"][vc_column width="1/1"][nfw_headlines nfw_headline_title="CONTACT" nfw_headline_details="LOREM IPSUM DOLOR SIT AMET CONSECTETUR ADIPISCING ELIT MAECENAS VEL\nLIBERO NON METUS SODALES PORTA ID EGET DIAM MAURIS ALIQUET."][/vc_column][/vc_row][vc_row css=".vc_custom_1426233315984{padding-bottom: 85px !important;}"][vc_column width="1/1"][vc_gmaps link="#E-8_JTNDaWZyYW1lJTIwc3JjJTNEJTIyaHR0cHMlM0ElMkYlMkZ3d3cuZ29vZ2xlLmNvbSUyRm1hcHMlMkZlbWJlZCUzRnBiJTNEJTIxMW0xNCUyMTFtMTIlMjExbTMlMjExZDk3MTMuMTU3NTcyMjg5MDQ3JTIxMmQxMy40MDc3MTI4MjA0MzcyOTclMjEzZDUyLjUxMDEwMTY1NjM4Nzc3NSUyMTJtMyUyMTFmMCUyMTJmMCUyMTNmMCUyMTNtMiUyMTFpMTAyNCUyMTJpNzY4JTIxNGYxMy4xJTIxNWUwJTIxM20yJTIxMXNybyUyMTJzJTIxNHYxNDI2MjMyOTcxMzQwJTIyJTIwd2lkdGglM0QlMjI2MDAlMjIlMjBoZWlnaHQlM0QlMjI0NTAlMjIlMjBmcmFtZWJvcmRlciUzRCUyMjAlMjIlMjBzdHlsZSUzRCUyMmJvcmRlciUzQTAlMjIlM0UlM0MlMkZpZnJhbWUlM0U=" size="400"][/vc_column][/vc_row][vc_row css=".vc_custom_1426166788401{padding-bottom: 60px !important;}"][vc_column width="1/3"][vc_column_text]\n<h3><strong>Where you can find us?</strong></h3>\n&nbsp;\n\nEtiam in tincidunt libero, id portaquisque venenatis tortor quis convallis consectetur quisque pretium leo et rutrum dapibus. Donec nec pharetra enim, imperdiet massa. Nulla tempor consectetur turpisnec.[/vc_column_text][vc_widget_sidebar sidebar_id="sidebar-1"][/vc_column][vc_column width="1/3"][contact-form-7 id="63"][/vc_column][vc_column width="1/3"][vc_column_text]\n<h3><strong>Get in touch on social networks</strong></h3>\n&nbsp;\n\nEtiam in tincidunt libero, id portaquisque venenatis tortor quis convallis consectetur quisque.[/vc_column_text][nfw_social_media nfw_social_icon="fa fa-facebook" nfw_social_link="https://www.youtube.com/"][nfw_social_media nfw_social_icon="fa fa-twitter" nfw_social_link="https://www.youtube.com/"][nfw_social_media nfw_social_icon="fa fa-google-plus" nfw_social_link="https://www.youtube.com/"][nfw_social_media nfw_social_icon="fa fa-vimeo-square" nfw_social_link="https://www.youtube.com/"][nfw_social_media nfw_social_icon="fa fa-flickr" nfw_social_link="https://www.youtube.com/"][/vc_column][/vc_row][vc_row css=".vc_custom_1426233606645{padding-top: 120px !important;padding-bottom: 85px !important;background-image: url(http://localhost/fclb/wordpress/wp-content/uploads/2015/02/1920x750-4.jpg?id=106) !important;}" nfw_row_parallax="yes"][vc_column width="1/1"][vc_row_inner][vc_column_inner width="1/1"][nfw_twitter_component nfw_twitter_id="551361115104763906" nfw_twitter_count="4"][/vc_column_inner][/vc_row_inner][/vc_column][/vc_row]', 'Home', '', 'publish', 'open', 'open', '', 'home', '', '', '2015-02-26 12:37:40', '2015-02-26 12:37:40', '', 0, 'http://firstone.europadns.net/?page_id=50', 0, 'page', '', 0),
(52, 1, '2015-02-26 12:37:56', '2015-02-26 12:37:56', '', '270x270-4', '', 'inherit', 'open', 'open', '', '270x270-4', '', '', '2015-02-26 12:37:56', '2015-02-26 12:37:56', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/270x270-4.png', 0, 'attachment', 'image/png', 0),
(53, 1, '2015-02-26 12:37:57', '2015-02-26 12:37:57', '', '270x270-1', '', 'inherit', 'open', 'open', '', '270x270-1', '', '', '2015-02-26 12:37:57', '2015-02-26 12:37:57', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/270x270-1.png', 0, 'attachment', 'image/png', 0),
(54, 1, '2015-02-26 12:37:58', '2015-02-26 12:37:58', '', '270x270-2', '', 'inherit', 'open', 'open', '', '270x270-2', '', '', '2015-02-26 12:37:58', '2015-02-26 12:37:58', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/270x270-2.png', 0, 'attachment', 'image/png', 0),
(55, 1, '2015-02-26 12:37:59', '2015-02-26 12:37:59', '', '270x270-3', '', 'inherit', 'open', 'open', '', '270x270-3', '', '', '2015-02-26 12:37:59', '2015-02-26 12:37:59', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/270x270-3.png', 0, 'attachment', 'image/png', 0),
(58, 1, '2015-02-26 12:47:01', '2015-02-26 12:47:01', '', '1920x750-3', '', 'inherit', 'open', 'open', '', '1920x750-3', '', '', '2015-02-26 12:47:01', '2015-02-26 12:47:01', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/1920x750-3.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(59, 1, '2015-02-26 12:47:01', '2015-02-26 12:47:01', '', '1920x1000-2', '', 'inherit', 'open', 'open', '', '1920x1000-2', '', '', '2015-02-26 12:47:01', '2015-02-26 12:47:01', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/1920x1000-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(60, 1, '2015-02-26 12:47:02', '2015-02-26 12:47:02', '', '1920x1080', '', 'inherit', 'open', 'open', '', '1920x1080', '', '', '2015-02-26 12:47:02', '2015-02-26 12:47:02', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/1920x1080.jpg', 0, 'attachment', 'image/jpeg', 0),
(63, 1, '2015-02-26 14:00:21', '2015-02-26 14:00:21', '<h3><strong>Leave a message</strong></h3>\n\n[text* your-name placeholder "name"] \n\n[email* your-email  placeholder "address"]\n\n[text* your-subject  placeholder "subject"]\n\n[textarea* your-message placeholder "message"]\n\n[submit class:btn "Send"]\n[your-subject]\n[your-name] <wordpress@firstone.europadns.net>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on First One (http://firstone.europadns.net)\nalex@europadns.com\nReply-To: [your-email]\n\n\n\n\n[your-subject]\nFirst One <wordpress@firstone.europadns.net>\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on First One (http://firstone.europadns.net)\n[your-email]\nReply-To: alex@europadns.com\n\n\n\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nPlease fill in the required field.\nThis input is too long.\nThis input is too short.\nYour entered code is incorrect.\nNumber format seems invalid.\nThis number is too small.\nThis number is too large.\nEmail address seems invalid.\nURL seems invalid.\nTelephone number seems invalid.\nYour answer is not correct.\nDate format seems invalid.\nThis date is too early.\nThis date is too late.\nFailed to upload file.\nThis file type is not allowed.\nThis file is too large.\nFailed to upload file. Error occurred.', 'FirstOne Contact', '', 'publish', 'open', 'open', '', 'firstone-contact', '', '', '2015-02-26 14:00:21', '2015-02-26 14:00:21', '', 0, 'http://firstone.europadns.net/?post_type=wpcf7_contact_form&amp;p=63', 0, 'wpcf7_contact_form', '', 0),
(66, 1, '2015-02-27 07:36:03', '2015-02-27 07:36:03', '', '1920x1280', '', 'inherit', 'open', 'open', '', '1920x1280', '', '', '2015-02-27 07:36:03', '2015-02-27 07:36:03', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/1920x1280.jpg', 0, 'attachment', 'image/jpeg', 0),
(87, 1, '2015-02-27 11:46:06', '2015-02-27 11:46:06', '', '180x80-1', '', 'inherit', 'open', 'open', '', '180x80-1', '', '', '2015-02-27 11:46:06', '2015-02-27 11:46:06', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/180x80-1.png', 0, 'attachment', 'image/png', 0),
(88, 1, '2015-02-27 11:46:06', '2015-02-27 11:46:06', '', '180x80-2', '', 'inherit', 'open', 'open', '', '180x80-2', '', '', '2015-02-27 11:46:06', '2015-02-27 11:46:06', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/180x80-2.png', 0, 'attachment', 'image/png', 0),
(89, 1, '2015-02-27 11:46:06', '2015-02-27 11:46:06', '', '180x80-3', '', 'inherit', 'open', 'open', '', '180x80-3', '', '', '2015-02-27 11:46:06', '2015-02-27 11:46:06', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/180x80-3.png', 0, 'attachment', 'image/png', 0),
(90, 1, '2015-02-27 11:46:06', '2015-02-27 11:46:06', '', '180x80-4', '', 'inherit', 'open', 'open', '', '180x80-4', '', '', '2015-02-27 11:46:06', '2015-02-27 11:46:06', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/180x80-4.png', 0, 'attachment', 'image/png', 0),
(91, 1, '2015-02-27 11:46:07', '2015-02-27 11:46:07', '', '180x80-5', '', 'inherit', 'open', 'open', '', '180x80-5', '', '', '2015-02-27 11:46:07', '2015-02-27 11:46:07', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/180x80-5.png', 0, 'attachment', 'image/png', 0),
(95, 1, '2015-02-27 13:22:21', '2015-02-27 13:22:21', '', '860x540-6', '', 'inherit', 'open', 'open', '', '860x540-6', '', '', '2015-02-27 13:22:21', '2015-02-27 13:22:21', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/860x540-6.png', 0, 'attachment', 'image/png', 0),
(96, 1, '2015-02-27 13:22:22', '2015-02-27 13:22:22', '', '860x540-1', '', 'inherit', 'open', 'open', '', '860x540-1', '', '', '2015-02-27 13:22:22', '2015-02-27 13:22:22', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/860x540-1.png', 0, 'attachment', 'image/png', 0),
(97, 1, '2015-02-27 13:22:22', '2015-02-27 13:22:22', '', '860x540-2', '', 'inherit', 'open', 'open', '', '860x540-2', '', '', '2015-02-27 13:22:22', '2015-02-27 13:22:22', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/860x540-2.png', 0, 'attachment', 'image/png', 0),
(98, 1, '2015-02-27 13:22:23', '2015-02-27 13:22:23', '', '860x540-3', '', 'inherit', 'open', 'open', '', '860x540-3', '', '', '2015-02-27 13:22:23', '2015-02-27 13:22:23', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/860x540-3.png', 0, 'attachment', 'image/png', 0),
(99, 1, '2015-02-27 13:22:25', '2015-02-27 13:22:25', '', '860x540-4', '', 'inherit', 'open', 'open', '', '860x540-4', '', '', '2015-02-27 13:22:25', '2015-02-27 13:22:25', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/860x540-4.png', 0, 'attachment', 'image/png', 0),
(100, 1, '2015-02-27 13:22:25', '2015-02-27 13:22:25', '', '860x540-5', '', 'inherit', 'open', 'open', '', '860x540-5', '', '', '2015-02-27 13:22:25', '2015-02-27 13:22:25', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/860x540-5.png', 0, 'attachment', 'image/png', 0),
(103, 1, '2015-03-02 06:59:51', '2015-03-02 06:59:51', '', 'Blog', '', 'publish', 'open', 'open', '', 'blog', '', '', '2015-03-02 06:59:51', '2015-03-02 06:59:51', '', 0, 'http://firstone.europadns.net/?page_id=103', 0, 'page', '', 0),
(106, 1, '2015-03-02 09:23:31', '2015-03-02 09:23:31', '', '1920x750-4', '', 'inherit', 'open', 'open', '', '1920x750-4', '', '', '2015-03-02 09:23:31', '2015-03-02 09:23:31', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/1920x750-4.jpg', 0, 'attachment', 'image/jpeg', 0),
(113, 1, '2015-03-02 09:59:10', '2015-03-02 09:59:10', '', '1680885692_dc9c00dba4_o', '', 'inherit', 'open', 'open', '', '1680885692_dc9c00dba4_o', '', '', '2015-03-02 09:59:10', '2015-03-02 09:59:10', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/1680885692_dc9c00dba4_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(114, 1, '2015-03-02 09:59:42', '2015-03-02 09:59:42', '', '6804091227_a8791aeeb5_o', '', 'inherit', 'open', 'open', '', '6804091227_a8791aeeb5_o', '', '', '2015-03-02 09:59:42', '2015-03-02 09:59:42', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/6804091227_a8791aeeb5_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(115, 1, '2015-03-02 09:59:59', '2015-03-02 09:59:59', '', '8110870840_e04ea28b02_o', '', 'inherit', 'open', 'open', '', '8110870840_e04ea28b02_o', '', '', '2015-03-02 09:59:59', '2015-03-02 09:59:59', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/8110870840_e04ea28b02_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(117, 1, '2015-03-02 10:00:20', '2015-03-02 10:00:20', '', '5927466661_09f793c33b_o', '', 'inherit', 'open', 'open', '', '5927466661_09f793c33b_o', '', '', '2015-03-02 10:00:20', '2015-03-02 10:00:20', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/5927466661_09f793c33b_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(128, 1, '2015-03-05 08:59:13', '2015-03-05 08:59:13', '', '8194619272_00e363a682_o', '', 'inherit', 'open', 'open', '', '8194619272_00e363a682_o', '', '', '2015-03-05 08:59:13', '2015-03-05 08:59:13', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/8194619272_00e363a682_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(130, 1, '2015-03-05 09:01:08', '2015-03-05 09:01:08', '', '7709199338_e99a64eb22_o', '', 'inherit', 'open', 'open', '', '7709199338_e99a64eb22_o', '', '', '2015-03-05 09:01:08', '2015-03-05 09:01:08', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/7709199338_e99a64eb22_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(131, 1, '2015-03-05 09:01:59', '2015-03-05 09:01:59', '[vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="BROCHURE"][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_images_carousel images="95,97,100,96,99" onclick="custom_link" custom_links_target="_self" mode="horizontal" speed="5000" slides_per_view="1" autoplay="yes" hide_prev_next_buttons="yes" wrap="yes" custom_links="#,#,#,#,#" img_size="full"][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>General Description</h3>\nDonec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula. Pellentesque id elementum orci.\n<h3>Client</h3>\nFor: Diamond Inc.\nCategory: Print Design\nDate Start: 28 - 01 - 2014\nDate Finished: 15 - 02 - 2014\nURL: www.yourclientsite.com[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3>Skills Used</h3>\n[/vc_column_text][nfw_progress_bar nfw_progress_bar_data_width="76"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>What the client say.</h3>\n[/vc_column_text][nfw_testimonial nfw_testimonial_name="John Wilson Doe" nfw_testimonial_image="55"]Quisque ullamcorper pretium turpis, iaculis lectus euismod alea phasellus at quam fringilla, rutrum nisl ac dia, porta arcu. Pellentesque ac venenatis leo nec odio dignissim eros eu.[/nfw_testimonial][/vc_column][/vc_row]', 'Vivamus sed nunc', '', 'publish', 'closed', 'closed', '', 'vivamus-sed-nunc', '', '', '2015-03-05 09:01:59', '2015-03-05 09:01:59', '', 0, 'http://firstone.europadns.net/?post_type=portfolio&amp;p=131', 0, 'portfolio', '', 0),
(132, 1, '2015-03-05 09:02:21', '2015-03-05 09:02:21', '[vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="BROCHURE"][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_images_carousel images="95,97,100,96,99" onclick="custom_link" custom_links_target="_self" mode="horizontal" speed="5000" slides_per_view="1" autoplay="yes" hide_prev_next_buttons="yes" wrap="yes" custom_links="#,#,#,#,#" img_size="full"][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>General Description</h3>\nDonec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula. Pellentesque id elementum orci.\n<h3>Client</h3>\nFor: Diamond Inc.\nCategory: Print Design\nDate Start: 28 - 01 - 2014\nDate Finished: 15 - 02 - 2014\nURL: www.yourclientsite.com[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3>Skills Used</h3>\n[/vc_column_text][nfw_progress_bar nfw_progress_bar_data_width="76"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>What the client say.</h3>\n[/vc_column_text][nfw_testimonial nfw_testimonial_name="John Wilson Doe" nfw_testimonial_image="55"]Quisque ullamcorper pretium turpis, iaculis lectus euismod alea phasellus at quam fringilla, rutrum nisl ac dia, porta arcu. Pellentesque ac venenatis leo nec odio dignissim eros eu.[/nfw_testimonial][/vc_column][/vc_row]', 'Sed quis justo ligula', '', 'publish', 'closed', 'closed', '', 'sed-quis-justo-ligula', '', '', '2015-03-05 09:02:21', '2015-03-05 09:02:21', '', 0, 'http://firstone.europadns.net/?post_type=portfolio&amp;p=132', 0, 'portfolio', '', 0),
(138, 1, '2015-03-06 09:38:18', '2015-03-06 09:38:18', 'The Chicago Loop and the Michigan Ave bridge, seen from the plaza near the Trump Tower.', 'Chicago in Black and White', '', 'inherit', 'open', 'open', '', 'chicago-in-black-and-white', '', '', '2015-03-06 09:38:18', '2015-03-06 09:38:18', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/6978490723_4e0c837e34_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(140, 1, '2015-03-09 08:55:16', '2015-03-09 08:55:16', '', '4745573116_83f9abc0a0_o', '', 'inherit', 'open', 'open', '', '4745573116_83f9abc0a0_o', '', '', '2015-03-09 08:55:16', '2015-03-09 08:55:16', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/4745573116_83f9abc0a0_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(141, 1, '2015-03-09 08:56:01', '2015-03-09 08:56:01', '', 'OLYMPUS DIGITAL CAMERA', '', 'inherit', 'open', 'open', '', 'olympus-digital-camera', '', '', '2015-03-09 08:56:01', '2015-03-09 08:56:01', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/9532053314_c80598f19d_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(142, 1, '2015-03-09 08:56:26', '2015-03-09 08:56:26', '', '4468871811_dabb0eda45_o', '', 'inherit', 'open', 'open', '', '4468871811_dabb0eda45_o', '', '', '2015-03-09 08:56:26', '2015-03-09 08:56:26', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/4468871811_dabb0eda45_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(144, 1, '2015-03-09 08:58:39', '2015-03-09 08:58:39', '[vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="BROCHURE"][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_images_carousel images="95,97,100,96,99" onclick="custom_link" custom_links_target="_self" mode="horizontal" speed="5000" slides_per_view="1" autoplay="yes" hide_prev_next_buttons="yes" wrap="yes" custom_links="#,#,#,#,#" img_size="full"][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>General Description</h3>\nDonec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula. Pellentesque id elementum orci.\n<h3>Client</h3>\nFor: Diamond Inc.\nCategory: Print Design\nDate Start: 28 - 01 - 2014\nDate Finished: 15 - 02 - 2014\nURL: www.yourclientsite.com[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3>Skills Used</h3>\n[/vc_column_text][nfw_progress_bar nfw_progress_bar_data_width="76"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>What the client say.</h3>\n[/vc_column_text][nfw_testimonial nfw_testimonial_name="John Wilson Doe" nfw_testimonial_image="55"]Quisque ullamcorper pretium turpis, iaculis lectus euismod alea phasellus at quam fringilla, rutrum nisl ac dia, porta arcu. Pellentesque ac venenatis leo nec odio dignissim eros eu.[/nfw_testimonial][/vc_column][/vc_row]', 'Quisque consectetur', '', 'publish', 'closed', 'closed', '', 'quisque-consectetur', '', '', '2015-03-09 08:58:39', '2015-03-09 08:58:39', '', 0, 'http://firstone.europadns.net/?post_type=portfolio&amp;p=144', 0, 'portfolio', '', 0),
(145, 1, '2015-03-09 08:59:12', '2015-03-09 08:59:12', '[vc_row][vc_column width="1/1"][nfw_headlines nfw_headline_title="BROCHURE"][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_images_carousel images="95,97,100,96,99" onclick="custom_link" custom_links_target="_self" mode="horizontal" speed="5000" slides_per_view="1" autoplay="yes" hide_prev_next_buttons="yes" wrap="yes" custom_links="#,#,#,#,#" img_size="full"][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>General Description</h3>\nDonec vulputate dolor nec nisl rutrum pulvinar. Pellentesque venenatis, augue non consequat tristique, sapien odio condimentum mauris, a dictum nulla mi in ligula. Pellentesque id elementum orci.\n<h3>Client</h3>\nFor: Diamond Inc.\nCategory: Print Design\nDate Start: 28 - 01 - 2014\nDate Finished: 15 - 02 - 2014\nURL: www.yourclientsite.com[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/2"][vc_column_text]\n<h3>Skills Used</h3>\n[/vc_column_text][nfw_progress_bar nfw_progress_bar_data_width="76"]Photoshop - Aliquam pharetra, leo rutrum viverra.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="88"]Corel Draw - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="95"]Adobe Illustrator - Donec leo mauris id sagittis sed.[/nfw_progress_bar][nfw_progress_bar nfw_progress_bar_data_width="80"]Cinema 4D - Donec leo mauris, iaculis id sagittis sed.[/nfw_progress_bar][/vc_column][vc_column width="1/2"][vc_column_text]\n<h3>What the client say.</h3>\n[/vc_column_text][nfw_testimonial nfw_testimonial_name="John Wilson Doe" nfw_testimonial_image="55"]Quisque ullamcorper pretium turpis, iaculis lectus euismod alea phasellus at quam fringilla, rutrum nisl ac dia, porta arcu. Pellentesque ac venenatis leo nec odio dignissim eros eu.[/nfw_testimonial][/vc_column][/vc_row]', 'Proin id lectus vitae', '', 'publish', 'closed', 'closed', '', 'proin-id-lectus-vitae', '', '', '2015-03-09 08:59:12', '2015-03-09 08:59:12', '', 0, 'http://firstone.europadns.net/?post_type=portfolio&amp;p=145', 0, 'portfolio', '', 0),
(154, 1, '2015-03-10 08:09:26', '2015-03-10 08:09:26', '', 'tweet', '', 'inherit', 'open', 'open', '', 'tweet', '', '', '2015-03-10 08:09:26', '2015-03-10 08:09:26', '', 50, 'http://localhost/fclb/wordpress/wp-content/uploads/2015/02/tweet.jpg', 0, 'attachment', 'image/jpeg', 0),
(155, 1, '2015-06-05 19:08:26', '2015-06-05 19:08:26', '', 'Home', '', 'publish', 'open', 'open', '', 'home', '', '', '2015-06-05 19:08:26', '2015-06-05 19:08:26', '', 0, 'http://localhost/fclb/wordpress/index.php/2015/06/05/home/', 1, 'nav_menu_item', '', 0),
(156, 1, '2015-06-05 19:08:26', '2015-06-05 19:08:26', '', 'Services', '', 'publish', 'open', 'open', '', 'services', '', '', '2015-06-05 19:08:26', '2015-06-05 19:08:26', '', 0, 'http://localhost/fclb/wordpress/index.php/2015/06/05/services/', 2, 'nav_menu_item', '', 0),
(157, 1, '2015-06-05 19:08:27', '2015-06-05 19:08:27', '', 'About us', '', 'publish', 'open', 'open', '', 'about-us', '', '', '2015-06-05 19:08:27', '2015-06-05 19:08:27', '', 0, 'http://localhost/fclb/wordpress/index.php/2015/06/05/about-us/', 3, 'nav_menu_item', '', 0),
(158, 1, '2015-06-05 19:08:27', '2015-06-05 19:08:27', '', 'Portfolio', '', 'publish', 'open', 'open', '', 'portfolio', '', '', '2015-06-05 19:08:27', '2015-06-05 19:08:27', '', 0, 'http://localhost/fclb/wordpress/index.php/2015/06/05/portfolio/', 4, 'nav_menu_item', '', 0),
(159, 1, '2015-06-05 19:08:28', '2015-06-05 19:08:28', '', 'Blog', '', 'publish', 'open', 'open', '', 'blog', '', '', '2015-06-05 19:08:28', '2015-06-05 19:08:28', '', 0, 'http://localhost/fclb/wordpress/index.php/2015/06/05/blog/', 5, 'nav_menu_item', '', 0),
(160, 1, '2015-06-05 19:08:28', '2015-06-05 19:08:28', '', 'Contact', '', 'publish', 'open', 'open', '', 'contact', '', '', '2015-06-05 19:08:28', '2015-06-05 19:08:28', '', 0, 'http://localhost/fclb/wordpress/index.php/2015/06/05/contact/', 6, 'nav_menu_item', '', 0),
(161, 1, '2015-02-25 12:39:50', '2015-02-25 12:39:50', 'Nulla eget massa enim. Vivamus sagittis non massa sit amet fermentum. Nulla iaculis erat nec mauris pretium, at molestie erat condimentum. Sed ac eros mollis mauris tincidunt egestas in quis ipsum. Nunc nec quam quis nulla imperdiet euismod non eu arcu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sed neque finibus, facilisis purus lobortis, tincidunt sem.\n\nAliquam ac eros nisi. Vestibulum eget posuere nisl, ac volutpat justo. Fusce consectetur dapibus mi, sit amet aliquam lorem imperdiet eu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id mi vehicula, congue neque vel, mollis tortor. Nunc dapibus tempus arcu ac volutpat. Sed sed maximus dolor, sed pulvinar tellus. Donec in mi nisi. Aliquam urna erat, luctus lobortis vehicula vitae, vestibulum pulvinar urna. Aenean consequat purus et scelerisque pulvinar. Donec non tortor vitae odio porttitor aliquam.\n\nIn non eros sit amet tortor consectetur suscipit id et quam. Proin bibendum in dolor sit amet consequat. Phasellus maximus, leo non fermentum ultricies, augue leo volutpat metus, vel sodales nisl lectus at tortor. Ut in euismod risus. Duis dignissim in quam eget pulvinar. Sed viverra, sem ut finibus congue, mauris nunc rutrum nisl, a egestas arcu nulla sed nisi. Praesent mollis quam et ex mollis sodales. Nunc sit amet faucibus augue. Phasellus a felis interdum, cursus metus at, tristique nunc. Proin tincidunt dapibus laoreet.', 'Curabitur auctor vulputate quam facilisis eu dolor sit amet', 'Quisque ullamcorper pretium turpis, in iaculis ectus euismod phasellus at quam fringilla, rutrum nisl ac, porta arcu. Pellentesque venenatis leo.', 'publish', 'open', 'open', '', 'curabitur-auctor-vulputate-quam-facilisis-eu-dolor-sit-amet', '', '', '2015-02-25 12:39:50', '2015-02-25 12:39:50', '', 0, 'http://firstone.europadns.net/?p=6', 0, 'post', '', 0),
(162, 1, '2015-06-05 19:24:09', '2015-06-05 19:24:09', '', '1920x1280.jpg', '', 'inherit', 'closed', 'closed', '', '1920x1280-jpg', '', '', '2015-06-05 19:24:09', '2015-06-05 19:24:09', '', 0, 'http://localhost/fclb/wordpress/wp-content/uploads/revslider/home-slider/1920x1280.jpg', 0, 'attachment', 'image/jpeg', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_revslider_css`
--

CREATE TABLE IF NOT EXISTS `wp_revslider_css` (
  `id` int(9) NOT NULL,
  `handle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `hover` text COLLATE utf8mb4_unicode_ci,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_revslider_css`
--

INSERT INTO `wp_revslider_css` (`id`, `handle`, `settings`, `hover`, `params`) VALUES
(1, '.tp-caption.medium_grey', NULL, NULL, '{"position":"absolute","color":"#fff","text-shadow":"0px 2px 5px rgba(0, 0, 0, 0.5)","font-weight":"700","font-size":"20px","line-height":"20px","font-family":"Arial","padding":"2px 4px","margin":"0px","border-width":"0px","border-style":"none","background-color":"#888","white-space":"nowrap"}'),
(2, '.tp-caption.small_text', NULL, NULL, '{"position":"absolute","color":"#fff","text-shadow":"0px 2px 5px rgba(0, 0, 0, 0.5)","font-weight":"700","font-size":"14px","line-height":"20px","font-family":"Arial","margin":"0px","border-width":"0px","border-style":"none","white-space":"nowrap"}'),
(3, '.tp-caption.medium_text', NULL, NULL, '{"position":"absolute","color":"#fff","text-shadow":"0px 2px 5px rgba(0, 0, 0, 0.5)","font-weight":"700","font-size":"20px","line-height":"20px","font-family":"Arial","margin":"0px","border-width":"0px","border-style":"none","white-space":"nowrap"}'),
(4, '.tp-caption.large_text', NULL, NULL, '{"position":"absolute","color":"#fff","text-shadow":"0px 2px 5px rgba(0, 0, 0, 0.5)","font-weight":"700","font-size":"40px","line-height":"40px","font-family":"Arial","margin":"0px","border-width":"0px","border-style":"none","white-space":"nowrap"}'),
(5, '.tp-caption.very_large_text', NULL, NULL, '{"position":"absolute","color":"#fff","text-shadow":"0px 2px 5px rgba(0, 0, 0, 0.5)","font-weight":"700","font-size":"60px","line-height":"60px","font-family":"Arial","margin":"0px","border-width":"0px","border-style":"none","white-space":"nowrap","letter-spacing":"-2px"}'),
(6, '.tp-caption.very_big_white', NULL, NULL, '{"position":"absolute","color":"#fff","text-shadow":"none","font-weight":"800","font-size":"60px","line-height":"60px","font-family":"Arial","margin":"0px","border-width":"0px","border-style":"none","white-space":"nowrap","padding":"0px 4px","padding-top":"1px","background-color":"#000"}'),
(7, '.tp-caption.very_big_black', NULL, NULL, '{"position":"absolute","color":"#000","text-shadow":"none","font-weight":"700","font-size":"60px","line-height":"60px","font-family":"Arial","margin":"0px","border-width":"0px","border-style":"none","white-space":"nowrap","padding":"0px 4px","padding-top":"1px","background-color":"#fff"}'),
(8, '.tp-caption.modern_medium_fat', NULL, NULL, '{"position":"absolute","color":"#000","text-shadow":"none","font-weight":"800","font-size":"24px","line-height":"20px","font-family":"\\"Open Sans\\", sans-serif","margin":"0px","border-width":"0px","border-style":"none","white-space":"nowrap"}'),
(9, '.tp-caption.modern_medium_fat_white', NULL, NULL, '{"position":"absolute","color":"#fff","text-shadow":"none","font-weight":"800","font-size":"24px","line-height":"20px","font-family":"\\"Open Sans\\", sans-serif","margin":"0px","border-width":"0px","border-style":"none","white-space":"nowrap"}'),
(10, '.tp-caption.modern_medium_light', NULL, NULL, '{"position":"absolute","color":"#000","text-shadow":"none","font-weight":"300","font-size":"24px","line-height":"20px","font-family":"\\"Open Sans\\", sans-serif","margin":"0px","border-width":"0px","border-style":"none","white-space":"nowrap"}'),
(11, '.tp-caption.modern_big_bluebg', NULL, NULL, '{"position":"absolute","color":"#fff","text-shadow":"none","font-weight":"800","font-size":"30px","line-height":"36px","font-family":"\\"Open Sans\\", sans-serif","padding":"3px 10px","margin":"0px","border-width":"0px","border-style":"none","background-color":"#4e5b6c","letter-spacing":"0"}'),
(12, '.tp-caption.modern_big_redbg', NULL, NULL, '{"position":"absolute","color":"#fff","text-shadow":"none","font-weight":"300","font-size":"30px","line-height":"36px","font-family":"\\"Open Sans\\", sans-serif","padding":"3px 10px","padding-top":"1px","margin":"0px","border-width":"0px","border-style":"none","background-color":"#de543e","letter-spacing":"0"}'),
(13, '.tp-caption.modern_small_text_dark', NULL, NULL, '{"position":"absolute","color":"#555","text-shadow":"none","font-size":"14px","line-height":"22px","font-family":"Arial","margin":"0px","border-width":"0px","border-style":"none","white-space":"nowrap"}'),
(14, '.tp-caption.boxshadow', NULL, NULL, '{"-moz-box-shadow":"0px 0px 20px rgba(0, 0, 0, 0.5)","-webkit-box-shadow":"0px 0px 20px rgba(0, 0, 0, 0.5)","box-shadow":"0px 0px 20px rgba(0, 0, 0, 0.5)"}'),
(15, '.tp-caption.black', NULL, NULL, '{"color":"#000","text-shadow":"none"}'),
(16, '.tp-caption.noshadow', NULL, NULL, '{"text-shadow":"none"}'),
(17, '.tp-caption.thinheadline_dark', NULL, NULL, '{"position":"absolute","color":"rgba(0,0,0,0.85)","text-shadow":"none","font-weight":"300","font-size":"30px","line-height":"30px","font-family":"\\"Open Sans\\"","background-color":"transparent"}'),
(18, '.tp-caption.thintext_dark', NULL, NULL, '{"position":"absolute","color":"rgba(0,0,0,0.85)","text-shadow":"none","font-weight":"300","font-size":"16px","line-height":"26px","font-family":"\\"Open Sans\\"","background-color":"transparent"}'),
(19, '.tp-caption.largeblackbg', NULL, NULL, '{"position":"absolute","color":"#fff","text-shadow":"none","font-weight":"300","font-size":"50px","line-height":"70px","font-family":"\\"Open Sans\\"","background-color":"#000","padding":"0px 20px","-webkit-border-radius":"0px","-moz-border-radius":"0px","border-radius":"0px"}'),
(20, '.tp-caption.largepinkbg', NULL, NULL, '{"position":"absolute","color":"#fff","text-shadow":"none","font-weight":"300","font-size":"50px","line-height":"70px","font-family":"\\"Open Sans\\"","background-color":"#db4360","padding":"0px 20px","-webkit-border-radius":"0px","-moz-border-radius":"0px","border-radius":"0px"}'),
(21, '.tp-caption.largewhitebg', NULL, NULL, '{"position":"absolute","color":"#000","text-shadow":"none","font-weight":"300","font-size":"50px","line-height":"70px","font-family":"\\"Open Sans\\"","background-color":"#fff","padding":"0px 20px","-webkit-border-radius":"0px","-moz-border-radius":"0px","border-radius":"0px"}'),
(22, '.tp-caption.largegreenbg', NULL, NULL, '{"position":"absolute","color":"#fff","text-shadow":"none","font-weight":"300","font-size":"50px","line-height":"70px","font-family":"\\"Open Sans\\"","background-color":"#67ae73","padding":"0px 20px","-webkit-border-radius":"0px","-moz-border-radius":"0px","border-radius":"0px"}'),
(23, '.tp-caption.excerpt', NULL, NULL, '{"font-size":"36px","line-height":"36px","font-weight":"700","font-family":"Arial","color":"#ffffff","text-decoration":"none","background-color":"rgba(0, 0, 0, 1)","text-shadow":"none","margin":"0px","letter-spacing":"-1.5px","padding":"1px 4px 0px 4px","width":"150px","white-space":"normal !important","height":"auto","border-width":"0px","border-color":"rgb(255, 255, 255)","border-style":"none"}'),
(24, '.tp-caption.large_bold_grey', NULL, NULL, '{"font-size":"60px","line-height":"60px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(102, 102, 102)","text-decoration":"none","background-color":"transparent","text-shadow":"none","margin":"0px","padding":"1px 4px 0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(25, '.tp-caption.medium_thin_grey', NULL, NULL, '{"font-size":"34px","line-height":"30px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(102, 102, 102)","text-decoration":"none","background-color":"transparent","padding":"1px 4px 0px","text-shadow":"none","margin":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(26, '.tp-caption.small_thin_grey', NULL, NULL, '{"font-size":"18px","line-height":"26px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(117, 117, 117)","text-decoration":"none","background-color":"transparent","padding":"1px 4px 0px","text-shadow":"none","margin":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(27, '.tp-caption.lightgrey_divider', NULL, NULL, '{"text-decoration":"none","background-color":"rgba(235, 235, 235, 1)","width":"370px","height":"3px","background-position":"initial initial","background-repeat":"initial initial","border-width":"0px","border-color":"rgb(34, 34, 34)","border-style":"none"}'),
(28, '.tp-caption.large_bold_darkblue', NULL, NULL, '{"font-size":"58px","line-height":"60px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(52, 73, 94)","text-decoration":"none","background-color":"transparent","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(29, '.tp-caption.medium_bg_darkblue', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(52, 73, 94)","padding":"10px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(30, '.tp-caption.medium_bold_red', NULL, NULL, '{"font-size":"24px","line-height":"30px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(227, 58, 12)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(31, '.tp-caption.medium_light_red', NULL, NULL, '{"font-size":"21px","line-height":"26px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(227, 58, 12)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(32, '.tp-caption.medium_bg_red', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(227, 58, 12)","padding":"10px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(33, '.tp-caption.medium_bold_orange', NULL, NULL, '{"font-size":"24px","line-height":"30px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(243, 156, 18)","text-decoration":"none","background-color":"transparent","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(34, '.tp-caption.medium_bg_orange', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(243, 156, 18)","padding":"10px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(35, '.tp-caption.grassfloor', NULL, NULL, '{"text-decoration":"none","background-color":"rgba(160, 179, 151, 1)","width":"4000px","height":"150px","border-width":"0px","border-color":"rgb(34, 34, 34)","border-style":"none"}'),
(36, '.tp-caption.large_bold_white', NULL, NULL, '{"font-size":"58px","line-height":"60px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(37, '.tp-caption.medium_light_white', NULL, NULL, '{"font-size":"30px","line-height":"36px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(38, '.tp-caption.mediumlarge_light_white', NULL, NULL, '{"font-size":"34px","line-height":"40px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(39, '.tp-caption.mediumlarge_light_white_center', NULL, NULL, '{"font-size":"34px","line-height":"40px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"#ffffff","text-decoration":"none","background-color":"transparent","padding":"0px 0px 0px 0px","text-align":"center","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(40, '.tp-caption.medium_bg_asbestos', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(127, 140, 141)","padding":"10px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(41, '.tp-caption.medium_light_black', NULL, NULL, '{"font-size":"30px","line-height":"36px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(0, 0, 0)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(42, '.tp-caption.large_bold_black', NULL, NULL, '{"font-size":"58px","line-height":"60px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(0, 0, 0)","text-decoration":"none","background-color":"transparent","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(43, '.tp-caption.mediumlarge_light_darkblue', NULL, NULL, '{"font-size":"34px","line-height":"40px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(52, 73, 94)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(44, '.tp-caption.small_light_white', NULL, NULL, '{"font-size":"17px","line-height":"28px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(45, '.tp-caption.roundedimage', NULL, NULL, '{"border-width":"0px","border-color":"rgb(34, 34, 34)","border-style":"none"}'),
(46, '.tp-caption.large_bg_black', NULL, NULL, '{"font-size":"40px","line-height":"40px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(0, 0, 0)","padding":"10px 20px 15px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(47, '.tp-caption.mediumwhitebg', NULL, NULL, '{"font-size":"30px","line-height":"30px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(0, 0, 0)","text-decoration":"none","background-color":"rgb(255, 255, 255)","padding":"5px 15px 10px","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_revslider_layer_animations`
--

CREATE TABLE IF NOT EXISTS `wp_revslider_layer_animations` (
  `id` int(9) NOT NULL,
  `handle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_revslider_settings`
--

CREATE TABLE IF NOT EXISTS `wp_revslider_settings` (
  `id` int(9) NOT NULL,
  `general` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_revslider_settings`
--

INSERT INTO `wp_revslider_settings` (`id`, `general`, `params`) VALUES
(1, 'a:0:{}', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_revslider_sliders`
--

CREATE TABLE IF NOT EXISTS `wp_revslider_sliders` (
  `id` int(9) NOT NULL,
  `title` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` tinytext COLLATE utf8mb4_unicode_ci,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_revslider_sliders`
--

INSERT INTO `wp_revslider_sliders` (`id`, `title`, `alias`, `params`) VALUES
(1, 'Home Slider', 'home-slider', '{"title":"Home Slider","alias":"home-slider","shortcode":"[rev_slider home-slider]","source_type":"gallery","post_types":"post","post_category":"category_3","post_sortby":"ID","posts_sort_direction":"DESC","max_slider_posts":"30","excerpt_limit":"55","slider_template_id":"","posts_list":"","slider_type":"fullscreen","fullscreen_offset_container":"","fullscreen_offset_size":"","fullscreen_min_height":"","full_screen_align_force":"off","auto_height":"off","force_full_width":"off","min_height":"0","width":"1170","height":"550","responsitive_w1":"940","responsitive_sw1":"770","responsitive_w2":"780","responsitive_sw2":"500","responsitive_w3":"510","responsitive_sw3":"310","responsitive_w4":"0","responsitive_sw4":"0","responsitive_w5":"0","responsitive_sw5":"0","responsitive_w6":"0","responsitive_sw6":"0","delay":"9000","shuffle":"off","lazy_load":"off","use_wpml":"off","enable_static_layers":"off","next_slide_on_window_focus":"off","start_js_after_delay":0,"stop_slider":"off","stop_after_loops":0,"stop_at_slide":2,"show_timerbar":"hide","loop_slide":"noloop","position":"center","margin_top":0,"margin_bottom":0,"margin_left":0,"margin_right":0,"shadow_type":"0","padding":0,"background_color":"#E9E9E9","background_dotted_overlay":"none","show_background_image":"false","background_image":"http:\\/\\/localhost\\/fclb\\/wordpress\\/wp-content\\/","bg_fit":"cover","bg_repeat":"no-repeat","bg_position":"center top","stop_on_hover":"on","keyboard_navigation":"off","navigation_style":"round","navigaion_type":"none","navigation_arrows":"none","navigaion_always_on":"false","hide_thumbs":200,"navigaion_align_hor":"center","navigaion_align_vert":"bottom","navigaion_offset_hor":"0","navigaion_offset_vert":20,"leftarrow_align_hor":"left","leftarrow_align_vert":"center","leftarrow_offset_hor":20,"leftarrow_offset_vert":0,"rightarrow_align_hor":"right","rightarrow_align_vert":"center","rightarrow_offset_hor":20,"rightarrow_offset_vert":0,"thumb_width":100,"thumb_height":50,"thumb_amount":5,"use_spinner":"0","spinner_color":"#FFFFFF","use_parallax":"off","disable_parallax_mobile":"off","parallax_type":"mouse","parallax_bg_freeze":"off","parallax_level_1":"5","parallax_level_2":"10","parallax_level_3":"15","parallax_level_4":"20","parallax_level_5":"25","parallax_level_6":"30","parallax_level_7":"35","parallax_level_8":"40","parallax_level_9":"45","parallax_level_10":"50","touchenabled":"on","swipe_velocity":75,"swipe_min_touches":1,"drag_block_vertical":"false","disable_on_mobile":"off","disable_kenburns_on_mobile":"off","hide_slider_under":0,"hide_defined_layers_under":0,"hide_all_layers_under":0,"hide_arrows_on_mobile":"off","hide_bullets_on_mobile":"off","hide_thumbs_on_mobile":"off","hide_thumbs_under_resolution":0,"hide_thumbs_delay_mobile":1500,"start_with_slide":"1","first_transition_active":"false","first_transition_type":"fade","first_transition_duration":300,"first_transition_slot_amount":7,"simplify_ie8_ios4":"off","show_alternative_type":"off","show_alternate_image":"","reset_transitions":"","reset_transition_duration":0,"0":"Execute settings on all slides","jquery_noconflict":"on","js_to_body":"false","output_type":"none","custom_css":"","custom_javascript":"","template":"false"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_revslider_slides`
--

CREATE TABLE IF NOT EXISTS `wp_revslider_slides` (
  `id` int(9) NOT NULL,
  `slider_id` int(9) NOT NULL,
  `slide_order` int(11) NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `layers` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_revslider_slides`
--

INSERT INTO `wp_revslider_slides` (`id`, `slider_id`, `slide_order`, `params`, `layers`) VALUES
(1, 1, 1, '{"background_type":"image","image":"http:\\/\\/localhost\\/fclb\\/wordpress\\/wp-content\\/uploads\\/2015\\/06\\/Congresso_Nacional_-_Bras\\u00a1lia-bg.png","image_id":"5","title":"Slide","state":"published","date_from":"","date_to":"","slide_transition":"fade","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"normal","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center center","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone","0":"Remove"}', '[{"text":"1\\u00b0 F\\u00f3rum de <span>Comunica\\u00e7\\u00e3o<\\/span> do Legislativo Brasileiro","type":"text","left":250,"top":200,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sft","easing":"easeOutBack","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":700,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"caption title","time":1000,"endtime":"8300","endspeed":700,"endanimation":"fadeout","endeasing":"easeOutBack","corner_left":"nothing","corner_right":"nothing","width":-1,"height":-1,"serial":"0","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":9000,"timeLast":8300,"endWithSlide":true,"max_height":"auto","max_width":"auto","2d_rotation":"","alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vehicula imperdiet posuere. <br>\\n\\t\\t\\t\\t\\t\\t\\t\\tNunc quis risus a nulla condimentum fermentum. Phasellus justo nunc.","type":"text","left":145,"top":300,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfl","easing":"easeOutBack","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":700,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"caption subtitle","time":1500,"endtime":"8300","endspeed":700,"endanimation":"fadeout","endeasing":"easeOutBack","corner_left":"nothing","corner_right":"nothing","width":-1,"height":-1,"serial":"1","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":9000,"timeLast":8300,"endWithSlide":true,"max_height":"auto","max_width":"auto","2d_rotation":"","alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":"","static_end":"1"},{"text":"<a class=\\"btn text-uppercase\\" href=\\"#\\">Discover More<\\/a>","type":"text","left":410,"top":400,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfl","easing":"easeOutBack","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":700,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"caption","time":2000,"endtime":"8700","endspeed":700,"endanimation":"fadeout","endeasing":"easeOutBack","corner_left":"nothing","corner_right":"nothing","width":-1,"height":-1,"serial":"2","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":9000,"timeLast":8300,"endWithSlide":true,"max_height":"auto","max_width":"auto","2d_rotation":"","alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":"","static_end":"1"},{"text":"<a class=\\"btn alt text-uppercase\\" href=\\"http:\\/\\/themeforest.net\\/user\\/europadns\\/portfolio?WT.ac=portfolio_item&amp;WT.z_author=europadns\\">Purchase Now<\\/a>","type":"text","left":590,"top":400,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfr","easing":"easeOutBack","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":700,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"caption","time":2000,"endtime":"8300","endspeed":700,"endanimation":"fadeout","endeasing":"easeOutBack","corner_left":"nothing","corner_right":"nothing","width":-1,"height":-1,"serial":"3","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":9000,"timeLast":8300,"endWithSlide":true,"max_height":"auto","max_width":"auto","2d_rotation":"","alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":"","static_end":"1"},{"text":"<a class=\\"arrow\\" href=\\"#services_section\\">\\n                                \\t<i class=\\"fa fa-angle-down\\"><\\/i>\\n                                <\\/a>","type":"text","left":553,"top":620,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfb","easing":"easeOutBack","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":700,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"caption","time":2500,"endtime":"8300","endspeed":700,"endanimation":"fadeout","endeasing":"easeOutBack","corner_left":"nothing","corner_right":"nothing","width":-1,"height":-1,"serial":"4","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":9000,"timeLast":8300,"endWithSlide":true,"max_height":"auto","max_width":"auto","2d_rotation":"","alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":"","static_end":"1"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_revslider_static_slides`
--

CREATE TABLE IF NOT EXISTS `wp_revslider_static_slides` (
  `id` int(9) NOT NULL,
  `slider_id` int(9) NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `layers` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Sem categoria', 'sem-categoria', 0),
(2, 'Business', 'business', 0),
(3, 'digital', 'digital', 0),
(4, 'Photography', 'photography', 0),
(5, 'Travel', 'travel', 0),
(6, 'Uncategorized', 'uncategorized', 0),
(7, 'Unlimited', 'unlimited', 0),
(8, 'advanced', 'advanced', 0),
(9, 'digital', 'digital', 0),
(10, 'free', 'free', 0),
(11, 'progress', 'progress', 0),
(12, 'real', 'real', 0),
(13, 'secure', 'secure', 0),
(14, 'virtual', 'virtual', 0),
(15, 'branding', 'branding', 0),
(16, 'corporate identity', 'corporate-identity', 0),
(17, 'design', 'design', 0),
(18, 'mockup', 'mockup', 0),
(19, 'photography', 'photography', 0),
(20, 'Menu 1', 'menu-1', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(8, 3, 0),
(8, 7, 0),
(8, 9, 0),
(8, 12, 0),
(10, 3, 0),
(10, 4, 0),
(10, 11, 0),
(10, 13, 0),
(10, 14, 0),
(12, 2, 0),
(12, 6, 0),
(12, 8, 0),
(12, 13, 0),
(12, 14, 0),
(14, 5, 0),
(14, 7, 0),
(14, 10, 0),
(14, 11, 0),
(14, 12, 0),
(41, 17, 0),
(41, 18, 0),
(42, 15, 0),
(42, 16, 0),
(43, 18, 0),
(43, 19, 0),
(44, 15, 0),
(44, 19, 0),
(45, 16, 0),
(45, 18, 0),
(46, 18, 0),
(46, 19, 0),
(47, 16, 0),
(47, 19, 0),
(48, 17, 0),
(48, 19, 0),
(131, 17, 0),
(131, 18, 0),
(132, 16, 0),
(132, 17, 0),
(144, 15, 0),
(144, 16, 0),
(145, 17, 0),
(145, 18, 0),
(155, 20, 0),
(156, 20, 0),
(157, 20, 0),
(158, 20, 0),
(159, 20, 0),
(160, 20, 0),
(161, 2, 0),
(161, 5, 0),
(161, 8, 0),
(161, 9, 0),
(161, 10, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'category', '', 0, 2),
(3, 3, 'category', '', 0, 2),
(4, 4, 'category', '', 0, 1),
(5, 5, 'category', '', 0, 2),
(6, 6, 'category', '', 0, 1),
(7, 7, 'category', '', 0, 2),
(8, 8, 'post_tag', '', 0, 2),
(9, 9, 'post_tag', '', 0, 2),
(10, 10, 'post_tag', '', 0, 2),
(11, 11, 'post_tag', '', 0, 2),
(12, 12, 'post_tag', '', 0, 2),
(13, 13, 'post_tag', '', 0, 2),
(14, 14, 'post_tag', '', 0, 2),
(15, 15, 'portfolio_categories', '', 0, 3),
(16, 16, 'portfolio_categories', '', 0, 5),
(17, 17, 'portfolio_categories', '', 0, 5),
(18, 18, 'portfolio_categories', '', 0, 6),
(19, 19, 'portfolio_categories', '', 0, 5),
(20, 20, 'nav_menu', '', 0, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'fellype'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:1:{s:64:"21359288af316da035d8c0f110977572f78c443cd994751a285d3b9336bc5c61";a:4:{s:10:"expiration";i:1434061811;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36";s:5:"login";i:1433889011;}}'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'wp_user-settings', 'libraryContent=browse'),
(17, 1, 'wp_user-settings-time', '1433529774'),
(18, 1, 'nav_menu_recently_edited', '20'),
(19, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(20, 1, 'metaboxhidden_nav-menus', 'a:4:{i:0;s:8:"add-post";i:1;s:13:"add-portfolio";i:2;s:12:"add-post_tag";i:3;s:24:"add-portfolio_categories";}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'fellype', '$P$BW9pSBFFQ35ZuXVDG1RekhsUoNKRyW.', 'fellype', 'fellypenc@gmail.com', '', '2015-06-05 17:26:31', '', 0, 'fellype');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_revslider_css`
--
ALTER TABLE `wp_revslider_css`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_revslider_layer_animations`
--
ALTER TABLE `wp_revslider_layer_animations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_revslider_settings`
--
ALTER TABLE `wp_revslider_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_revslider_sliders`
--
ALTER TABLE `wp_revslider_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_revslider_slides`
--
ALTER TABLE `wp_revslider_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_revslider_static_slides`
--
ALTER TABLE `wp_revslider_static_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=215;
--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=296;
--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=163;
--
-- AUTO_INCREMENT for table `wp_revslider_css`
--
ALTER TABLE `wp_revslider_css`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `wp_revslider_layer_animations`
--
ALTER TABLE `wp_revslider_layer_animations`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_revslider_settings`
--
ALTER TABLE `wp_revslider_settings`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_revslider_sliders`
--
ALTER TABLE `wp_revslider_sliders`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_revslider_slides`
--
ALTER TABLE `wp_revslider_slides`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_revslider_static_slides`
--
ALTER TABLE `wp_revslider_static_slides`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
