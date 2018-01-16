#include "NORMALTEST.h"

template<>
InputParameters validParams<NORMALTEST>()
{
  InputParameters params = validParams<NodalNormalBC>();
  params.addClassDescription("A BC to test common use of the NodalNormals system in MOOSE.");
  params.addRequiredParam<Real>("value","Value of normal * u at the boundary.");
  return params;
}

NORMALTEST::NORMALTEST(const InputParameters & parameters)
  : NodalNormalBC(parameters),

    _value(getParam<Real>("value"))
{
}

Real
NORMALTEST::computeQpResidual()
{
  return _normal(1) * _u[_qp] - _value;
}
