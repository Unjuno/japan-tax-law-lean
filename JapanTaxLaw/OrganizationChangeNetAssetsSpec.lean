import JapanTaxLaw.OrganizationChangeNetAssets

/-!
# OrganizationChangeNetAssets spec — independent restatement of the art.12 net-assets floor
Sources (pinned): law 342M50000040037, revision 342M50000040037_20260401_508M60000040008, art. 12(1).
Normative id: NORM|4be496509f8d5142008b02da6f331d4460799214070cf2cde97be1a7707d0711
Independent restatement: the residual is expressed with a guarded Nat
subtraction and `max` against the floor; the implementation uses two
conditional comparisons. Kernel agreement is decided, never assumed.
-/

namespace JapanTaxLaw.OrganizationChangeNetAssets

def specNetAssets (assets : Nat) (liabilities : Nat) (floorAmount : Nat) : Nat :=
  if assets <= liabilities then floorAmount
  else max (assets - liabilities) floorAmount

example : specNetAssets 100 40 10 = 60 := by decide
example : specNetAssets 100 40 80 = 80 := by decide

def agreeOrganizationChangeNetAssets : Bool :=
  [(0,0,0), (1,0,0), (100,0,10), (100,40,10), (100,40,80),
   (100,100,10), (50,100,10), (100,40,60)].all fun x =>
    netAssets x.1 x.2.1 x.2.2 == specNetAssets x.1 x.2.1 x.2.2

example : agreeOrganizationChangeNetAssets = true := by decide

end JapanTaxLaw.OrganizationChangeNetAssets
