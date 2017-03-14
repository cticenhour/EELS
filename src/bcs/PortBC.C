#include "Function.h"
#include "PortBC.h"

template<>
InputParameters validParams<PortBC>()
{
  InputParameters params = validParams<IntegratedBC>();
  params.addRequiredParam<FunctionName>("incoming_wave_fxn", "The incoming wave function.");
  params.addRequiredCoupledVar("coupled_var", "Coupled field value at the boundary");
  params.addRequiredParam<Real>("k", "Wave number of incoming wave.");
  params.addRequiredParam<std::string>("num_type", "Real or imaginary number type");
  return params;
}

PortBC::PortBC(const InputParameters & parameters) :
      IntegratedBC(parameters),

      _field_inc(getFunction("incoming_wave_fxn")),
      _coupled_var_val(coupledValue("coupled_var")),

      _k(getParam<Real>("k")),

      _num_type(getParam<std::string>("num_type"))

{
  if (_num_type.compare("real") == 0) {
    _sign = 1.;
  } else if (_num_type.compare("imaginary") == 0) {
    _sign = -1.;
  }
}

Real PortBC::computeQpResidual() {

  return _sign * _k * _field_inc.value(_t, _q_point[_qp]) - _sign * _k * _coupled_var_val[_qp];
}
