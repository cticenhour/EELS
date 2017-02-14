#ifndef WAVEPHASE_H
#define WAVEPHASE_H

#include "AuxKernel.h"

class WavePhase;

template<>
InputParameters validParams<WavePhase>();

/**
 *    AuxKernel to calculate the phase of an electromagnetic wave
 */
class  WavePhase : public AuxKernel
{
public:
  WavePhase(const InputParameters & parameters);

protected:
  virtual Real computeValue() override;

private:

  const VariableValue & _real_field_val;

  const VariableValue & _imag_field_val;

};

#endif // WAVEPHASE_H
