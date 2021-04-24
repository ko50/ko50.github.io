import 'dart:io';

const double widthBreakpoint = 630;

const int transitionDefaultDuration = 400;

const Duration footerAnimateDuration = Duration(milliseconds: 500);

const Duration footerCloseDelay = Duration(milliseconds: 700);

const Duration drawerAnimateDuration = Duration(milliseconds: 200);

final String apiUriRoot =
    Platform.environment['PORTFOLIO_API_HOST'] ?? 'https://nanimitenda.com';
