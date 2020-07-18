/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

const firebase = require("firebase");
require("firebase/firestore");
firebase.initializeApp({
    apiKey: 'AIzaSyBrEwXPpQ7ou03cfeeOANbsJ-CLfqkvXGQ',
    projectId: 'marasiel-syria-93'
});
const db = firebase.firestore();
const dbAuth = firebase.auth();

window.Vue = require('vue');
import translations from '../lang/vue-translations.json'
//php artisan lang:js resources/lang/vue-translations.json --json
//ez6f60y3mjyc

Vue.component('pagination', require('laravel-vue-pagination'));
Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('user-component', require('./components/UserComponent.vue').default);
Vue.component('role-component', require('./components/RoleComponent.vue').default);
Vue.component('permission-component', require('./components/PermissionComponent.vue').default);
Vue.component('config-component', require('./components/ConfigComponent.vue').default);
Vue.component('settings-component', require('./components/SettingsComponent.vue').default);

require('../../Modules/Drivers/Resources/assets/js/app');

//git filter-branch --index-filter 'git rm -r --cached --ignore-unmatch marasielmansa.zip' HEAD
//ez6f60y3mjyc
const CONFIG = {

    API_URL: 'https://marasielapp.com/sy/public/api/',
    PATH: '/sy/public',
    //API_URL: 'http://localhost/marasielsy/public/api/',
    //PATH: '/marasielsy/public',
    LANG: translations,
    DB: db,
    dbAuth: dbAuth

}

export default CONFIG;

const app = new Vue({
    el: '#app',
});