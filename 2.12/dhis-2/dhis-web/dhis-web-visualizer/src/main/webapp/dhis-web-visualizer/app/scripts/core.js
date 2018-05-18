DV.core = {
	instances: []
};

Ext.onReady( function() {
	
DV.core.getConfig = function() {
	var conf = {};

    conf.finals = {
        ajax: {
            path_visualizer: '../',
            path_api: '../../api/',
            path_commons: '../../dhis-web-commons-ajax-json/',
            initialize: 'initialize.action',
            redirect: 'dhis-web-commons-about/redirect.action',
            data_get: 'chartValues.json',
            indicator_get: 'indicatorGroups/',
            indicator_getall: 'indicators.json?paging=false&links=false',
            indicatorgroup_get: 'indicatorGroups.json?paging=false&links=false',
            dataelement_get: 'dataElementGroups/',
            dataelement_getall: 'dataElements.json?paging=false&links=false',
            dataelementgroup_get: 'dataElementGroups.json?paging=false&links=false',
            dataset_get: 'dataSets.json?paging=false&links=false',
            organisationunit_getbygroup: 'getOrganisationUnitPathsByGroup.action',
            organisationunit_getbylevel: 'getOrganisationUnitPathsByLevel.action',
            organisationunit_getbyids: 'getOrganisationUnitPaths.action',
            organisationunitgroup_getall: 'organisationUnitGroups.json?paging=false&links=false',
            organisationunitgroupset_get: 'getOrganisationUnitGroupSetsMinified.action',
            organisationunitlevel_getall: 'organisationUnitLevels.json?paging=false&links=false&viewClass=detailed',
            organisationunitchildren_get: 'getOrganisationUnitChildren.action',
            favorite_addorupdate: 'addOrUpdateChart.action',
            favorite_addorupdatesystem: 'addOrUpdateSystemChart.action',
            favorite_updatename: 'updateChartName.action',
            favorite_get: 'charts/',
            favorite_getall: 'getSystemAndCurrentUserCharts.action',
            favorite_delete: 'deleteCharts.action'
        },
        dimension: {
            data: {
                value: 'data',
                name: DV.i18n.data,
                dimensionName: 'dx',
                objectName: 'dx'
            },
            indicator: {
                value: 'indicator',
                name: DV.i18n.indicator,
                dimensionName: 'dx',
                objectName: 'in'
            },
            dataElement: {
                value: 'dataelement',
                name: DV.i18n.data_element,
                dimensionName: 'dx',
                objectName: 'de'
            },
            operand: {
				value: 'operand',
				name: 'Operand',
				dimensionName: 'dx',
				objectName: 'dc'
			},
            dataSet: {
				value: 'dataset',
                name: DV.i18n.dataset,
                dimensionName: 'dx',
                objectName: 'ds'
			},
            category: {
				name: DV.i18n.categories,
				dimensionName: 'co',
                objectName: 'co',
			},
            period: {
                value: 'period',
                name: DV.i18n.period,
                dimensionName: 'pe',
                objectName: 'pe',
            },
            fixedPeriod: {
				value: 'periods'
			},
			relativePeriod: {
				value: 'relativePeriods'
			},
            organisationUnit: {
                value: 'organisationUnits',
                name: DV.i18n.organisation_units,
                dimensionName: 'ou',
                objectName: 'ou',
            },
            dimension: {
				value: 'dimension'
				//objectName: 'di'
			},
			value: {
				value: 'value'
			}
        },
        chart: {
            series: 'series',
            category: 'category',
            filter: 'filter',
            column: 'column',
            stackedColumn: 'stackedColumn',
            bar: 'bar',
            stackedBar: 'stackedBar',
            line: 'line',
            area: 'area',
            pie: 'pie'
        },
        data: {
			domain: 'domain_',
			targetLine: 'targetline_',
			baseLine: 'baseline_',
			trendLine: 'trendline_'
		},
        image: {
            png: 'png',
            pdf: 'pdf'
        },
        cmd: {
            init: 'init_',
            none: 'none_',
			urlparam: 'id'
        },
        root: {
			id: 'root'
		}
    };

	dim = conf.finals.dimension;

	dim.objectNameMap = {};
	dim.objectNameMap[dim.data.objectName] = dim.data;
	dim.objectNameMap[dim.indicator.objectName] = dim.indicator;
	dim.objectNameMap[dim.dataElement.objectName] = dim.dataElement;
	dim.objectNameMap[dim.operand.objectName] = dim.operand;
	dim.objectNameMap[dim.dataSet.objectName] = dim.dataSet;
	dim.objectNameMap[dim.category.objectName] = dim.category;
	dim.objectNameMap[dim.period.objectName] = dim.period;
	dim.objectNameMap[dim.organisationUnit.objectName] = dim.organisationUnit;
	dim.objectNameMap[dim.dimension.objectName] = dim.dimension;

	conf.period = {
		relativePeriods: {
			'LAST_WEEK': 1,
			'LAST_4_WEEKS': 4,
			'LAST_12_WEEKS': 12,
			'LAST_MONTH': 1,
			'LAST_3_MONTHS': 3,
			'LAST_BIMONTH': 1,
			'LAST_6_BIMONTHS': 6,
			'LAST_12_MONTHS': 12,
			'LAST_QUARTER': 1,
			'LAST_4_QUARTERS': 4,
			'LAST_SIX_MONTH': 1,
			'LAST_2_SIXMONTHS': 2,
			'LAST_FINANCIAL_YEAR': 1,
			'LAST_5_FINANCIAL_YEARS': 6,
			'THIS_YEAR': 1,
			'LAST_YEAR': 1,
			'LAST_5_YEARS': 5
		},
		relativePeriodValueKeys: {
			'LAST_WEEK': 'lastWeek',
			'LAST_4_WEEKS': 'last4Weeks',
			'LAST_12_WEEKS': 'last12Weeks',
			'LAST_MONTH': 'lastMonth',
			'LAST_3_MONTHS': 'last3Months',
			'LAST_12_MONTHS': 'last12Months',
			'LAST_BIMONTH': 'lastBimonth',
			'LAST_6_BIMONTHS': 'last6BiMonths',
			'LAST_QUARTER': 'lastQuarter',
			'LAST_4_QUARTERS': 'last4Quarters',
			'LAST_SIX_MONTH': 'lastSixMonth',
			'LAST_2_SIXMONTHS': 'last2SixMonths',
			'LAST_FINANCIAL_YEAR': 'lastFinancialYear',
			'LAST_5_FINANCIAL_YEARS': 'last5FinancialYears',
			'THIS_YEAR': 'thisYear',
			'LAST_YEAR': 'lastYear',
			'LAST_5_YEARS': 'last5Years'
		},
		relativePeriodParamKeys: {
			'lastWeek': 'LAST_WEEK',
			'last4Weeks': 'LAST_4_WEEKS',
			'last12Weeks': 'LAST_12_WEEKS',
			'lastMonth': 'LAST_MONTH',
			'last3Months': 'LAST_3_MONTHS',
			'last12Months': 'LAST_12_MONTHS',
			'lastBimonth': 'LAST_BIMONTH',
			'last6BiMonths': 'LAST_6_BIMONTHS',
			'lastQuarter': 'LAST_QUARTER',
			'last4Quarters': 'LAST_4_QUARTERS',
			'lastSixMonth': 'LAST_SIX_MONTH',
			'last2SixMonths': 'LAST_2_SIXMONTHS',
			'lastFinancialYear': 'LAST_FINANCIAL_YEAR',
			'last5FinancialYears': 'LAST_5_FINANCIAL_YEARS',
			'thisYear': 'THIS_YEAR',
			'lastYear': 'LAST_YEAR',
			'last5Years': 'LAST_5_YEARS'
		},
		periodTypes: [
			{id: 'Daily', name: 'Daily'},
			{id: 'Weekly', name: 'Weekly'},
			{id: 'Monthly', name: 'Monthly'},
			{id: 'BiMonthly', name: 'BiMonthly'},
			{id: 'Quarterly', name: 'Quarterly'},
			{id: 'SixMonthly', name: 'SixMonthly'},
			{id: 'Yearly', name: 'Yearly'},
			{id: 'FinancialOct', name: 'FinancialOct'},
			{id: 'FinancialJuly', name: 'FinancialJuly'},
			{id: 'FinancialApril', name: 'FinancialApril'}
		]
	};

    conf.chart = {
        style: {
            inset: 30,
            fontFamily: 'Arial,Sans-serif,Lucida Grande,Ubuntu'
        },
        theme: {
            dv1: ['#94ae0a', '#0b3b68', '#a61120', '#ff8809', '#7c7474', '#a61187', '#ffd13e', '#24ad9a', '#a66111', '#414141', '#4500c4', '#1d5700']
        }
    };

    conf.statusbar = {
		icon: {
			error: 'error_s.png',
			warning: 'warning.png',
			ok: 'ok.png'
		}
	};

    conf.layout = {
        west_width: 424,
        west_fieldset_width: 416,
        west_width_padding: 4,
        west_fill: 2,
        west_fill_accordion_indicator: 59,
        west_fill_accordion_dataelement: 59,
        west_fill_accordion_dataset: 33,
        west_fill_accordion_period: 296,
        west_fill_accordion_organisationunit: 62,
        west_maxheight_accordion_indicator: 350,
        west_maxheight_accordion_dataelement: 350,
        west_maxheight_accordion_dataset: 350,
        west_maxheight_accordion_period: 513,
        west_maxheight_accordion_organisationunit: 500,
        west_maxheight_accordion_group: 350,
        west_scrollbarheight_accordion_indicator: 300,
        west_scrollbarheight_accordion_dataelement: 300,
        west_scrollbarheight_accordion_dataset: 300,
        west_scrollbarheight_accordion_period: 450,
        west_scrollbarheight_accordion_organisationunit: 450,
        west_scrollbarheight_accordion_group: 300,
        east_tbar_height: 31,
        east_gridcolumn_height: 30,
        form_label_width: 55,
        window_favorite_ypos: 100,
        window_confirm_width: 250,
        window_share_width: 500,
        grid_favorite_width: 420,
        grid_row_height: 27,
        treepanel_minheight: 135,
        treepanel_maxheight: 400,
        treepanel_fill_default: 310,
        treepanel_toolbar_menu_width_group: 140,
        treepanel_toolbar_menu_width_level: 120,
        multiselect_minheight: 100,
        multiselect_maxheight: 250,
        multiselect_fill_default: 345,
        multiselect_fill_reportingrates: 315
    };

	return conf;
};

DV.core.getUtil = function(dv) {
	var util = {};

	util.array = {
		sortDimensions: function(dimensions, key) {
			key = key || 'dimensionName';

			// Sort object order
			Ext.Array.sort(dimensions, function(a,b) {
				if (a[key] < b[key]) {
					return -1;
				}
				if (a[key] > b[key]) {
					return 1;
				}
				return 0;
			});

			// Sort object items order
			for (var i = 0, dim; i < dimensions.length; i++) {
				dim = dimensions[i];

				if (dim.items) {
					dimensions[i].items.sort();
				}
			}

			return dimensions;
		},

		sortObjectsByString: function(array, key) {
			key = key || 'name';
			array.sort( function(a, b) {
				var nameA = a[key].toLowerCase(),
					nameB = b[key].toLowerCase();

				if (nameA < nameB) {
					return -1;
				}
				if (nameA > nameB) {
					return 1;
				}
				return 0;
			});
			return array;
		}
	};

	util.window = {
		setAnchorPosition: function(w, target) {
			var vpw = dv.viewport.getWidth(),
				targetx = target ? target.getPosition()[0] : 4,
				winw = w.getWidth(),
				y = target ? target.getPosition()[1] + target.getHeight() + 4 : 33;

			if ((targetx + winw) > vpw) {
				w.setPosition((vpw - winw - 2), y);
			}
			else {
				w.setPosition(targetx, y);
			}
		},
		addHideOnBlurHandler: function(w) {
			var el = Ext.get(Ext.query('.x-mask')[0]);

			el.on('click', function() {
				if (w.hideOnBlur) {
					w.hide();
				}
			});

			w.hasHideOnBlurHandler = true;
		},
		addDestroyOnBlurHandler: function(w) {
			var el = Ext.get(Ext.query('.x-mask')[0]);

			el.on('click', function() {
				if (w.destroyOnBlur) {
					w.destroy();
				}
			});

			w.hasDestroyOnBlurHandler = true;
		}
	};

	util.mask = {
		showMask: function(cmp, str) {
			if (DV.mask) {
				DV.mask.destroy();
			}
			DV.mask = new Ext.LoadMask(cmp, {msg: str});
			DV.mask.show();
		},
		hideMask: function() {
			if (DV.mask) {
				DV.mask.hide();
			}
		}
	};

	util.number = {
		isInteger: function(n) {
			var str = new String(n);
			if (str.indexOf('-') > -1) {
				var d = str.substr(str.indexOf('-') + 1);
				return (d.length === 1 && d == '0');
			}
			return false;
		},
		allValuesAreIntegers: function(values) {
			for (var i = 0; i < values.length; i++) {
				if (!this.isInteger(values[i].value)) {
					return false;
				}
			}
			return true;
		},
		getChartAxisFormatRenderer: function() {
			return this.allValuesAreIntegers(DV.value.values) ? '0' : '0.0';
		}
	};

	util.value = {
		jsonfy: function(values) {
			var a = [];
			for (var i = 0; i < values.length; i++) {
				var v = {
					value: parseFloat(values[i][0]),
					data: values[i][1],
					period: values[i][2],
					organisationunit: values[i][3]
				};
				a.push(v);
			}
			return a;
		}
	};

	util.chart = {
		getExtendedLayout: function(layout) {
			var dimConf = dv.conf.finals.dimension,
				layout = Ext.clone(layout),
				xLayout = {
					columns: [],
					rows: [],
					filters: [],

					columnObjectNames: [],
					columnDimensionNames: [],
					columnItems: [],
					columnIds: [],
					rowObjectNames: [],
					rowDimensionNames: [],
					rowItems: [],
					rowIds: [],

					// Axis
					axisDimensions: [],
					axisObjectNames: [],
					axisDimensionNames: [],

						// For param string
					sortedAxisDimensionNames: [],

					// Filter
					filterDimensions: [],
					filterObjectNames: [],
					filterDimensionNames: [],
					filterItems: [],
					filterIds: [],

						// For param string
					sortedFilterDimensions: [],

					// All
					dimensions: [],
					objectNames: [],
					dimensionNames: [],

					// Object name maps
					objectNameDimensionsMap: {},
					objectNameItemsMap: {},
					objectNameIdsMap: {},

					// Dimension name maps
					dimensionNameDimensionsMap: {},
					dimensionNameItemsMap: {},
					dimensionNameIdsMap: {},

						// For param string
					dimensionNameSortedIdsMap: {}
				};

			Ext.applyIf(xLayout, layout);

			// Columns, rows, filters
			if (layout.columns) {
				for (var i = 0, dim, items, xDim; i < layout.columns.length; i++) {
					dim = layout.columns[i];
					items = dim.items;
					xDim = {};

					xDim.dimension = dim.dimension;
					xDim.objectName = dim.dimension;
					xDim.dimensionName = dimConf.objectNameMap[dim.dimension].dimensionName;

					if (items) {
						xDim.items = items;
						xDim.ids = [];

						for (var j = 0; j < items.length; j++) {
							xDim.ids.push(items[j].id);
						}
					}

					xLayout.columns.push(xDim);

					xLayout.columnObjectNames.push(xDim.objectName);
					xLayout.columnDimensionNames.push(xDim.dimensionName);
					xLayout.columnItems = xLayout.columnItems.concat(xDim.items);
					xLayout.columnIds = xLayout.columnIds.concat(xDim.ids);

					xLayout.axisDimensions.push(xDim);
					xLayout.axisObjectNames.push(xDim.objectName);
					xLayout.axisDimensionNames.push(dimConf.objectNameMap[xDim.objectName].dimensionName);

					xLayout.objectNameDimensionsMap[xDim.objectName] = xDim;
					xLayout.objectNameItemsMap[xDim.objectName] = xDim.items;
					xLayout.objectNameIdsMap[xDim.objectName] = xDim.ids;
				}
			}

			if (layout.rows) {
				for (var i = 0, dim, items, xDim; i < layout.rows.length; i++) {
					dim = layout.rows[i];
					items = dim.items;
					xDim = {};

					xDim.dimension = dim.dimension;
					xDim.objectName = dim.dimension;
					xDim.dimensionName = dimConf.objectNameMap[dim.dimension].dimensionName;

					if (items) {
						xDim.items = items;
						xDim.ids = [];

						for (var j = 0; j < items.length; j++) {
							xDim.ids.push(items[j].id);
						}
					}

					xLayout.rows.push(xDim);

					xLayout.rowObjectNames.push(xDim.objectName);
					xLayout.rowDimensionNames.push(xDim.dimensionName);
					xLayout.rowItems = xLayout.rowItems.concat(xDim.items);
					xLayout.rowIds = xLayout.rowIds.concat(xDim.ids);

					xLayout.axisDimensions.push(xDim);
					xLayout.axisObjectNames.push(xDim.objectName);
					xLayout.axisDimensionNames.push(dimConf.objectNameMap[xDim.objectName].dimensionName);

					xLayout.objectNameDimensionsMap[xDim.objectName] = xDim;
					xLayout.objectNameItemsMap[xDim.objectName] = xDim.items;
					xLayout.objectNameIdsMap[xDim.objectName] = xDim.ids;
				}
			}

			if (layout.filters) {
				for (var i = 0, dim, items, xDim; i < layout.filters.length; i++) {
					dim = layout.filters[i];
					items = dim.items;
					xDim = {};

					xDim.dimension = dim.dimension;
					xDim.objectName = dim.dimension;
					xDim.dimensionName = dimConf.objectNameMap[dim.dimension].dimensionName;

					if (items) {
						xDim.items = items;
						xDim.ids = [];

						for (var j = 0; j < items.length; j++) {
							xDim.ids.push(items[j].id);
						}
					}

					xLayout.filters.push(xDim);

					xLayout.filterDimensions.push(xDim);
					xLayout.filterObjectNames.push(xDim.objectName);
					xLayout.filterDimensionNames.push(dimConf.objectNameMap[xDim.objectName].dimensionName);
					xLayout.filterItems = xLayout.filterItems.concat(xDim.items);
					xLayout.filterIds = xLayout.filterIds.concat(xDim.ids);

					xLayout.objectNameDimensionsMap[xDim.objectName] = xDim;
					xLayout.objectNameItemsMap[xDim.objectName] = xDim.items;
					xLayout.objectNameIdsMap[xDim.objectName] = xDim.ids;
				}
			}

			// Unique dimension names
			xLayout.axisDimensionNames = Ext.Array.unique(xLayout.axisDimensionNames);
			xLayout.filterDimensionNames = Ext.Array.unique(xLayout.filterDimensionNames);

			xLayout.columnDimensionNames = Ext.Array.unique(xLayout.columnDimensionNames);
			xLayout.rowDimensionNames = Ext.Array.unique(xLayout.rowDimensionNames);
			xLayout.filterDimensionNames = Ext.Array.unique(xLayout.filterDimensionNames);

				// For param string
			xLayout.sortedAxisDimensionNames = Ext.clone(xLayout.axisDimensionNames).sort();
			xLayout.sortedFilterDimensions = dv.util.array.sortDimensions(Ext.clone(xLayout.filterDimensions));

			// All
			xLayout.dimensions = [].concat(xLayout.axisDimensions, xLayout.filterDimensions);
			xLayout.objectNames = [].concat(xLayout.axisObjectNames, xLayout.filterObjectNames);
			xLayout.dimensionNames = [].concat(xLayout.axisDimensionNames, xLayout.filterDimensionNames);

			// Dimension name maps
			for (var i = 0, dimName; i < xLayout.dimensionNames.length; i++) {
				dimName = xLayout.dimensionNames[i];

				xLayout.dimensionNameDimensionsMap[dimName] = [];
				xLayout.dimensionNameItemsMap[dimName] = [];
				xLayout.dimensionNameIdsMap[dimName] = [];
			}

			for (var i = 0, xDim; i < xLayout.dimensions.length; i++) {
				xDim = xLayout.dimensions[i];

				xLayout.dimensionNameDimensionsMap[xDim.dimensionName].push(xDim);
				xLayout.dimensionNameItemsMap[xDim.dimensionName] = xLayout.dimensionNameItemsMap[xDim.dimensionName].concat(xDim.items);
				xLayout.dimensionNameIdsMap[xDim.dimensionName] = xLayout.dimensionNameIdsMap[xDim.dimensionName].concat(xDim.ids);
			}

				// For param string
			for (var key in xLayout.dimensionNameIdsMap) {
				if (xLayout.dimensionNameIdsMap.hasOwnProperty(key)) {
					xLayout.dimensionNameSortedIdsMap[key] = Ext.clone(xLayout.dimensionNameIdsMap[key]).sort();
				}
			}

			return xLayout;
		},

		getParamString: function(xLayout, isSorted) {
			var axisDimensionNames = isSorted ? xLayout.sortedAxisDimensionNames : xLayout.axisDimensionNames,
				filterDimensions = isSorted ? xLayout.sortedFilterDimensions : xLayout.filterDimensions,
				dimensionNameIdsMap = isSorted ? xLayout.dimensionNameSortedIdsMap : xLayout.dimensionNameIdsMap,
				paramString = '?',
				dimConf = dv.conf.finals.dimension,
				addCategoryDimension = false,
				map = xLayout.dimensionNameItemsMap,
				dx = dimConf.indicator.dimensionName;

			for (var i = 0, dimName, items; i < axisDimensionNames.length; i++) {
				dimName = axisDimensionNames[i];

				paramString += 'dimension=' + dimName;

				items = Ext.clone(dimensionNameIdsMap[dimName]);

				if (dimName === dx) {
					for (var j = 0, index; j < items.length; j++) {
						index = items[j].indexOf('-');

						if (index > 0) {
							addCategoryDimension = true;
							items[j] = items[j].substr(0, index);
						}
					}

					items = Ext.Array.unique(items);
				}

				if (dimName !== dimConf.category.dimensionName) {
					paramString += ':' + items.join(';');
				}

				if (i < (axisDimensionNames.length - 1)) {
					paramString += '&';
				}
			}

			if (addCategoryDimension) {
				paramString += '&dimension=' + dv.conf.finals.dimension.category.dimensionName;
			}

			if (Ext.isArray(filterDimensions) && filterDimensions.length) {
				for (var i = 0, dim; i < filterDimensions.length; i++) {
					dim = filterDimensions[i];

					paramString += '&filter=' + dim.dimensionName + ':' + dim.ids.join(';');
				}
			}

			return paramString;
		},

		createChart: function(layout, dv) {
			var dimConf = dv.conf.finals.dimension,
				getSyncronizedXLayout,
				getExtendedResponse,
				getDefaultStore,
				getDefaultNumericAxis,
				getDefaultCategoryAxis,
				getDefaultSeries,
				getDefaultTrendLines,
				getDefaultTargetLine,
				getDefaultBaseLine,
				getDefaultTips,
				getDefaultChartTitle,
				getDefaultChart,
				validateUrl,
				generator = {},
				initialize;

			getSyncronizedXLayout = function(xLayout, response) {
				var dimensions = [].concat(xLayout.columns, xLayout.rows, xLayout.filters),
					xOuDimension = xLayout.objectNameDimensionsMap[dimConf.organisationUnit.objectName],
					isUserOrgunit = xOuDimension && Ext.Array.contains(xOuDimension.ids, 'USER_ORGUNIT'),
					isUserOrgunitChildren = xOuDimension && Ext.Array.contains(xOuDimension.ids, 'USER_ORGUNIT_CHILDREN'),
					isLevel = function() {
						if (xOuDimension && Ext.isArray(xOuDimension.ids)) {
							for (var i = 0; i < xOuDimension.ids.length; i++) {
								if (xOuDimension.ids[i].substr(0,5) === 'LEVEL') {
									return true;
								}
							}
						}
						
						return false;
					}(),
					ou = dimConf.organisationUnit.objectName,
					layout;

				// Set items from init/metaData/xLayout
				for (var i = 0, dim, metaDataDim, items; i < dimensions.length; i++) {
					dim = dimensions[i];
					dim.items = [];
					metaDataDim = response.metaData[dim.objectName];

					// If ou and children
					if (dim.dimensionName === ou) {
						if (isUserOrgunit || isUserOrgunitChildren) {
							if (isUserOrgunit) {
								dim.items = dim.items.concat(dv.init.user.ou);
							}
							if (isUserOrgunitChildren) {
								dim.items = dim.items.concat(dv.init.user.ouc);
							}
						}
						else if (isLevel) {
							
							// Items: get ids from metadata -> items
							for (var j = 0, ids = Ext.clone(response.metaData[dim.dimensionName]); j < ids.length; j++) {
								dim.items.push({
									id: ids[j],
									name: response.metaData.names[ids[j]]
								});
								
								dim.items = dv.util.array.sortObjectsByString(dim.items);
							}
						}
						else {
							dim.items = Ext.clone(xLayout.dimensionNameItemsMap[dim.dimensionName]);
						}
					}
					else {
						// Items: get ids from metadata -> items
						if (Ext.isArray(metaDataDim) && dim.dimensionName !== dimConf.organisationUnit.dimensionName) {
							for (var j = 0, ids = Ext.clone(response.metaData[dim.dimensionName]); j < ids.length; j++) {
								dim.items.push({id: ids[j]});
							}
						}
						// Items: get items from xLayout
						else {
							dim.items = Ext.clone(xLayout.dimensionNameItemsMap[dim.dimensionName]);
						}
					}
				}

				layout = dv.api.layout.Layout(xLayout);

				return layout ? dv.util.chart.getExtendedLayout(layout) : null;
			};

			validateResponse = function(response) {
				if (!(response && Ext.isObject(response))) {
					alert('Data response invalid');
					return false;
				}

				if (!(response.headers && Ext.isArray(response.headers) && response.headers.length)) {
					alert('Data response invalid');
					return false;
				}

				if (!(Ext.isNumber(response.width) && response.width > 0 &&
					  Ext.isNumber(response.height) && response.height > 0 &&
					  Ext.isArray(response.rows) && response.rows.length > 0)) {
					alert('No values found');
					return false;
				}

				if (response.headers.length !== response.rows[0].length) {
					alert('Data response invalid');
					return false;
				}

				return true;
			};

			getExtendedResponse = function(response, xLayout) {
				response.nameHeaderMap = {};
				response.idValueMap = {};
				ids = [];

				var extendHeaders = function() {

					// Extend headers: index, items, size
					for (var i = 0, header; i < response.headers.length; i++) {
						header = response.headers[i];

						// Index
						header.index = i;

						if (header.meta) {

							// Items
							header.items = Ext.clone(xLayout.dimensionNameIdsMap[header.name]) || [];

							// Size
							header.size = header.items.length;

							// Collect ids, used by extendMetaData
							ids = ids.concat(header.items);
						}
					}

					// nameHeaderMap (headerName: header)
					for (var i = 0, header; i < response.headers.length; i++) {
						header = response.headers[i];

						response.nameHeaderMap[header.name] = header;
					}
				}();

				var extendMetaData = function() {
					for (var i = 0, id, splitId ; i < ids.length; i++) {
						id = ids[i];

						if (id.indexOf('-') !== -1) {
							splitId = id.split('-');
							response.metaData.names[id] = response.metaData.names[splitId[0]] + ' ' + response.metaData.names[splitId[1]];
						}
					}
				}();

				var createValueIdMap = function() {
					var valueHeaderIndex = response.nameHeaderMap[dv.conf.finals.dimension.value.value].index,
						coHeader = response.nameHeaderMap[dv.conf.finals.dimension.category.dimensionName],
						axisDimensionNames = xLayout.axisDimensionNames,
						idIndexOrder = [];

					// idIndexOrder
					for (var i = 0; i < axisDimensionNames.length; i++) {
						idIndexOrder.push(response.nameHeaderMap[axisDimensionNames[i]].index);

						// If co exists in response, add co after dx
						if (coHeader && axisDimensionNames[i] === dv.conf.finals.dimension.data.dimensionName) {
							idIndexOrder.push(coHeader.index);
						}
					}

					// idValueMap
					for (var i = 0, row, id; i < response.rows.length; i++) {
						row = response.rows[i];
						id = '';

						for (var j = 0; j < idIndexOrder.length; j++) {
							id += row[idIndexOrder[j]];
						}

						response.idValueMap[id] = parseFloat(row[valueHeaderIndex]);
					}
				}();

				var getMinMax = function() {
					var valueIndex = response.nameHeaderMap.value.index,
						values = [];

					for (var i = 0; i < response.rows.length; i++) {
						values.push(parseFloat(response.rows[i][valueIndex]));
					}

					response.min = Ext.Array.min(values);
					response.max = Ext.Array.max(values);
				}();

				return response;
			};

			validateUrl = function(url) {
				if (!Ext.isString(url) || url.length > 2000) {
					var percent = ((url.length - 2000) / url.length) * 100;
					alert('Too many parameters selected. Please reduce the number of parameters by at least ' + percent.toFixed(0) + '%.');
					return;
				}

				return true;
			};

			getDefaultStore = function(xResponse, xLayout) {
				var pe = dv.conf.finals.dimension.period.dimensionName,
					columnDimensionName = xLayout.columns[0].dimensionName,
					rowDimensionName = xLayout.rows[0].dimensionName,

					data = [],
					columnIds = xLayout.columnIds,
					rowIds = xLayout.rowIds,
					trendLineFields = [],
					targetLineFields = [],
					baseLineFields = [],
					store;

				// Data
				for (var i = 0, obj, category; i < rowIds.length; i++) {
					obj = {};
					category = rowIds[i];

					obj[dv.conf.finals.data.domain] = xResponse.metaData.names[category];
					for (var j = 0, id; j < columnIds.length; j++) {
						id = dv.util.str.replaceAll(columnIds[j], '-', '') + dv.util.str.replaceAll(rowIds[i], '-', '');
						//id = columnIds[j].replace('-', '') + rowIds[i].replace('-', '');

						obj[columnIds[j]] = xResponse.idValueMap[id];
					}

					data.push(obj);
				}

				// Trend lines
				if (xLayout.showTrendLine) {
					for (var i = 0, regression, key; i < columnIds.length; i++) {
						regression = new SimpleRegression();
						key = dv.conf.finals.data.trendLine + columnIds[i];

						for (var j = 0; j < data.length; j++) {
							regression.addData(j, data[j][columnIds[i]]);
						}

						for (var j = 0; j < data.length; j++) {
							data[j][key] = parseFloat(regression.predict(j).toFixed(1));
						}

						trendLineFields.push(key);
						xResponse.metaData.names[key] = DV.i18n.trend + ' (' + xResponse.metaData.names[columnIds[i]] + ')';
					}
				}

				// Target line
				if (Ext.isNumber(xLayout.targetLineValue) || Ext.isNumber(parseFloat(xLayout.targetLineValue))) {
					for (var i = 0; i < data.length; i++) {
						data[i][dv.conf.finals.data.targetLine] = parseFloat(xLayout.targetLineValue);
					}

					targetLineFields.push(dv.conf.finals.data.targetLine);
				}

				// Base line
				if (Ext.isNumber(xLayout.baseLineValue) || Ext.isNumber(parseFloat(xLayout.baseLineValue))) {
					for (var i = 0; i < data.length; i++) {
						data[i][dv.conf.finals.data.baseLine] = parseFloat(xLayout.baseLineValue);
					}

					baseLineFields.push(dv.conf.finals.data.baseLine);
				}

				store = Ext.create('Ext.data.Store', {
					fields: function() {
						var fields = Ext.clone(columnIds);
						fields.push(dv.conf.finals.data.domain);
						fields = fields.concat(trendLineFields, targetLineFields, baseLineFields);

						return fields;
					}(),
					data: data
				});

				store.rangeFields = columnIds;
				store.domainFields = [dv.conf.finals.data.domain];
				store.trendLineFields = trendLineFields;
				store.targetLineFields = targetLineFields;
				store.baseLineFields = baseLineFields;
				store.numericFields = [].concat(store.rangeFields, store.trendLineFields, store.targetLineFields, store.baseLineFields);

				store.getMaximum = function() {
					var maximums = [];

					for (var i = 0; i < store.numericFields.length; i++) {
						maximums.push(store.max(store.numericFields[i]));
					}

					return Ext.Array.max(maximums);
				};

				store.getMinimum = function() {
					var minimums = [];

					for (var i = 0; i < store.numericFields.length; i++) {
						minimums.push(store.max(store.numericFields[i]));
					}

					return Ext.Array.min(minimums);
				};

				store.getMaximumSum = function() {
					var sums = [],
						recordSum = 0;

					store.each(function(record) {
						recordSum = 0;

						for (var i = 0; i < store.rangeFields.length; i++) {
							recordSum += record.data[store.rangeFields[i]];
						}

						sums.push(recordSum);
					});

					return Ext.Array.max(sums);
				};


console.log("data", data);
console.log("rangeFields", store.rangeFields);
console.log("domainFields", store.domainFields);
console.log("trendLineFields", store.trendLineFields);
console.log("targetLineFields", store.targetLineFields);
console.log("baseLineFields", store.baseLineFields);

				return store;
			};

			getDefaultNumericAxis = function(store, xResponse, xLayout) {
				var typeConf = dv.conf.finals.chart,
					minimum = store.getMinimum(),
					maximum,
					axis;

				// Set maximum if stacked + extra line
				if ((xLayout.type === typeConf.stackedColumn || xLayout.type === typeConf.stackedBar) &&
					(xLayout.showTrendLine || xLayout.targetLineValue || xLayout.baseLineValue)) {
					var a = [store.getMaximum(), store.getMaximumSum()];
					maximum = Math.ceil(Ext.Array.max(a) * 1.1);
					maximum = Math.floor(maximum / 10) * 10;
				}

				axis = {
					type: 'Numeric',
					position: 'left',
					fields: store.numericFields,
					minimum: minimum < 0 ? minimum : 0,
					label: {
						renderer: Ext.util.Format.numberRenderer('0,0')
					},
					grid: {
						odd: {
							opacity: 1,
							stroke: '#aaa',
							'stroke-width': 0.1
						},
						even: {
							opacity: 1,
							stroke: '#aaa',
							'stroke-width': 0.1
						}
					}
				};

				if (maximum) {
					axis.maximum = maximum;
				}

				if (xLayout.rangeAxisTitle) {
					axis.title = xLayout.rangeAxisTitle;
				}

				return axis;
			};

			getDefaultCategoryAxis = function(store, xLayout) {
				var axis = {
					type: 'Category',
					position: 'bottom',
					fields: store.domainFields,
					label: {
						rotate: {
							degrees: 330
						}
					}
				};

				if (xLayout.domainAxisTitle) {
					axis.title = xLayout.domainAxisTitle;
				}

				return axis;
			};

			getDefaultSeriesTitle = function(store, xResponse) {
				var a = [];

				for (var i = 0, id, ids; i < store.rangeFields.length; i++) {
					id = store.rangeFields[i];
					a.push(xResponse.metaData.names[id]);
				}

				return a;
			};

			getDefaultSeries = function(store, xResponse, xLayout) {
				var main = {
					type: 'column',
					axis: 'left',
					xField: store.domainFields,
					yField: store.rangeFields,
					style: {
						opacity: 0.8,
						lineWidth: 3
					},
					markerConfig: {
						type: 'circle',
						radius: 4
					},
					tips: getDefaultTips(),
					title: getDefaultSeriesTitle(store, xResponse)
				};

				if (xLayout.showValues) {
					main.label = {
						display: 'outside',
						'text-anchor': 'middle',
						field: store.rangeFields,
						font: dv.conf.chart.style.fontFamily
					};
				}

				return main;
			};

			getDefaultTrendLines = function(store, xResponse) {
				var a = [];

				for (var i = 0; i < store.trendLineFields.length; i++) {
					a.push({
						type: 'line',
						axis: 'left',
						xField: store.domainFields,
						yField: store.trendLineFields[i],
						style: {
							opacity: 0.8,
							lineWidth: 3,
							'stroke-dasharray': 8
						},
						markerConfig: {
							type: 'circle',
							radius: 0
						},
						title: xResponse.metaData.names[store.trendLineFields[i]]
					});
				}

				return a;
			};

			getDefaultTargetLine = function(store, xLayout) {
				return {
					type: 'line',
					axis: 'left',
					xField: store.domainFields,
					yField: store.targetLineFields,
					style: {
						opacity: 1,
						lineWidth: 2,
						'stroke-width': 1,
						stroke: '#041423'
					},
					showMarkers: false,
					title: (Ext.isString(xLayout.targetLineTitle) ? xLayout.targetLineTitle : DV.i18n.target) + ' (' + xLayout.targetLineValue + ')'
				};
			};

			getDefaultBaseLine = function(store, xLayout) {
				return {
					type: 'line',
					axis: 'left',
					xField: store.domainFields,
					yField: store.baseLineFields,
					style: {
						opacity: 1,
						lineWidth: 2,
						'stroke-width': 1,
						stroke: '#041423'
					},
					showMarkers: false,
					title: (Ext.isString(xLayout.baseLineTitle) ? xLayout.baseLineTitle : DV.i18n.base) + ' (' + xLayout.baseLineValue + ')'
				};
			};

			getDefaultTips = function() {
				return {
					trackMouse: true,
					cls: 'dv-chart-tips',
					renderer: function(si, item) {
						this.update('<div style="text-align:center"><div style="font-size:17px; font-weight:bold">' + item.value[1] + '</div><div style="font-size:10px">' + si.data[dv.conf.finals.data.domain] + '</div></div>');
					}
				};
			};

			setDefaultTheme = function(store, xLayout) {
				var colors = dv.conf.chart.theme.dv1.slice(0, store.rangeFields.length);

				if (xLayout.targetLineValue || xLayout.baseLineValue) {
					colors.push('#051a2e');
				}

				if (xLayout.targetLineValue) {
					colors.push('#051a2e');
				}

				if (xLayout.baseLineValue) {
					colors.push('#051a2e');
				}

				Ext.chart.theme.dv1 = Ext.extend(Ext.chart.theme.Base, {
					constructor: function(config) {
						Ext.chart.theme.Base.prototype.constructor.call(this, Ext.apply({
							seriesThemes: colors,
							colors: colors
						}, config));
					}
				});
			};

			getDefaultLegend = function(store, xLayout, xResponse) {
				var itemLength = 30,
					charLength = 7,
					numberOfItems,
					numberOfChars = 0,
					str = '',
					width,
					isVertical = false,
					position = 'top',
					padding = 0;

				if (xLayout.type === dv.conf.finals.chart.pie) {
					numberOfItems = store.getCount();
					store.each(function(r) {
						str += r.data[store.domainFields[0]];
					});
				}
				else {
					numberOfItems = store.rangeFields.length;

					for (var i = 0, name, ids; i < store.rangeFields.length; i++) {
						if (store.rangeFields[i].indexOf('-') !== -1) {
							ids = store.rangeFields[i].split('-');
							name = xResponse.metaData.names[ids[0]] + ' ' + xResponse.metaData.names[ids[1]];
						}
						else {
							name = xResponse.metaData.names[store.rangeFields[i]];
						}

						str += name;
					}
				}

				numberOfChars = str.length;

				width = (numberOfItems * itemLength) + (numberOfChars * charLength);
//alert(width + ' > ' + dv.viewport.centerRegion.getWidth() + '\n' + str);

				if (width > dv.viewport.centerRegion.getWidth() - 50) {
					isVertical = true;
					position = 'right';
				}

				if (position === 'right') {
					padding = 5;
				}

				return Ext.create('Ext.chart.Legend', {
					position: position,
					isVertical: isVertical,
					labelFont: '13px ' + dv.conf.chart.style.fontFamily,
					boxStroke: '#ffffff',
					boxStrokeWidth: 0,
					padding: padding
				});
			};

			getDefaultChartTitle = function(store, xResponse, xLayout) {
				var ids = xLayout.filterIds,
					a = [],
					text = '',
					fontSize;

				if (xLayout.type === dv.conf.finals.chart.pie) {
					ids = ids.concat(xLayout.columnIds);
				}

				if (Ext.isArray(ids) && ids.length) {
					for (var i = 0; i < ids.length; i++) {
						text += xResponse.metaData.names[ids[i]];
						text += i < ids.length - 1 ? ', ' : '';
					}
				}

				if (xLayout.title) {
					text = xLayout.title;
				}

				fontSize = (dv.viewport.centerRegion.getWidth() / text.length) < 11.6 ? 13 : 18;

				return Ext.create('Ext.draw.Sprite', {
					type: 'text',
					text: text,
					font: 'bold ' + fontSize + 'px ' + dv.conf.chart.style.fontFamily,
					fill: '#111',
					height: 20,
					y: 	20
				});
			};

			getDefaultChartSizeHandler = function() {
				return function() {
					this.animate = false;
					this.setWidth(dv.viewport.centerRegion.getWidth());
					this.setHeight(dv.viewport.centerRegion.getHeight() - 25);
					this.animate = true;
				};
			};

			getDefaultChartTitlePositionHandler = function() {
				return function() {
					if (this.items) {
						var title = this.items[0],
							legend = this.legend,
							legendCenterX,
							titleX;

						if (this.legend.position === 'top') {
							legendCenterX = legend.x + (legend.width / 2);
							titleX = legendCenterX - (title.el.getWidth() / 2);
						}
						else {
							var legendWidth = legend ? legend.width : 0;
							titleX = (this.width / 2) - (title.el.getWidth() / 2);
						}

						title.setAttributes({
							x: titleX
						}, true);
					}
				};
			};

			getDefaultChart = function(store, axes, series, xResponse, xLayout) {
				var chart,
					config = {
						store: store,
						axes: axes,
						series: series,
						animate: true,
						shadow: false,
						insetPadding: 35,
						width: dv.viewport.centerRegion.getWidth(),
						height: dv.viewport.centerRegion.getHeight() - 25,
						theme: 'dv1'
					};

				// Legend
				if (!xLayout.hideLegend) {
					config.legend = getDefaultLegend(store, xLayout, xResponse);

					if (config.legend.position === 'right') {
						config.insetPadding = 40;
					}
				}

				// Title
				if (!xLayout.hideTitle) {
					config.items = [getDefaultChartTitle(store, xResponse, xLayout)];
				}
				else {
					config.insetPadding = 10;
				}

				chart = Ext.create('Ext.chart.Chart', config);

				chart.setChartSize = getDefaultChartSizeHandler();
				chart.setTitlePosition = getDefaultChartTitlePositionHandler();

				chart.onViewportResize = function() {
					chart.setChartSize();
					chart.redraw();
					chart.setTitlePosition();
				};

				chart.on('afterrender', function() {
					chart.setTitlePosition();
				});

				return chart;
			};

			generator.column = function(xResponse, xLayout) {
				var store = getDefaultStore(xResponse, xLayout),
					numericAxis = getDefaultNumericAxis(store, xResponse, xLayout),
					categoryAxis = getDefaultCategoryAxis(store, xLayout),
					axes = [numericAxis, categoryAxis],
					series = [getDefaultSeries(store, xResponse, xLayout)];

				// Options
				if (xLayout.showTrendLine) {
					series = getDefaultTrendLines(store, xResponse).concat(series);
				}

				if (xLayout.targetLineValue) {
					series.push(getDefaultTargetLine(store, xLayout));
				}

				if (xLayout.baseLineValue) {
					series.push(getDefaultBaseLine(store, xLayout));
				}

				// Theme
				setDefaultTheme(store, xLayout);

				return getDefaultChart(store, axes, series, xResponse, xLayout);
			};

			generator.stackedColumn = function(xResponse, xLayout) {
				var chart = this.column(xResponse, xLayout);

				for (var i = 0, item; i < chart.series.items.length; i++) {
					item = chart.series.items[i];

					if (item.type === dv.conf.finals.chart.column) {
						item.stacked = true;
					}
				}

				return chart;
			};

			generator.bar = function(xResponse, xLayout) {
				var store = getDefaultStore(xResponse, xLayout),
					numericAxis = getDefaultNumericAxis(store, xResponse, xLayout),
					categoryAxis = getDefaultCategoryAxis(store, xLayout),
					axes,
					series = getDefaultSeries(store, xResponse, xLayout),
					trendLines,
					targetLine,
					baseLine,
					chart;

				// Axes
				numericAxis.position = 'bottom';
				categoryAxis.position = 'left';
				axes = [numericAxis, categoryAxis];

				// Series
				series.type = 'bar';
				series.axis = 'bottom';

				// Options
				if (xLayout.showValues) {
					series.label = {
						display: 'outside',
						'text-anchor': 'middle',
						field: store.rangeFields
					};
				}

				series = [series];

				if (xLayout.showTrendLine) {
					trendLines = getDefaultTrendLines(store, xResponse);

					for (var i = 0; i < trendLines.length; i++) {
						trendLines[i].axis = 'bottom';
						trendLines[i].xField = store.trendLineFields[i];
						trendLines[i].yField = store.domainFields;
					}

					series = trendLines.concat(series);
				}

				if (xLayout.targetLineValue) {
					targetLine = getDefaultTargetLine(store, xLayout);
					targetLine.axis = 'bottom';
					targetLine.xField = store.targetLineFields;
					targetLine.yField = store.domainFields;

					series.push(targetLine);
				}

				if (xLayout.baseLineValue) {
					baseLine = getDefaultBaseLine(store, xLayout);
					baseLine.axis = 'bottom';
					baseLine.xField = store.baseLineFields;
					baseLine.yField = store.domainFields;

					series.push(baseLine);
				}

				// Theme
				setDefaultTheme(store, xLayout);

				return getDefaultChart(store, axes, series, xResponse, xLayout);
			};

			generator.stackedBar = function(xResponse, xLayout) {
				var chart = this.bar(xResponse, xLayout);

				for (var i = 0, item; i < chart.series.items.length; i++) {
					item = chart.series.items[i];

					if (item.type === dv.conf.finals.chart.bar) {
						item.stacked = true;
					}
				}

				return chart;
			};

			generator.line = function(xResponse, xLayout) {
				var store = getDefaultStore(xResponse, xLayout),
					numericAxis = getDefaultNumericAxis(store, xResponse, xLayout),
					categoryAxis = getDefaultCategoryAxis(store, xLayout),
					axes = [numericAxis, categoryAxis],
					series = [],
					colors = dv.conf.chart.theme.dv1.slice(0, store.rangeFields.length),
					seriesTitles = getDefaultSeriesTitle(store, xResponse);

				// Series
				for (var i = 0, line; i < store.rangeFields.length; i++) {
					line = {
						type: 'line',
						axis: 'left',
						xField: store.domainFields,
						yField: store.rangeFields[i],
						style: {
							opacity: 0.8,
							lineWidth: 3
						},
						markerConfig: {
							type: 'circle',
							radius: 4
						},
						tips: getDefaultTips(),
						title: seriesTitles[i]
					};

					//if (xLayout.showValues) {
						//line.label = {
							//display: 'over',
							//field: store.rangeFields[i]
						//};
					//}

					series.push(line);
				}

				// Options, theme colors
				if (xLayout.showTrendLine) {
					series = getDefaultTrendLines(store, xResponse).concat(series);

					colors = colors.concat(colors);
				}

				if (xLayout.targetLineValue) {
					series.push(getDefaultTargetLine(store, xLayout));

					colors.push('#051a2e');
				}

				if (xLayout.baseLineValue) {
					series.push(getDefaultBaseLine(store, xLayout));

					colors.push('#051a2e');
				}

				// Theme
				Ext.chart.theme.dv1 = Ext.extend(Ext.chart.theme.Base, {
					constructor: function(config) {
						Ext.chart.theme.Base.prototype.constructor.call(this, Ext.apply({
							seriesThemes: colors,
							colors: colors
						}, config));
					}
				});

				return getDefaultChart(store, axes, series, xResponse, xLayout);
			};

			generator.area = function(xResponse, xLayout) {
				var store = getDefaultStore(xResponse, xLayout),
					numericAxis = getDefaultNumericAxis(store, xResponse, xLayout),
					categoryAxis = getDefaultCategoryAxis(store, xLayout),
					axes = [numericAxis, categoryAxis],
					series = getDefaultSeries(store, xResponse, xLayout);

				series.type = 'area';
				series.style.opacity = 0.7;
				series.style.lineWidth = 0;
				delete series.label;
				delete series.tips;
				series = [series];

				// Options
				if (xLayout.showTrendLine) {
					series = getDefaultTrendLines(store, xResponse).concat(series);
				}

				if (xLayout.targetLineValue) {
					series.push(getDefaultTargetLine(store, xLayout));
				}

				if (xLayout.baseLineValue) {
					series.push(getDefaultBaseLine(store, xLayout));
				}

				// Theme
				setDefaultTheme(store, xLayout);

				return getDefaultChart(store, axes, series, xResponse, xLayout);
			};

			generator.pie = function(xResponse, xLayout) {
				var store = getDefaultStore(xResponse, xLayout),
					series,
					colors,
					chart,
					label = {
						field: dv.conf.finals.data.domain
					};

				// Label
				if (xLayout.showValues) {
					label.display = 'middle';
					label.contrast = true;
					label.font = '14px ' + dv.conf.chart.style.fontFamily;
					label.renderer = function(value) {
						var record = store.getAt(store.findExact(dv.conf.finals.data.domain, value));
						return record.data[store.rangeFields[0]];
					};
				}

				// Series
				series = [{
					type: 'pie',
					field: store.rangeFields[0],
					donut: 7,
					showInLegend: true,
					highlight: {
						segment: {
							margin: 5
						}
					},
					label: label,
					style: {
						opacity: 0.8,
						stroke: '#555'
					},
					tips: {
						trackMouse: true,
						cls: 'dv-chart-tips',
						renderer: function(item) {
							this.update('<div style="text-align:center"><div style="font-size:17px; font-weight:bold">' + item.data[store.rangeFields[0]] + '</div><div style="font-size:10px">' + item.data[dv.conf.finals.data.domain] + '</div></div>');
						}
					}
				}];

				// Theme
				colors = dv.conf.chart.theme.dv1.slice(0, xResponse.nameHeaderMap[xLayout.rowDimensionNames[0]].items.length);

				Ext.chart.theme.dv1 = Ext.extend(Ext.chart.theme.Base, {
					constructor: function(config) {
						Ext.chart.theme.Base.prototype.constructor.call(this, Ext.apply({
							seriesThemes: colors,
							colors: colors
						}, config));
					}
				});

				// Chart
				chart = getDefaultChart(store, null, series, xResponse, xLayout);
				//chart.legend.position = 'right';
				//chart.legend.isVertical = true;
				chart.insetPadding = 40;
				chart.shadow = true;

				return chart;
			};

			initialize = function() {
				var url,
					xLayout,
					xResponse,
					chart;

				xLayout = util.chart.getExtendedLayout(layout);

				dv.paramString = util.chart.getParamString(xLayout, true);
				url = dv.init.contextPath + '/api/analytics.json' + dv.paramString;				

				if (!validateUrl(url)) {
					return;
				}

				dv.util.mask.showMask(dv.viewport);

				Ext.Ajax.request({
					method: 'GET',
					url: url,
					callbackName: 'analytics',
					timeout: 60000,
					headers: {
						'Content-Type': 'application/json',
						'Accept': 'application/json'
					},
					disableCaching: false,
					failure: function(r) {
						dv.util.mask.hideMask();
						alert(r.responseText);
					},
					success: function(r) {
						var html,
							response = Ext.decode(r.responseText);

						if (!validateResponse(response)) {
							dv.util.mask.hideMask();
							return;
						}

						xLayout = getSyncronizedXLayout(xLayout, response);

						if (!xLayout) {
							dv.util.mask.hideMask();
							return;
						}

						xResponse = getExtendedResponse(response, xLayout);

						chart = generator[xLayout.type](xResponse, xLayout);

						dv.viewport.centerRegion.removeAll(true);
						dv.viewport.centerRegion.add(chart);

						// After table success
						dv.util.mask.hideMask();

						if (dv.viewport.downloadButton) {
							dv.viewport.downloadButton.enable();
						}

						dv.chart = chart;
						dv.layout = layout;
						dv.xLayout = xLayout;
						dv.xResponse = xResponse;

console.log("xResponse", xResponse);
console.log("xLayout", xLayout);
console.log("layout", layout);
					}
				});

			}();
		},

		loadChart: function(id) {
			if (!Ext.isString(id)) {
				alert('Invalid id');
				return;
			}

			Ext.Ajax.request({
				url: dv.baseUrl + '/api/charts/' + id + '.json?viewClass=dimensional&links=false',
				method: 'GET',
				failure: function(r) {
					dv.util.mask.hideMask();
					alert(r.responseText);
				},
				success: function(r) {
					var layoutConfig = Ext.decode(r.responseText),
						layout = dv.api.layout.Layout(layoutConfig);

					if (layout) {
						dv.favorite = Ext.clone(layout);
						dv.favorite.id = layoutConfig.id;
						dv.favorite.name = layoutConfig.name;

						dv.viewport.setFavorite(layout);
					}
				}
			});
		}
	};

	return util;
};

DV.core.getApi = function(dv) {
	var dimConf = dv.conf.finals.dimension,
		api = {
			layout: {
				Record: null,
				Dimension: null,
				Layout: null
			},
			response: {
				Header: null,
				Response: null
			}
		};

	// Layout

	api.layout.Record = function(config) {
		var record = {};

		// id: string

		return function() {
			if (!Ext.isObject(config)) {
				console.log('Record config is not an object: ' + config);
				return;
			}

			if (!Ext.isString(config.id)) {
				alert('Record id is not text: ' + config);
				return;
			}

			record.id = config.id.replace('.', '-');

			if (Ext.isString(config.name)) {
				record.name = config.name;
			}

			return Ext.clone(record);
		}();
	};

	api.layout.Dimension = function(config) {
		var dimension = {};

		// dimension: string

		// items: [Record]

		return function() {
			if (!Ext.isObject(config)) {
				console.log('Dimension config is not an object: ' + config);
				return;
			}

			if (!Ext.isString(config.dimension)) {
				console.log('Dimension name is not text: ' + config);
				return;
			}

			if (config.dimension !== dv.conf.finals.dimension.category.objectName) {
				var records = [];

				if (!Ext.isArray(config.items)) {
					console.log('Dimension items is not an array: ' + config);
					return;
				}

				for (var i = 0; i < config.items.length; i++) {
					record = api.layout.Record(config.items[i]);

					if (record) {
						records.push(record);
					}
				}

				config.items = records;

				if (!config.items.length) {
					console.log('Dimension has no valid items: ' + config);
					return;
				}
			}

			dimension.dimension = config.dimension;
			dimension.items = config.items;

			return Ext.clone(dimension);
		}();
	};

	api.layout.Layout = function(config) {
		var layout = {};

		// type: string ('column') - 'column', 'stackedColumn', 'bar', 'stackedBar', 'line', 'area', 'pie'

		// columns: [Dimension]

		// rows: [Dimension]

		// filters: [Dimension]

		// showTrendLine: boolean (false)

		// targetLineValue: number

		// targetLineTitle: string

		// baseLineValue: number

		// baseLineTitle: string

		// showValues: boolean (true)

		// hideLegend: boolean (false)

		// hideTitle: boolean (false)

		// domainAxisTitle: string

		// rangeAxisTitle: string

		// userOrganisationUnit: boolean (false)

		// userOrganisationUnitChildren: boolean (false)

		// parentGraphMap: object

		var getValidatedDimensionArray = function(dimensionArray) {
			var dimensions = [];

			if (!(dimensionArray && Ext.isArray(dimensionArray) && dimensionArray.length)) {
				return;
			}

			for (var i = 0, dimension; i < dimensionArray.length; i++) {
				dimension = api.layout.Dimension(dimensionArray[i]);

				if (dimension) {
					dimensions.push(dimension);
				}
			}

			dimensionArray = dimensions;

			return dimensionArray.length ? dimensionArray : null;
		};

		return function() {
			var a = [],
				objectNames = [],
				dimConf = dv.conf.finals.dimension,
				dims,
				isOu = false,
				isOuc = false;

			config.columns = getValidatedDimensionArray(config.columns);
			config.rows = getValidatedDimensionArray(config.rows);
			config.filters = getValidatedDimensionArray(config.filters);

			// Config must be an object
			if (!(config && Ext.isObject(config))) {
				console.log(dv.el + ': Layout config is not an object');
				return;
			}

			// Series, category, filter
			if (!config.columns) {
				alert('No series dimension specified');
				return;
			}
			if (!config.rows) {
				alert('No category dimension specified');
				return;
			}
			if (!config.filters) {
				alert('No filter dimensions specified');
				return;
			}

			// Get object names and isOu/isOuc
			for (var i = 0, dim, dims = [].concat(config.columns, config.rows, config.filters); i < dims.length; i++) {
				dim = dims[i];

				if (dim) {

					// Object names
					if (Ext.isString(dim.dimension)) {
						objectNames.push(dim.dimension);
					}

					// isOu/isOuc
					if (dim.dimension === dimConf.organisationUnit.objectName && Ext.isArray(dim.items)) {
						for (var j = 0; j < dim.items.length; j++) {
							if (dim.items[j].id === 'USER_ORGUNIT') {
								isOu = true;
							}
							else if (dim.items[j].id === 'USER_ORGUNIT_CHILDREN') {
								isOuc = true;
							}
						}
					}
				}
			}

			if (!Ext.Array.contains(objectNames, dimConf.period.objectName)) {
				alert('At least one period must be specified as series, category or filter');
				return;
			}

			// Layout
			layout.type = config.type;

			layout.columns = config.columns;
			layout.rows = config.rows;
			layout.filters = config.filters;

			// Properties
			layout.showTrendLine = Ext.isBoolean(config.regression) ? config.regression : (Ext.isBoolean(config.showTrendLine) ? config.showTrendLine : false);
			layout.showValues = Ext.isBoolean(config.showData) ? config.showData : (Ext.isBoolean(config.showValues) ? config.showValues : true);

			layout.hideLegend = Ext.isBoolean(config.hideLegend) ? config.hideLegend : false;
			layout.hideTitle = Ext.isBoolean(config.hideTitle) ? config.hideTitle : false;

			layout.targetLineValue = Ext.isNumber(config.targetLineValue) ? config.targetLineValue : undefined;
			layout.targetLineTitle = Ext.isString(config.targetLineLabel) && !Ext.isEmpty(config.targetLineLabel) ? config.targetLineLabel :
				(Ext.isString(config.targetLineTitle) && !Ext.isEmpty(config.targetLineTitle) ? config.targetLineTitle : undefined);
			layout.baseLineValue = Ext.isNumber(config.baseLineValue) ? config.baseLineValue : undefined;
			layout.baseLineTitle = Ext.isString(config.baseLineLabel) && !Ext.isEmpty(config.baseLineLabel) ? config.baseLineLabel :
				(Ext.isString(config.baseLineTitle) && !Ext.isEmpty(config.baseLineTitle) ? config.baseLineTitle : undefined);

			layout.title = Ext.isString(config.title) &&  !Ext.isEmpty(config.title) ? config.title : undefined;
			layout.domainAxisTitle = Ext.isString(config.domainAxisLabel) && !Ext.isEmpty(config.domainAxisLabel) ? config.domainAxisLabel :
				(Ext.isString(config.domainAxisTitle) && !Ext.isEmpty(config.domainAxisTitle) ? config.domainAxisTitle : undefined);
			layout.rangeAxisTitle = Ext.isString(config.rangeAxisLabel) && !Ext.isEmpty(config.rangeAxisLabel) ? config.rangeAxisLabel :
				(Ext.isString(config.rangeAxisTitle) && !Ext.isEmpty(config.rangeAxisTitle) ? config.rangeAxisTitle : undefined);

			layout.userOrganisationUnit = isOu;
			layout.userOrganisationUnitChildren = isOuc;

			layout.parentGraphMap = Ext.isObject(config.parentGraphMap) ? config.parentGraphMap : undefined;

			return Ext.clone(layout);
		}();
	};

	// Response

	api.response.Header = function(config) {
		var header = {};

		// name: string

		// meta: boolean

		return function() {
			if (!Ext.isObject(config)) {
				console.log('Header is not an object: ' + config);
				return;
			}

			if (!Ext.isString(config.name)) {
				console.log('Header name is not text: ' + config);
				return;
			}

			if (!Ext.isBoolean(config.meta)) {
				console.log('Header meta is not boolean: ' + config);
				return;
			}

			header.name = config.name;
			header.meta = config.meta;

			return Ext.clone(header);
		}();
	};

	api.response.Response = function(config) {
		var response = {};

		// headers: [Header]

		return function() {
			var headers = [];

			if (!(config && Ext.isObject(config))) {
				alert('Data response invalid');
				return false;
			}

			if (!(config.headers && Ext.isArray(config.headers))) {
				alert('Data response invalid');
				return false;
			}

			for (var i = 0, header; i < config.headers.length; i++) {
				header = api.response.Header(config.headers[i]);

				if (header) {
					headers.push(header);
				}
			}

			config.headers = headers;

			if (!config.headers.length) {
				alert('No valid response headers');
				return;
			}

			if (!(Ext.isArray(config.rows) && config.rows.length > 0)) {
				alert('No values found');
				return false;
			}

			if (config.headers.length !== config.rows[0].length) {
				alert('Data invalid');
				return false;
			}

			response.headers = config.headers;
			response.metaData = config.metaData;
			response.width = config.width;
			response.height = config.height;
			response.rows = config.rows;

			return response;
		}();
	};

	return api;
};

DV.core.getInstance = function(config) {
	var dv = {};

	dv.baseUrl = config && config.baseUrl ? config.baseUrl : '../../';
	dv.el = config && config.el ? config.el : 'app';

	dv.conf = DV.core.getConfig();
	dv.util = DV.core.getUtil(dv);
	dv.api = DV.core.getApi(dv);

	return dv;
};

});
