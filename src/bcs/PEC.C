#include "PEC.h"
#include <iostream>

template <>
InputParameters
validParams<PEC>()
{
  InputParameters params = validParams<IntegratedBC>();
  params.addClassDescription(
      "Perfect Electrical Conductor (PEC) Boundary Condition, where normal x E = 0");
  params.addRequiredCoupledVar("Field_0", "Coupled Field Variable, 0 direction");
  params.addRequiredCoupledVar("Field_1", "Coupled Field Variable, 1 direction");
  params.addRequiredCoupledVar("Field_2", "Coupled Field Variable, 2 direction");
  params.addRequiredParam<Real>("direction", "Variable Component Direction (0,1,2)");
  return params;
}

PEC::PEC(const InputParameters & parameters)
  : IntegratedBC(parameters),

    _field_0(coupledValue("Field_0")),
    _field_1(coupledValue("Field_1")),
    _field_2(coupledValue("Field_2")),

    _dir(getParam<Real>("direction"))
{
}

Real
PEC::computeQpResidual()
{

  _penalty = 1; //std::pow(10,3);

  if (_dir == 0 )
  {
    return -_penalty * _test[_i][_qp] * (_normals[_qp](1) * _u[_qp] - _normals[_qp](0) * _field_1[_qp]);

    //std::cout << _normals[_qp](0) << "   " << _q_point[_qp](0) << " " << _q_point[_qp](1) << " " << _q_point[_qp](2) << std::endl;
  }
  else if (_dir == 1)
  {
    return -_penalty * _test[_i][_qp] * (_normals[_qp](2) * _u[_qp] - _normals[_qp](1) * _field_2[_qp]);
  }
  else
  {
    return -_penalty * _test[_i][_qp] * (_normals[_qp](0) * _u[_qp] - _normals[_qp](2) * _field_0[_qp]);
  }
}
