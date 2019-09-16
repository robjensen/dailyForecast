/*
 *  Power BI Visualizations
 *
 *  Copyright (c) Microsoft Corporation
 *  All rights reserved.
 *  MIT License
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the ""Software""), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */

"use strict";

import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";
import DataViewObjectsParser = dataViewObjectsParser.DataViewObjectsParser;

export class VisualSettings extends DataViewObjectsParser {
  //RVIZ_IN_PBI_GUIDE:BEGIN:Added to enable user parameters
  public settings_model_params: settings_model_params = new settings_model_params();
  public settings_tseries_params: settings_tseries_params = new settings_tseries_params();
  public settings_forecast_params: settings_forecast_params = new settings_forecast_params();
  public settings_plan_params: settings_plan_params = new settings_plan_params();
  public settings_axes_params: settings_axes_params = new settings_axes_params();
  //RVIZ_IN_PBI_GUIDE:END:Added to enable user parameters  
}

//RVIZ_IN_PBI_GUIDE:BEGIN:Added to enable user parameters
export class settings_model_params {
  public forecastmodel: string = "mtd"
}

export class settings_tseries_params {
  public lineColorActual: string = "#000000";   
  public lineWeightActual: number = 10;
  public lineColorModel: string = "#005A8C";
  public lineWeightModel: number = 10;
  public conf1: string = "0.8";
  public conf2: string = "0.95";
}

export class settings_forecast_params {
  public lineColor: string = "#EF8200";   
  public weight: number = 10;
}

export class settings_plan_params {
  public lineColor: string = "#000000";   
  public weight: number = 10;
}

export class settings_axes_params {
  public textSize: number = 12;
  public sizeTicks: string = "6";  
}