enum Region {
  Africa,
  Americas,
  Antarctic,
  AntarcticOcean,
  Asia,
  Europe,
  Oceania,
  Polar,
  Unknown,
}

Region parseRegion(String? region) {
  switch (region) {
    case 'Africa':
      return Region.Africa;
    case 'Americas':
      return Region.Americas;
    case 'Antarctic':
      return Region.Antarctic;
    case 'Antarctic Ocean':
      return Region.AntarcticOcean;
    case 'Asia':
      return Region.Asia;
    case 'Europe':
      return Region.Europe;
    case 'Oceania':
      return Region.Oceania;
    case 'Polar':
      return Region.Polar;
    default:
      return Region.Unknown;
  }
}
