#ifndef NORMALTEST_H
#define NORMALTEST_H

#include "NodalNormalBC.h"

class NORMALTEST;

template <>
InputParameters validParams<NORMALTEST>();

class NORMALTEST : public NodalNormalBC
{
public:
  NORMALTEST(const InputParameters & parameters);

protected:

  virtual Real computeQpResidual() override;

private:

  Real _value;

};

#endif // NORMALTEST_H
