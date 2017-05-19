#include "GradDiv.h"

template <>
InputParameters
validParams<GradDiv>()
{
  InputParameters params = validParams<Kernel>();
  params.addRequiredParam<Real>("dimension", "Dimension of kernel differentiation (0,1,2)");
  params.addRequiredCoupledVar("Field_0", "Field variable, 0 dimension");
  params.addRequiredCoupledVar("Field_1", "Field variable, 1 dimension");
  params.addRequiredCoupledVar("Field_2", "Field variable, 2 dimension");
  return params;
}

GradDiv::GradDiv(const InputParameters & parameters)
  : Kernel(parameters),

    _dim(getParam<Real>("dimension")),
    _field_0_grad(coupledGradient("Field_0")),
    _field_1_grad(coupledGradient("Field_1")),
    _field_2_grad(coupledGradient("Field_2"))
{
}

Real
GradDiv::computeQpResidual()
{
  if (_dim == 0)
  {
    return -_grad_test[_i][_qp](_dim) * (_grad_u[_qp](0) + _field_1_grad[_qp](1) + _field_2_grad[_qp](2));
  }
  else if (_dim == 1)
  {
    return -_grad_test[_i][_qp](_dim) * (_field_0_grad[_qp](0) + _grad_u[_qp](1) + _field_2_grad[_qp](2));
  }
  else if (_dim == 2)
  {
    return -_grad_test[_i][_qp](_dim) * (_field_0_grad[_qp](0) + _field_1_grad[_qp](1) + _grad_u[_qp](2));
  }
  else
  {
    return 0;
  }
}

Real
GradDiv::computeQpJacobian()
{

  if (_dim == 0)
  {
    return -_grad_test[_i][_qp](_dim) * (_grad_test[_j][_qp](0) + _field_1_grad[_qp](1) + _field_2_grad[_qp](2));
  }
  else if (_dim == 1)
  {
    return -_grad_test[_i][_qp](_dim) * (_field_0_grad[_qp](0) + _grad_test[_j][_qp](1) + _field_2_grad[_qp](2));
  }
  else if (_dim == 2)
  {
    return -_grad_test[_i][_qp](_dim) * (_field_0_grad[_qp](0) + _field_1_grad[_qp](1) + _grad_test[_j][_qp](2));
  }
  else
  {
    return 0;
  }
}
