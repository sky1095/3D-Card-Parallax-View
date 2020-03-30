import 'package:flutter/material.dart';

class AppConfig {
  BuildContext _context;
  double _height;
  double _width;
  double _heightPadding;
  double _widthPadding;

  AppConfig(this._context) {
    MediaQueryData _queryData = MediaQuery.of(_context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding = _height -
        ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double returnHeight(double v) {
    return _height * v;
  }

  double returnWidth(double v) {
    return _width * v;
  }

  double returnHeightPadding(double v) {
    return _heightPadding * v;
  }

  double returnWidthPadding(double v) {
    return _widthPadding * v;
  }
}

