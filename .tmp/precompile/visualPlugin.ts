import { Visual } from "../../src/visual";
var powerbiKey = "powerbi";
var powerbi = window[powerbiKey];

var dailyForecast37CCF68C0C98488FA56662385B251C3C = {
    name: 'dailyForecast37CCF68C0C98488FA56662385B251C3C',
    displayName: 'Daily Forecast',
    class: 'Visual',
    version: '0.2.0',
    apiVersion: '2.6.0',
    create: (options) => {
        if (Visual) {
            return new Visual(options);
        }

        console.error('Visual instance not found');
    },
    custom: true
};

if (typeof powerbi !== "undefined") {
    powerbi.visuals = powerbi.visuals || {};
    powerbi.visuals.plugins = powerbi.visuals.plugins || {};
    powerbi.visuals.plugins["dailyForecast37CCF68C0C98488FA56662385B251C3C"] = dailyForecast37CCF68C0C98488FA56662385B251C3C;
}

export default dailyForecast37CCF68C0C98488FA56662385B251C3C;