#include "PEC2.h"

template<>
InputParameters validParams<PEC2>()
{
  InputParameters params = validParams<NodalNormalBC>();
  params.addClassDescription("Version 2 of PEC BC (normal x E = 0), using NodalNormals system.");
  params.addRequiredCoupledVar("Field_0", "Coupled Field Variable, 0 direction");
  params.addRequiredCoupledVar("Field_1", "Coupled Field Variable, 1 direction");
  params.addRequiredCoupledVar("Field_2", "Coupled Field Variable, 2 direction");
  params.addRequiredParam<Real>("direction", "Variable Component Direction (0,1,2)");
  return params;
}

PEC2::PEC2(const InputParameters & parameters)
  : NodalNormalBC(parameters),

  _field_0(coupledValue("Field_0")),
  _field_1(coupledValue("Field_1")),
  _field_2(coupledValue("Field_2")),
  _dir(getParam<Real>("direction"))
{
}

Real
PEC2::computeQpResidual()
{
  if (_dir == 0 )
  {
    return -(_normal(1) * _u[_qp] - _normal(0) * _field_1[_qp]);

    //std::cout << _normals[_qp](0) << "   " << _q_point[_qp](0) << " " << _q_point[_qp](1) << " " << _q_point[_qp](2) << std::endl;
  }
  else if (_dir == 1)
  {
    return -(_normal(2) * _u[_qp] - _normal(1) * _field_2[_qp]);
  }
  else
  {
    return -(_normal(0) * _u[_qp] - _normal(2) * _field_0[_qp]);
  }
}
