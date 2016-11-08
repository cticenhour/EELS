#ifndef EELSAPP_H
#define EELSAPP_H

#include "MooseApp.h"

class EelsApp;

template<>
InputParameters validParams<EelsApp>();

class EelsApp : public MooseApp
{
public:
  EelsApp(InputParameters parameters);
  virtual ~EelsApp();

  static void registerApps();
  static void registerObjects(Factory & factory);
  static void associateSyntax(Syntax & syntax, ActionFactory & action_factory);
};

#endif /* EELSAPP_H */
