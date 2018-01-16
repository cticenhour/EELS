#include "AppFactory.h"
#include "EelsApp.h"
#include "Moose.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

// Kernels
#include "CoeffField.h"
#include "CoeffDiffusion.h"
#include "GradDiv.h"

// AuxKernels
#include "FieldMagnitude.h"
#include "WavePhase.h"

// Boundary Conditions
#include "AbsorbingBC.h"
#include "PortBC.h"
#include "PEC.h"
#include "NORMALTEST.h"
#include "PEC2.h"

template <> InputParameters validParams<EelsApp>() {
  InputParameters params = validParams<MooseApp>();

  params.set<bool>("use_legacy_uo_initialization") = false;
  params.set<bool>("use_legacy_uo_aux_computation") = false;
  params.set<bool>("use_legacy_output_syntax") = false;

  return params;
}

EelsApp::EelsApp(InputParameters parameters) : MooseApp(parameters) {
  Moose::registerObjects(_factory);
  ModulesApp::registerObjects(_factory);
  EelsApp::registerObjects(_factory);

  Moose::associateSyntax(_syntax, _action_factory);
  ModulesApp::associateSyntax(_syntax, _action_factory);
  EelsApp::associateSyntax(_syntax, _action_factory);
}

EelsApp::~EelsApp() {}

// External entry point for dynamic application loading
extern "C" void EelsApp__registerApps() { EelsApp::registerApps(); }
void EelsApp::registerApps() { registerApp(EelsApp); }

// External entry point for dynamic object registration
extern "C" void EelsApp__registerObjects(Factory &factory) {
  EelsApp::registerObjects(factory);
}
void EelsApp::registerObjects(Factory &factory) {
  registerKernel(CoeffField);
  registerKernel(CoeffDiffusion);
  registerKernel(GradDiv);
  registerAuxKernel(FieldMagnitude);
  registerAuxKernel(WavePhase);
  registerBoundaryCondition(PortBC);
  registerBoundaryCondition(AbsorbingBC);
  registerBoundaryCondition(PEC);
  registerBoundaryCondition(NORMALTEST);
  registerBoundaryCondition(PEC2);
}

// External entry point for dynamic syntax association
extern "C" void EelsApp__associateSyntax(Syntax &syntax,
                                         ActionFactory &action_factory) {
  EelsApp::associateSyntax(syntax, action_factory);
}
void EelsApp::associateSyntax(Syntax & /*syntax*/,
                              ActionFactory & /*action_factory*/) {}
