#include "AbsorbingBC.h"

template<>
InputParameters validParams<AbsorbingBC>()
{
  InputParameters params = validParams<IntegratedBC>();

  params.addRequiredParam<Real>("k", "Wave number.");
  params.addRequiredCoupledVar("coupled_var", "Coupled Field Variable.");
  params.addRequiredParam<std::string>("num_type", "Real or imaginary variable type");
  return params;
}

AbsorbingBC::AbsorbingBC(const InputParameters & parameters) :
      IntegratedBC(parameters),

      _k(getParam<Real>("k")),
      _coupled_field_var_val(coupledValue("coupled_var")),
      _num_type(getParam<std::string>("num_type"))

{
  if (_num_type.compare("real") == 0) {
    _sign = 1.;
  } else if (_num_type.compare("imaginary") == 0) {
    _sign = -1.;
  }
}

Real AbsorbingBC::computeQpResidual() {
  return -_sign * _k * _coupled_field_var_val[_qp];
}
