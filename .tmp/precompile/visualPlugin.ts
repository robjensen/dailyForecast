import { Visual } from "../../src/visual";
var powerbiKey = "powerbi";
var powerbi = window[powerbiKey];

var sampleRHTMLVisual93DE4F20C40A415BBEDD632DCF0C1CC0 = {
    name: 'sampleRHTMLVisual93DE4F20C40A415BBEDD632DCF0C1CC0',
    displayName: 'sampleRHTMLVisual',
    class: 'Visual',
    version: '1.0.0',
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
    powerbi.visuals.plugins["sampleRHTMLVisual93DE4F20C40A415BBEDD632DCF0C1CC0"] = sampleRHTMLVisual93DE4F20C40A415BBEDD632DCF0C1CC0;
}

export default sampleRHTMLVisual93DE4F20C40A415BBEDD632DCF0C1CC0;