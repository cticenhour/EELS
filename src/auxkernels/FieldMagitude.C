#include "FieldMagnitude.h"

template<>
InputParameters validParams<FieldMagnitude>()
{
  InputParameters params = validParams<AuxKernel>();
  params.addRequiredCoupledVar("coupled_real", "Real field component.");
  params.addRequiredCoupledVar("coupled_imag", "Imaginary field component.");
  return params;
}

FieldMagnitude::FieldMagnitude(const InputParameters & parameters) :
    AuxKernel(parameters),

    _real_field_val(coupledValue("coupled_real")),
    _imag_field_val(coupledValue("coupled_imag"))
{
}

Real
FieldMagnitude::computeValue()
{
  return std::sqrt(_imag_field_val[_qp] * _imag_field_val[_qp] + _real_field_val[_qp] * _real_field_val[_qp]);
}
