/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

import './bootstrap';
import Alpine from 'alpinejs';
import focus from '@alpinejs/focus';
window.Alpine = Alpine;
import ApexCharts from 'apexcharts'
import areaChart from "./areaChart"
import columnChart from "./columnChart"
import multiColumnChart from "./multiColumnChart"
import lineChart from "./lineChart"
import multiLineChart from "./multiLineChart"
import pieChart from "./pieChart"
import radarChart from "./radarChart"
import treeMapChart from "./treeMapChart"
import radialChart from "./radialChart"

window.ApexCharts = ApexCharts
window.livewireChartsAreaChart = areaChart
window.livewireChartsColumnChart = columnChart
window.livewireChartsLineChart = lineChart
window.livewireChartsMultiLineChart = multiLineChart
window.livewireChartsPieChart = pieChart
window.livewireChartsMultiColumnChart = multiColumnChart
window.livewireChartsRadarChart = radarChart
window.livewireChartsTreeMapChart = treeMapChart
window.livewireChartsRadialChart = radialChart

Alpine.start();
import jQuery from 'jquery';
window.$ = jQuery;
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

// Vue.component('example-component', require('./components/ExampleComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

// window.onload = function () {
//     const main = new Vue({
//         el: '#app',
//         data: {
//             currentActivity: 'home'
//         }
//     });
// }
