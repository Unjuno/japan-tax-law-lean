import JapanTaxLaw.LocalTax731PurposeTaxTenthThresholdSpec

/- Kernel-decided boundary checks for 「道府県又は市町村は、当該道府県又は市町村の法定外目的税の一の納税義務者（納税義務者となるべき者を含む。以下本項において同じ。）であつて当該納税義務者に対して課すべき当該法定外目的税の課税標準の合計が当該法定外目的税の課税標準の合計の十分の一を継続的に超えると見込まれる者として総務省令で定めるもの（以下本項において「特定納税義務者」という。）であるものがある場合において、当該法定外目的税の新設又は変更をする旨の条例を制定しようとするときは、当該道府県又は市町村の議会において、当該特定納税義務者の意見を聴くものとする。」. -/
namespace JapanTaxLaw.LocalTax731PurposeTaxTenthThreshold

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 100 = false := by decide  -- zero
example : inScopeBool 9 100 = false := by decide  -- threshold_below / small_input
example : inScopeBool 10 100 = false := by decide  -- threshold_at (STRICT: equality excluded)
example : inScopeBool 11 100 = true := by decide  -- threshold_above
example : inScope 11 100 := by unfold inScope; decide  -- threshold_above (Prop)
example : ¬ inScope 10 100 := by unfold inScope; decide  -- threshold_at (STRICT, Prop)
example : inScope 11 100 ↔ specInScope 11 100 := agree_scope 11 100
example (share total : Nat) : inScope share total ↔ specInScope share total := agree_scope share total

end JapanTaxLaw.LocalTax731PurposeTaxTenthThreshold
