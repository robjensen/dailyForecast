import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";
import DataViewObjectsParser = dataViewObjectsParser.DataViewObjectsParser;
export declare class VisualSettings extends DataViewObjectsParser {
    settings_model_params: settings_model_params;
    settings_tseries_params: settings_tseries_params;
    settings_forecast_params: settings_forecast_params;
    settings_plan_params: settings_plan_params;
    settings_axes_params: settings_axes_params;
}
export declare class settings_model_params {
    forecastmodel: string;
}
export declare class settings_tseries_params {
    lineColorActual: string;
    lineWeightActual: number;
    lineColorModel: string;
    lineWeightModel: number;
    conf1: string;
    conf2: string;
}
export declare class settings_forecast_params {
    lineColor: string;
    weight: number;
}
export declare class settings_plan_params {
    lineColor: string;
    weight: number;
}
export declare class settings_axes_params {
    textSize: number;
    sizeTicks: string;
}
