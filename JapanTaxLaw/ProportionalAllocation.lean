import JapanTaxLaw.TaxFinance

/-!
# ProportionalAllocation — 85 の 按分規定

Pinned provisions state that an amount is allocated 按分 (pro rata) according
to a base such as population, employee count, floor area or asset value.
The pro-rata component is `total * part / whole` with Nat floor; `part` and
`whole` are caller-established. Where a statute splits the total into several
sub-totals (e.g. half by population, half by employees), only ONE such
pro-rata component is modelled here and the split is caller-established.
Not legal advice.
-/

namespace JapanTaxLaw.ProportionalAllocation

def allocate (total part whole : Nat) : Nat := total * part / whole

example : allocate 1_000 3 10 = 300 := by decide
example : allocate 1_000 0 10 = 0 := by decide
example : allocate 0 3 10 = 0 := by decide

end JapanTaxLaw.ProportionalAllocation
