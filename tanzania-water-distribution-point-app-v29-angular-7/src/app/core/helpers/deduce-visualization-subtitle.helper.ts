import * as _ from 'lodash';

export function deduceVisualizationSubtitle(filterDimensions: any[]) {
  const subtitleArray = _.map(filterDimensions, filterDimension => {
    return {
      dimension: filterDimension.dimension,
      subtitle: _.map(filterDimension.items, item => item.displayName).join(
        ', '
      )
    };
  });

  return _.map(
    _.filter(
      [
        _.find(subtitleArray, ['dimension', 'dx']),
        _.find(subtitleArray, ['dimension', 'ou']),
        _.find(subtitleArray, ['dimension', 'pe'])
      ],
      subtitleObject => subtitleObject
    ),
    (subtitleObject: any) => subtitleObject.subtitle
  ).join(' - ');
}
