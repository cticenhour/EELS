#ifndef FIELDMAGNITUDE_H
#define FIELDMAGNITUDE_H

#include "AuxKernel.h"

class FieldMagnitude;

template<>
InputParameters validParams<FieldMagnitude>();

/**
 *  An AuxKernel to calculate the field magnitude given imaginary and real field components
 */
class  FieldMagnitude : public AuxKernel
{
public:
  FieldMagnitude(const InputParameters & parameters);

protected:
  virtual Real computeValue() override;

private:

  const VariableValue & _real_field_val;

  const VariableValue & _imag_field_val;

};

#endif // FIELDMAGNITUDE_H
