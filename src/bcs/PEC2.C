#include "PEC2.h"

template<>
InputParameters validParams<PEC2>()
{
  InputParameters params = validParams<NodalNormalBC>();
  params.addClassDescription("Pefect Electrical Conductor (PEC) tangential field BC (normal x E = 0), using NodalNormals system.");
  params.addRequiredCoupledVar("Field_0", "Coupled Field Variable, 0 direction");
  params.addRequiredCoupledVar("Field_1", "Coupled Field Variable, 1 direction");
  params.addRequiredCoupledVar("Field_2", "Coupled Field Variable, 2 direction");
  return params;
}

PEC2::PEC2(const InputParameters & parameters)
  : NodalNormalBC(parameters),

  _field_0(coupledValue("Field_0")),
  _field_1(coupledValue("Field_1")),
  _field_2(coupledValue("Field_2"))
{
}

Real
PEC2::computeQpResidual()
{
  return (_normal(0) - _normal(1)) * _field_0[_qp] + (_normal(1) - _normal(2)) * _field_1[_qp] + (_normal(2) - _normal(0)) * _field_2[_qp];
}
