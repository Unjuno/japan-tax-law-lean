import JapanTaxLaw.TaxFinance

/-
# LocalTax321_4TwoSpecialCollectors — pinned clause 「この場合において、特別徴収義務者として二以上の者を指定したときは、給与所得に係る特別徴収税額をこれらの者が当該年度中にそれぞれ支払うべき給与の額に按分して、これを徴収させることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 321_4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|70b342b4ac472f997d7d9ce79f12f8aeb9aa2264f13e6b89ed284798106a86b9.
原文逐語: 「この場合において、特別徴収義務者として二以上の者を指定したときは、給与所得に係る特別徴収税額をこれらの者が当該年度中にそれぞれ支払うべき給与の額に按分して、これを徴収させることができる。」
Scope: ONLY the inclusive 二以上 threshold of this clause. The notification,
approval, apportionment and all other procedures are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax321_4TwoSpecialCollectors

open JapanTaxLaw.TaxFinance

/-- 二 — 以上（inclusive） threshold (二以上の特別徴収義務者の指定). -/
def threshold : Nat := 2

/-- Statutory trigger 「この場合において、特別徴収義務者として二以上の者を指定したときは、給与所得に係る特別徴収税額をこれらの者が当該年度中にそれぞれ支払うべき給与の額に按分して、これを徴収させることができる。」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax321_4TwoSpecialCollectors
