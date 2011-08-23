<?php

/**
 * The current OR2U Blog version.
 */
define('OR2UB_VERSION', '2.0:beta1');

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function or2u_blog_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
}

/**
 * Implements hook_requirements().
 */
function or2u_blog_requirements($phase) {
  $requirements = array();
  $t = get_t();

  if ($phase == 'runtime') {
    $requirements['or2u_blog'] = array(
      'title' => $t('OR2U Blog'),
      'value' => or2u_blog_get_version(),
      'severity' => REQUIREMENT_INFO,
    );
  }

  return $requirements;
}

/**
 * Returns the full version of the project.
 */
function or2u_blog_get_version() {
  return VERSION . '/'. OR2UB_VERSION;
}