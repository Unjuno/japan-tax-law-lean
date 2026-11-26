import JapanTaxLaw.TaxAccountantExamExemption

/-!
# TaxAccountantExamExemption spec — independent restatement of the art. 8 two-role aggregation
Sources (pinned): law 326AC1000000237, revision 326AC1000000237_20251001_505AC0000000053, art. 8(2).
Normative id: NORM|048aa353ea02c717841c6c88cc52e793e1aca0369d0e006568a840fd4a731f7d
Independent restatement: the conversion is expressed with an explicit
zero-guard and division; eligibility is the negation of a strict shortfall
of ten years, combined with the application flag. Kernel agreement is
decided on the listed grid, never assumed.
-/

namespace JapanTaxLaw.TaxAccountantExamExemption

def specConverted (prescribed : Nat) (actual : Nat) : Nat :=
  if prescribed = 0 then 0 else (actual * 10) / prescribed

def specEligible (p1 : Nat) (a1 : Nat) (p2 : Nat) (a2 : Nat)
    (applied : Bool) : Bool :=
  if applied then
    not (specConverted p1 a1 + specConverted p2 a2 < 10)
  else false

example : specEligible 10 5 10 5 true = true := by decide
example : specEligible 10 4 10 5 true = false := by decide

def agreeTaxAccountantExamExemption : Bool :=
  [(0,0,0,0,true), (10,9,10,0,true), (10,10,10,0,true),
   (10,11,10,0,true), (5,5,10,0,true), (10,4,10,5,true),
   (10,5,10,5,true), (10,5,10,5,false)].all fun x =>
    exemptionEligible x.1 x.2.1 x.2.2.1 x.2.2.2.1 x.2.2.2.2 ==
      specEligible x.1 x.2.1 x.2.2.1 x.2.2.2.1 x.2.2.2.2

example : agreeTaxAccountantExamExemption = true := by decide

end JapanTaxLaw.TaxAccountantExamExemption
