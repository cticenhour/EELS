#include "WavePhase.h"

template<>
InputParameters validParams<WavePhase>()
{
  InputParameters params = validParams<AuxKernel>();
  params.addRequiredCoupledVar("coupled_real", "Real field component.");
  params.addRequiredCoupledVar("coupled_imag", "Imaginary field component.");
  return params;
}

WavePhase::WavePhase(const InputParameters & parameters) :
    AuxKernel(parameters),

    _real_field_val(coupledValue("coupled_real")),
    _imag_field_val(coupledValue("coupled_imag"))
{
}

Real
WavePhase::computeValue()
{
  return std::atan2(_imag_field_val[_qp] , _real_field_val[_qp]);
}
