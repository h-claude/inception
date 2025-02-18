<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** Database username */
define( 'DB_USER', 'wordpress_user' );

/** Database password */
define( 'DB_PASSWORD', 'wordpress_password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'k}m6[xZ3[c3]w3wO/cJxg|K-QTM~/-EF;qXjOKqYF/c<(;%~2{gY.s!vbRzJOASr' );
define( 'SECURE_AUTH_KEY',  'QD3Wd4tK;b;zIaq@b3MDTP`rK|erlob9@hpbaz1cZoQR<nS!m3@_ _ke[n`VTx[!' );
define( 'LOGGED_IN_KEY',    't8>:}0${1c7QWlPQeK=d|O~de7xGs;C#EWsG]kXx3I/QP;5+(p&AU{3t,tu)/&wz' );
define( 'NONCE_KEY',        'MN!*kv[5X%VHU<fanaH2,e-^;x[Nne:2MHS*5xM!uDe,AT0sMi#ozHryypVib5Rw' );
define( 'AUTH_SALT',        'iusTa7mw0vkDhIF;,^,m>tqa4K{Ls<0Tg[@Bz?at1O&~#l S~j]IbnSprV==~UT`' );
define( 'SECURE_AUTH_SALT', 'eMEnfy V:5Q^@gGmwRmvl`6Kd@&VB9.v!E>=DnP#>6Y22rVZ?NR3ECb&/p*tF:9l' );
define( 'LOGGED_IN_SALT',   'T%EAFDMgoxqkG:O6Gmxa%.uWo]k~Est%jQzq5kZ;=;{xNV,a[n@lL/+W*_!?L*3h' );
define( 'NONCE_SALT',       'U f9 ,U?^)P}O$#?=:.@NWivGS{S~SWyER3@ICW/{K-+#S8gXhg[<h`,eJB3^kaz' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';